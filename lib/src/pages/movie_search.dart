import 'package:flutter/material.dart';

class MovieSearchPage extends StatelessWidget {
  const MovieSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0XFF032541),
        title: const Text("Filmes encontrados!"),
      ),
      body: Container(),
    );
  }
}
