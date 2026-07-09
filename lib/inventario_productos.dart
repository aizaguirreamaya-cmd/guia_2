import 'package:flutter/material.dart';
import 'datos_globales.dart';

class InventarioProductos extends StatefulWidget {
  const InventarioProductos({super.key});

  @override
  State<InventarioProductos> createState() => _InventarioProductosState();
}

class _InventarioProductosState extends State<InventarioProductos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inventario de Productos')),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index) {
          final p = productos[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text('${p.codigo} - ${p.nombre}'),
              subtitle: Text('Categoría: ${p.categoria}\nPrecio: ${p.precio.toStringAsFixed(2)}\nCantidad: ${p.cantidad}'),
            ),
          );
        },
      ),
    );
  }
}
