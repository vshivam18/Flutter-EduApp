import 'package:eduapp/constants.dart';
import 'package:flutter/material.dart';

class TextButton extends StatelessWidget {

  TextButton({@required this.mTitle,this.mOnPress});

  final String mTitle;
  final Function mOnPress;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: mOnPress,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          mTitle,
          style: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.w800
          ),
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}

