import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({super.key});

  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  final List<Color> colorList = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.purple
  ];

  @override
  Widget build(BuildContext context) {
    print('build');
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: generateList(),
          ),
        ),
      ),
    );
  }

  List<Flexible> generateList() => List<Flexible>.generate(7, (index) {
        return Flexible(
          child: TextButton(
            style: ButtonStyle(
              enableFeedback: false,
              padding: WidgetStateProperty.all(EdgeInsets.all(0)),
              overlayColor: WidgetStateProperty.all(Colors.transparent),
            ),
            onPressed: () async {
              AudioPlayer audioPlayer = AudioPlayer();
              await audioPlayer.play(
                AssetSource(
                  'note${index + 1}.wav',
                ),
              );
            },
            child: Container(
              color: colorList[index],
            ),
          ),
        );
      });
}
