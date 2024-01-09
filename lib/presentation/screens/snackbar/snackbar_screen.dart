import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackBarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text("Hola mundo"),
      action: SnackBarAction(label: "OK!", onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text("Estas seguro?"),
        content: Text("Lotem papapapa"),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text("Cancelar"),
          ),
          FilledButton(
            onPressed: () => context.pop(),
            child: Text("Aceptar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snackbar y diálogos"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text("Mostrar diálogo de pantalla"),
            ),
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [const Text('Licencias aquí')],
                );
              },
              child: const Text("Licencias usadas"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.remove_red_eye_outlined),
        label: const Text("Mostrar snackbar"),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
