import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WordleKey extends StatelessWidget {
  final String letter;
  const WordleKey(this.letter, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget keycap;
    double width = 60;
    if (letter == "_") {
      keycap = Icon(
        Icons.keyboard_return,
        size: 20,
      );
    } else if (letter == "<") {
      keycap = Icon(
        Icons.keyboard_backspace_outlined,
        size: 20,
      );
    } else {
      width = 40;
      keycap = Text(
        letter,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    return Container(
      width: width,
      height: 60,
      alignment: Alignment.center,
      //padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: Color.fromARGB(44, 44, 44, 44),
      ),
      //child: Text("A"),
      child: keycap, //aqui quede
    );
  }
}
