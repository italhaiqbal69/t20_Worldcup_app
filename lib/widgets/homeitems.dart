import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homeitems extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onPress;
 
  const homeitems({
    required this.iconData , required this.title , required this.onPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 220,
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Icon(
            iconData,
            size: 80,
            color: Colors.white,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          )
        ]),
      ),
    );
  }
}
