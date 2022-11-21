import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController myController = TextEditingController();
  double showText = 0;
  String? error;
  double? amountInRon;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Convertor',
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Currency Convertor')),
        ),
        body: Column(
          children: <Widget>[
            const Image(image: AssetImage('assets/ron.jpg')),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: myController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Enter an amount in EURO.', errorText: error),
              ),
            ),
            ColoredBox(
              color: Colors.grey,
              child: TextButton(
                child: const Text('Convert!', style: TextStyle(color: Colors.black)),
                onPressed: () {
                  setState(() {
                    final double? amountInEuro = double.tryParse(myController.text);
                    if (amountInEuro != null && amountInEuro > 0) {
                      showText = 1.0;
                      amountInRon = amountInEuro * 4.97;
                      error = null;
                    } else {
                      showText = 0;
                      error = 'This is not a valid number!';
                    }
                  });
                },
              ),
            ),
            Opacity(
              opacity: showText,
              child: Center(
                child: Text(
                  '$amountInRon RON',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
