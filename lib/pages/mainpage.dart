import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                decoration: BoxDecoration(
                    image: DecorationImage(
                        opacity: 0.2,
                        image: NetworkImage(
                            'https://cdn.pixabay.com/photo/023/03/21/15/41/umbrella-7867543_960_720.jpg'),
                        fit: BoxFit.cover)),
                width: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Cálculo de IMC',
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
                        print(value);
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
