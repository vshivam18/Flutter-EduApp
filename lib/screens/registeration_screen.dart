import 'package:eduapp/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:eduapp/components/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:modal_progress_hud/modal_progress_hud.dart';


class RegistrationScreen extends StatefulWidget {
  static final id = 'registration_screen';


  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {



  bool securePassword = true;
  bool showSpinner=false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String firstName;
  String lastName;
  String userEmail;
  String userPassword;
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: Colors.lightGreen
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text('Registration',
            style: TextStyle(
                color: Colors.black54
            ),),
        ),
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding:  EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 40.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(flex: 1,
                      child: TextField(

                        decoration: InputDecoration(
                          labelText: 'First name',
                          floatingLabelBehavior:FloatingLabelBehavior.auto,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),

                        ),
                        onChanged: (firstNameValue){
                          firstName=firstNameValue;

                        },
                      ),
                    ),
                    SizedBox(width: 5.0,),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'last name',
                          floatingLabelBehavior:FloatingLabelBehavior.auto,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onChanged: (lastNameValue){
                          lastName=lastNameValue;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                TextField(

                  decoration: InputDecoration(
                    labelText: 'Email',
                    floatingLabelBehavior:FloatingLabelBehavior.auto,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: Icon(
                      Icons.mail,
                      color: Colors.black,
                    ),
                  ),
                  onChanged: (emailValue){
                    userEmail=emailValue;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  obscureText: securePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    floatingLabelBehavior:FloatingLabelBehavior.auto,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: (){
                        setState(() {
                          securePassword=!securePassword;
                        });
                      },
                      child: Icon(
                        securePassword ?  Icons.lock_outline: Icons.lock_open,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  onChanged: (passwordValue){
                    userPassword=passwordValue;
                  },
                ),
                RoundButton(mTitle:'Login' , mColor: Colors.blueGrey, onPress: () async{
                  setState(() {
                    showSpinner=true;
                  });
                  try{
                    final newUser = await _auth.createUserWithEmailAndPassword(email: userEmail, password: userPassword);

                    if(newUser!=null){

      

                      Navigator.pushNamed(context, HomeScreen.id,);
                      setState(() {
                        showSpinner=false;
                      });
                    }
                  }catch(e){
                    print(e);
                    Navigator.pop(context);
                  }
                }),
              ],
            ),
          ),
        )
    );
  }
}
