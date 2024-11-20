import 'package:flutter/material.dart';

class ColorScreen extends StatefulWidget {
  const ColorScreen({super.key});

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  List<Color> colors = [
    Colors.black,
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.orange,
    Colors.pink,
  ];
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(child: Container(color: colors[(i) % 8])),
                  Expanded(child: Container(color: colors[(i + 1) % 8])),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: Container(color: colors[(i + 2) % 8])),
                  Expanded(child: Container(color: colors[(i + 3) % 8])),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: Container(color: colors[(i + 4) % 8])),
                  Expanded(child: Container(color: colors[(i + 5) % 8])),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: Container(color: colors[(i + 6) % 8])),
                  Expanded(child: Container(color: colors[(i + 7) % 8])),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  i++;
                });
              },
              child: Text('Change Colors'),
            ),
          ],
        ),
      ),
    );
  }
}
