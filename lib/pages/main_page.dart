import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flymovies/components/gradient_component.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double _currentHeight = 1.5;

  late TextEditingController _weightController;

  @override
  void initState() {
    super.initState();
    _weightController = TextEditingController();
  }

  calcIMC() {
    double currentWeight = double.tryParse(_weightController.text) ?? 0;
    double imc = currentWeight / (_currentHeight * _currentHeight);

    // exibindo o resultado
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('IMC: ${imc.toStringAsFixed(2)}')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Align(
            child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        opacity: 0.2,
                        image: NetworkImage(
                            'https://cdn.pixabay.com/photo/2016/09/14/08/18/film-1668918_960_720.jpg'),
                        fit: BoxFit.cover)),
                width: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const GradientComponent(
                      colors: [Colors.blue, Colors.pink, Colors.deepPurple],
                    ),
                    const Text('Cálculo de IMC',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 30,
                    ),
                    Text('Altura: ${_currentHeight.toStringAsFixed(2)}'),
                    Slider(
                      value: _currentHeight,
                      min: 0,
                      max: 2.5,
                      onChanged: (double value) {
                        setState(() {
                          _currentHeight = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _weightController,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9.]'))
                      ],
                      autofocus: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Peso'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () => calcIMC(),
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder()),
                        child: const Text("Calcular"))
                  ],
                ))));
  }
}
