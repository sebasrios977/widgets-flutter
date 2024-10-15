import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';
  
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Hola mundo'),
        action: SnackBarAction(
          label: 'Ok!',
          onPressed: () {},
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text('Esto es una prueba'),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('Cancelar'),),
          FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar'),)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y dialogos'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(
                    context: context,
                    children: const [
                      Text('Este es un dialogo de prueba'),
                    ],
                  );
                }, child: const Text('Licencias usadas'),
              ),
              FilledButton.tonal(
                onPressed: () {
                  openDialog(context);
                }, child: const Text('Mostrar dialogo'),
              ),
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
      );
  }
}