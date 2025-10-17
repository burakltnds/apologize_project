import 'dart:math';
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
  bool _isYesPressed = false;

  double _noButtonLeft = -1000;
  double _noButtonTop = -1000;
  bool _isInitialPositionSet = false;

  void _moveNoButton() {
    final random = Random();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    setState(() {
      _noButtonLeft = random.nextDouble() * (screenWidth - 150);
      _noButtonTop = random.nextDouble() * (screenHeight - 100);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialPositionSet && MediaQuery.of(context).size.width > 0) {
      setState(() {
        _noButtonLeft = MediaQuery.of(context).size.width / 2 + 60;
        _noButtonTop = MediaQuery.of(context).size.height / 2 + 50;
        _isInitialPositionSet = true;
      });
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zeysu❤︎❤︎❤︎',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        backgroundColor: Color(0xFFF6B8B8) ,
        appBar: AppBar(
          title: const Text('Zeysuşumm...'),
          backgroundColor: Color(0xFFF6B8B8),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: _isYesPressed
                        ? Image.network(
                      'https://media.tenor.com/uRzMIon_NBgAAAAi/bubuiak14kiss1.gif', // Evet denilince çıkan sevimli kedi GIF'i
                      key: const ValueKey('yes_gif'),
                      height: 250,
                    )
                        : Image.network(
                      'https://media.tenor.com/Qu6GUg0Yx90AAAAi/mocha-cry.gif', // İstediğiniz başlangıç GIF'i
                      key: const ValueKey('initial_gif'),
                      height: 250,
                    ),
                  ),
                  const SizedBox(height: 50),
                  // Metin
                  Text(
                    _isYesPressed ? 'Artık Öbüşebilirizz gel bakimm' : 'Affet Beni Bebişimm?',
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 200), // Butonlara yer açmak için boşluk
                ],
              ),
            ),


            if (!_isYesPressed)
              Positioned(
                left: MediaQuery.of(context).size.width / 2 - 130, // Ortalamak için
                top: MediaQuery.of(context).size.height / 2 + 50,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isYesPressed = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  child: const Text('Evet'),
                ),
              ),

            if (!_isYesPressed && _isInitialPositionSet)
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                left: _noButtonLeft,
                top: _noButtonTop,
                child: MouseRegion(
                  onEnter: (_) => _moveNoButton(),
                  child: ElevatedButton(
                    onPressed: () {
                      _moveNoButton();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: const Text('Hayır'),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}