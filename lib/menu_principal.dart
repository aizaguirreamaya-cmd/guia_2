import 'package:flutter/material.dart';
import 'formulario_productos.dart';
import 'formulario_proveedores.dart';
import 'formulario_compras.dart';
import 'inventario_productos.dart';
import 'informacion.dart';

class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menú Principal')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FormularioProductos()),
              ),
              child: const Text('Registro de Productos'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const FormularioProveedores(),
                ),
              ),
              child: const Text('Registro de Proveedores'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FormularioCompras()),
              ),
              child: const Text('Registro de Compras'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const InventarioProductos()),
              ),
              child: const Text('Inventario de Productos'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Informacion()),
              ),
              child: const Text('Información del Sistema'),
            ),
          ],
        ),
      ),
    );
  }
}
