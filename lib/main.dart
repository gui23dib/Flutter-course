import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          title: const Center(child: Text("Eu vou ser o rei dos piratas!")),
        ),
        body: const Center(
            child: Image(
          image: AssetImage('images/bandeira.jpg'),
        )),
        backgroundColor: Colors.black,
      ),
    ),
  );
}
