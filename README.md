# Guia 2 - Sistema de Gestión de Inventario (Flutter)

Proyecto de ejemplo para el examen: Sistema de Gestión de Inventario.

## Estructura principal (lib/)

- `main.dart` - entrypoint de la app.
- `menu_principal.dart` - menú principal y navegación.
- `datos_globales.dart` - modelos y almacenamiento en memoria.
- `formulario_productos.dart` - registro de productos.
- `formulario_proveedores.dart` - registro de proveedores.
- `formulario_compras.dart` - registro de compras (actualiza inventario).
- `inventario_productos.dart` - listado de productos.
- `informacion.dart` - información del sistema (reemplazar placeholders).
- `formulario_clientes.dart` - (Ampliación) registro de clientes.
- `listado_clientes.dart` - (Ampliación) listado de clientes.

## Requisitos

- Flutter SDK instalado.

## Ejecutar la aplicación (Windows)

1. Abrir terminal en la carpeta del proyecto:

```bash
cd "c:\FlutterProjects\guia 2\guia_2"
```

2. Instalar dependencias:

```bash
flutter pub get
```

3. Ejecutar en Windows:

```bash
flutter run -d windows
```

4. Durante la ejecución, usar `r` para hot reload.

## Probar el nuevo módulo "Clientes"

- En el Menú Principal, seleccionar `Registro de Clientes`.
- Llenar los 4 campos (Código, Nombre, Teléfono, Dirección) y pulsar `Registrar`.
- Ir a `Listado de Clientes` para verificar el registro.

## Notas

- No se usan bases de datos; toda la información se guarda en listas en memoria (archivo `datos_globales.dart`).
- Reemplaza los placeholders en `lib/informacion.dart` con tus datos personales antes de entregar.

## Entrega

Sube el repositorio a GitHub y comparte el enlace en la actividad de Moodle.
# guia_2

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
