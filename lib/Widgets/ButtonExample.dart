import 'dart:ffi';

import 'package:animations_work/Item.dart';
import 'package:animations_work/Widgets/ToggleButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ButtonExample extends StatefulWidget {
  ButtonExample({Key? key}) : super(key: key);

  @override
  _ButtonExampleState createState() => _ButtonExampleState();
}

class _ButtonExampleState extends State<ButtonExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Example'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 300,
              height: 100,
              child: ToggleButton(
                enable: false,
              ))
        ],
      )),
    );
  }
}
