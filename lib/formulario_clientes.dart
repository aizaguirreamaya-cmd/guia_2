import 'package:flutter/material.dart';
import 'datos_globales.dart';

class FormularioClientes extends StatefulWidget {
  const FormularioClientes({super.key});

  @override
  State<FormularioClientes> createState() => _FormularioClientesState();
}

class _FormularioClientesState extends State<FormularioClientes> {
  final _formKey = GlobalKey<FormState>();
  final _codigoC = TextEditingController();
  final _nombreC = TextEditingController();
  final _telefonoC = TextEditingController();
  final _direccionC = TextEditingController();

  @override
  void dispose() {
    _codigoC.dispose();
    _nombreC.dispose();
    _telefonoC.dispose();
    _direccionC.dispose();
    super.dispose();
  }

  void _guardar() {
    if (!_formKey.currentState!.validate()) return;
    final cliente = Cliente(
      codigo: _codigoC.text.trim(),
      nombre: _nombreC.text.trim(),
      telefono: _telefonoC.text.trim(),
      direccion: _direccionC.text.trim(),
    );
    final ok = agregarCliente(cliente);
    if (!ok) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ya existe un cliente con ese código')),
      );
      return;
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Cliente registrado')));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Clientes')),
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
                controller: _telefonoC,
                decoration: const InputDecoration(labelText: 'Teléfono'),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Requerido' : null,
              ),
              TextFormField(
                controller: _direccionC,
                decoration: const InputDecoration(labelText: 'Dirección'),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Requerido' : null,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _guardar,
                child: const Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
