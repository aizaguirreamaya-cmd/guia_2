import 'package:flutter/material.dart';
import 'datos_globales.dart';

class FormularioProveedores extends StatefulWidget {
  const FormularioProveedores({super.key});

  @override
  State<FormularioProveedores> createState() => _FormularioProveedoresState();
}

class _FormularioProveedoresState extends State<FormularioProveedores> {
  final _formKey = GlobalKey<FormState>();
  final _codigoC = TextEditingController();
  final _empresaC = TextEditingController();
  final _contactoC = TextEditingController();
  final _telefonoC = TextEditingController();
  final _correoC = TextEditingController();

  @override
  void dispose() {
    _codigoC.dispose();
    _empresaC.dispose();
    _contactoC.dispose();
    _telefonoC.dispose();
    _correoC.dispose();
    super.dispose();
  }

  void _guardar() {
    if (!_formKey.currentState!.validate()) return;
    final prov = Proveedor(
      codigo: _codigoC.text.trim(),
      empresa: _empresaC.text.trim(),
      contacto: _contactoC.text.trim(),
      telefono: _telefonoC.text.trim(),
      correo: _correoC.text.trim(),
    );
    final ok = agregarProveedor(prov);
    if (!ok) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ya existe un proveedor con ese código')),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Proveedor registrado')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Proveedores')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _codigoC,
                decoration: const InputDecoration(labelText: 'Código'),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Requerido' : null,
              ),
              TextFormField(
                controller: _empresaC,
                decoration: const InputDecoration(labelText: 'Nombre de la empresa'),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Requerido' : null,
              ),
              TextFormField(
                controller: _contactoC,
                decoration: const InputDecoration(labelText: 'Nombre del contacto'),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Requerido' : null,
              ),
              TextFormField(
                controller: _telefonoC,
                decoration: const InputDecoration(labelText: 'Teléfono'),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Requerido' : null,
              ),
              TextFormField(
                controller: _correoC,
                decoration: const InputDecoration(labelText: 'Correo electrónico'),
                keyboardType: TextInputType.emailAddress,
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Requerido' : null,
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
