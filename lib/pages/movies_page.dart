import 'package:flutter/material.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // MediaQuery - widget
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue,
        child: Row(children: [
          const Text('Movies'),
          ElevatedButton(
              onPressed: () => {debugPrint('teste')}, child: Text('Clicar'))
        ]));
  }
}
