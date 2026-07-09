import 'package:flutter/material.dart';

class Informacion extends StatelessWidget {
  const Informacion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Información del Sistema')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Nombre del sistema: Sistema de Gestión de Inventario',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text('Nombre del estudiante: Andres Izaguirre'),
            SizedBox(height: 4),
            Text('Número de cuenta: 0704200501128'),
            SizedBox(height: 4),
            Text('Clase: Programación en Multiplataforma'),
            SizedBox(height: 4),
            Text('Universidad: UNICAH'),
          ],
        ),
      ),
    );
  }
}
