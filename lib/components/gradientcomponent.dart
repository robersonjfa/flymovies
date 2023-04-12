import 'package:flutter/material.dart';

class GradientComponent extends StatefulWidget {
  const GradientComponent({super.key, required this.colors});

  final List<Color> colors;

  @override
  State<GradientComponent> createState() => _GradientComponentState();
}

class _GradientComponentState extends State<GradientComponent>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this)
      ..repeat(reverse: true);
    // utiliza notação double dot
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          return Container(
            height: 150,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: widget.colors, stops: [0, _controller.value, 1]),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white)),
          );
        });
  }
}
