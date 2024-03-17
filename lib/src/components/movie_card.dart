import 'package:flutter/cupertino.dart';

class MovieCard extends StatelessWidget {
  final String posterPath;

  const MovieCard({super.key, required this.posterPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8),
      width: 200,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          'https://media.themoviedb.org/t/p/w220_and_h330_face$posterPath',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
