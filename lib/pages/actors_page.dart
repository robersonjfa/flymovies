import 'package:flutter/material.dart';

class ActorsPage extends StatefulWidget {
  const ActorsPage({super.key});

  @override
  State<ActorsPage> createState() => _ActorsPageState();
}

class _ActorsPageState extends State<ActorsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Actors/Actresses'));
  }
}
