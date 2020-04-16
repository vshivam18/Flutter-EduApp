import 'package:flutter/material.dart';
import 'package:eduapp/constants.dart';
class RoundButton extends StatelessWidget {

  RoundButton({@required this.mTitle,@required this.mColor, @required this.onPress});
  final Color mColor;
  final String mTitle;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: mColor,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            mTitle,
            style: kButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
