import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eduapp/constants.dart';
import 'package:eduapp/components/round_button.dart';
import 'package:eduapp/components/text_button.dart';
import 'package:eduapp/screens/login_screen.dart';
import 'package:eduapp/screens/registeration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class EntryScreen extends StatelessWidget {

 static final id = 'entry_screen';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFE6F7D5),
        body:  Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
            child:Padding(
              padding:  EdgeInsets.only(left: 20.0,top: 30.0,bottom: 20.0,right: 20.0),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded( 
                    flex: 1,
                    child: Text(
                      'MadeEasy',
                      style: kHeadingTextStyle
                    ),
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Make life' ,
                        style: kSubHeadingTextStyle,
                      ),
                      RotateAnimatedTextKit(
                          text: [" Simpler", " Better", " Smarter"],
                          textStyle:kSubHeadingAnimatedTextStyle,

                      ),

                    ],
                  ),

                  Expanded(
                    flex:5,
                    child: Image(
                      image:  AssetImage('images/school_bag.png'),
                    ),
                  ),
                  RoundButton(mTitle:'Sign In' , mColor: Colors.orangeAccent, onPress: (){
                    Navigator.pushNamed(context, LoginScreen.id);
                  }),
                  RoundButton(mTitle:'Get started' , mColor: Colors.lightGreen, onPress: (){
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  }),

                  SizedBox(
                    height: 2.0,
                    width: double.infinity,
                  ),
                  TextButton(mTitle: 'forget password ?', mOnPress: (){},)

                ],
              ),
            ),
          ),
      ),
        );
      }
    }

