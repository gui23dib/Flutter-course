import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AudioPlayer player = AudioPlayer();
  late AudioPlayer player2 = AudioPlayer();

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    player2 = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    player2.dispose();
    super.dispose();
  }

  var mainColor = 'red';
  var sequence = '';

  void playSound(num n) async {
    await player.setAsset('assets/nota$n.wav');
    await player2.setAsset('assets/easteregg.wav');
    setState(() {
      sequence = sequence + n.toString();
    });
    if (sequence == '123444121222154333123444') {
      player.play();
      player2.play();
      setState(() {
        sequence = '';
      });
    } else {
      player.play();
    }
  }

  Expanded createButton(num n, Color color) {
    return Expanded(
      child: ElevatedButton(
        onLongPress: () {
          setState(() {
            mainColor == 'red' ? mainColor = 'blue' : mainColor = 'red';
            sequence = '';
          });
        },
        onPressed: () {
          playSound(n);
        },
        style: ElevatedButton.styleFrom(backgroundColor: color),
        child: null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: mainColor == 'red'
                ? [
                    createButton(1, Colors.red.shade600),
                    createButton(2, Colors.red.shade500),
                    createButton(3, Colors.red.shade400),
                    createButton(4, Colors.red.shade300),
                    createButton(5, Colors.red.shade200),
                    createButton(6, Colors.red.shade100),
                    createButton(7, Colors.red.shade50),
                  ]
                : [
                    createButton(1, Colors.blue.shade600),
                    createButton(2, Colors.blue.shade500),
                    createButton(3, Colors.blue.shade400),
                    createButton(4, Colors.blue.shade300),
                    createButton(5, Colors.blue.shade200),
                    createButton(6, Colors.blue.shade100),
                    createButton(7, Colors.blue.shade50),
                  ],
          ),
        ),
      ),
    );
  }
}
