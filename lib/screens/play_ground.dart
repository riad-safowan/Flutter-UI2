import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayGround extends StatelessWidget {
  const PlayGround({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Container(
        decoration: BoxDecoration(color: Colors.yellow),
        child: Text('hello'),
      ),
    );
  }
}
