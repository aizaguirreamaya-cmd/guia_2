import 'package:flutter/material.dart';
import 'datos_globales.dart';

class FormularioProductos extends StatefulWidget {
  const FormularioProductos({super.key});

  @override
  State<FormularioProductos> createState() => _FormularioProductosState();
}

class _FormularioProductosState extends State<FormularioProductos> {
  final _formKey = GlobalKey<FormState>();
  final _codigoC = TextEditingController();
  final _nombreC = TextEditingController();
  final _categoriaC = TextEditingController();
  final _precioC = TextEditingController();
  final _cantidadC = TextEditingController();

  @override
  void dispose() {
    _codigoC.dispose();
    _nombreC.dispose();
    _categoriaC.dispose();
    _precioC.dispose();
    _cantidadC.dispose();
    super.dispose();
  }

  void _guardar() {
    if (!_formKey.currentState!.validate()) return;
    final prod = Producto(
      codigo: _codigoC.text.trim(),
      nombre: _nombreC.text.trim(),
      categoria: _categoriaC.text.trim(),
      precio: double.parse(_precioC.text.trim()),
      cantidad: int.parse(_cantidadC.text.trim()),
    );
    final ok = agregarProducto(prod);
    if (!ok) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ya existe un producto con ese código')),
      );
      return;
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Producto registrado')));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Productos')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _codigoC,
                decoration: const InputDecoration(labelText: 'Código'),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Requerido' : null,
              ),
              TextFormField(
                controller: _nombreC,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Requerido' : null,
              ),
              TextFormField(
                controller: _categoriaC,
                decoration: const InputDecoration(labelText: 'Categoría'),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Requerido' : null,
              ),
              TextFormField(
                controller: _precioC,
                decoration: const InputDecoration(labelText: 'Precio'),
                keyboardType: TextInputType.number,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return 'Requerido';
                  final val = double.tryParse(v.trim());
                  if (val == null) return 'Debe ser numérico';
                  return null;
                },
              ),
              TextFormField(
                controller: _cantidadC,
                decoration: const InputDecoration(labelText: 'Cantidad'),
                keyboardType: TextInputType.number,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return 'Requerido';
                  final val = int.tryParse(v.trim());
                  if (val == null) return 'Debe ser numérico';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: _guardar, child: const Text('Guardar')),
            ],
          ),
        ),
      ),
    );
  }
}
