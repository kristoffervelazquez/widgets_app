import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestScreen extends StatelessWidget {
  static const String name = "test_screen";

  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Campo de pruebas de widgets"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: const _TestScreenView(),
    );
  }
}

class _TestScreenView extends StatefulWidget {
  const _TestScreenView();

  @override
  State<_TestScreenView> createState() => _TestScreenViewState();
}

class _TestScreenViewState extends State<_TestScreenView> {
  late Future<http.Response> posts;

  @override
  void initState() {
    super.initState();
    posts = getPosts();
  }

  Future<http.Response> getPosts() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(url);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: posts,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          ); // Muestra un indicador de carga mientras espera la respuesta.
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          // Aquí puedes construir la interfaz gráfica con los datos obtenidos.

          final List<dynamic> postsData = json.decode(snapshot.data!.body);
          return ListView.builder(
            itemCount: postsData.length,
            itemBuilder: (context, index) {
              var post = postsData[index];

              return _CardType3(
                  label: post["body"], title: post["title"], elevation: 1);
            },
          );
        }
      },
    );
  }
}

class _CardType3 extends StatelessWidget {
  final String title;
  final String label;
  final double elevation;

  const _CardType3(
      {required this.label, required this.elevation, required this.title});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.surfaceVariant,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.more_vert_outlined),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - Filled'),
            )
          ],
        ),
      ),
    );
  }
}
