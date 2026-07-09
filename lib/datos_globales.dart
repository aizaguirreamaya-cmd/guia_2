import 'package:flutter/material.dart';

class Producto {
  final String codigo;
  final String nombre;
  final String categoria;
  double precio;
  int cantidad;

  Producto({
    required this.codigo,
    required this.nombre,
    required this.categoria,
    required this.precio,
    required this.cantidad,
  });
}

class Proveedor {
  final String codigo;
  final String empresa;
  final String contacto;
  final String telefono;
  final String correo;

  Proveedor({
    required this.codigo,
    required this.empresa,
    required this.contacto,
    required this.telefono,
    required this.correo,
  });
}

class Compra {
  final String numero;
  final String codigoProducto;
  final String codigoProveedor;
  final int cantidad;
  final DateTime fecha;

  Compra({
    required this.numero,
    required this.codigoProducto,
    required this.codigoProveedor,
    required this.cantidad,
    required this.fecha,
  });
}

// Listas globales en memoria
List<Producto> productos = [];
List<Proveedor> proveedores = [];
List<Compra> compras = [];
// Clientes (nuevo módulo de ampliación)
class Cliente {
  final String codigo;
  final String nombre;
  final String telefono;
  final String direccion;

  Cliente({
    required this.codigo,
    required this.nombre,
    required this.telefono,
    required this.direccion,
  });
}

List<Cliente> clientes = [];

bool agregarCliente(Cliente c) {
  if (clientes.any((e) => e.codigo == c.codigo)) return false;
  clientes.add(c);
  return true;
}


// Funciones de ayuda
bool agregarProducto(Producto p) {
  if (productos.any((e) => e.codigo == p.codigo)) return false;
  productos.add(p);
  return true;
}

bool agregarProveedor(Proveedor p) {
  if (proveedores.any((e) => e.codigo == p.codigo)) return false;
  proveedores.add(p);
  return true;
}

bool agregarCompra(Compra c) {
  if (compras.any((e) => e.numero == c.numero)) return false;
  // verificar existencia producto y proveedor
  final prod = productos.where((p) => p.codigo == c.codigoProducto);
  final prov = proveedores.where((p) => p.codigo == c.codigoProveedor);
  if (prod.isEmpty || prov.isEmpty) return false;
  compras.add(c);
  // actualizar inventario (sumar cantidad)
  final p = productos.firstWhere((x) => x.codigo == c.codigoProducto);
  p.cantidad += c.cantidad;
  return true;
}
