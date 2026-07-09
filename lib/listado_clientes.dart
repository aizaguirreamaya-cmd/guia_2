import 'package:flutter/material.dart';
import 'datos_globales.dart';

class ListadoClientes extends StatefulWidget {
  const ListadoClientes({super.key});

  @override
  State<ListadoClientes> createState() => _ListadoClientesState();
}

class _ListadoClientesState extends State<ListadoClientes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Listado de Clientes')),
      body: ListView.builder(
        itemCount: clientes.length,
        itemBuilder: (context, index) {
          final c = clientes[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text('${c.codigo} - ${c.nombre}'),
              subtitle: Text('Tel: ${c.telefono}\nDir: ${c.direccion}'),
            ),
          );
        },
      ),
    );
  }
}
