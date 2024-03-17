import 'package:flutter/material.dart';

class MovieSearch extends StatelessWidget {
  final TextEditingController textSearchController;
  final VoidCallback onPressed;

  const MovieSearch(
      {super.key, required this.textSearchController, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                controller: textSearchController,
                autofocus: false,
                decoration: const InputDecoration(
                  hintText: 'Buscar por um Filme, Série ou Pessoa...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          MaterialButton(
            onPressed: onPressed,
            height: 48,
            color: const Color(0XFF032541),
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Text('Buscar'),
          ),
        ],
      ),
    );
  }
}
