import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LiveScore extends StatelessWidget {
  const LiveScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text('LiveScore'),
        backgroundColor: Colors.purple,
      ),

    );
  }
}