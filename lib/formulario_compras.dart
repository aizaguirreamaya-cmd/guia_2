import 'package:flutter/material.dart';
import 'datos_globales.dart';

class FormularioCompras extends StatefulWidget {
  const FormularioCompras({super.key});

  @override
  State<FormularioCompras> createState() => _FormularioComprasState();
}

class _FormularioComprasState extends State<FormularioCompras> {
  final _formKey = GlobalKey<FormState>();
  final _numeroC = TextEditingController();
  final _codigoProductoC = TextEditingController();
  final _codigoProveedorC = TextEditingController();
  final _cantidadC = TextEditingController();
  DateTime _fecha = DateTime.now();

  @override
  void dispose() {
    _numeroC.dispose();
    _codigoProductoC.dispose();
    _codigoProveedorC.dispose();
    _cantidadC.dispose();
    super.dispose();
  }

  Future<void> _selectFecha() async {
    final d = await showDatePicker(
      context: context,
      initialDate: _fecha,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (d != null) setState(() => _fecha = d);
  }

  void _guardar() {
    if (!_formKey.currentState!.validate()) return;
    final cantidad = int.tryParse(_cantidadC.text.trim()) ?? 0;
    final compra = Compra(
      numero: _numeroC.text.trim(),
      codigoProducto: _codigoProductoC.text.trim(),
      codigoProveedor: _codigoProveedorC.text.trim(),
      cantidad: cantidad,
      fecha: _fecha,
    );
    final ok = agregarCompra(compra);
    if (!ok) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error: datos inválidos o duplicados')),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Compra registrada')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Compras')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _numeroC,
                decoration: const InputDecoration(labelText: 'Número de compra'),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Requerido' : null,
              ),
              TextFormField(
                controller: _codigoProductoC,
                decoration: const InputDecoration(labelText: 'Código del producto'),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Requerido' : null,
              ),
              TextFormField(
                controller: _codigoProveedorC,
                decoration: const InputDecoration(labelText: 'Código del proveedor'),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Requerido' : null,
              ),
              TextFormField(
                controller: _cantidadC,
                decoration: const InputDecoration(labelText: 'Cantidad comprada'),
                keyboardType: TextInputType.number,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return 'Requerido';
                  if (int.tryParse(v.trim()) == null) return 'Debe ser numérico';
                  return null;
                },
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(child: Text('Fecha: ${_fecha.toLocal().toString().split(' ')[0]}')),
                  ElevatedButton(onPressed: _selectFecha, child: const Text('Seleccionar')),
                ],
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
