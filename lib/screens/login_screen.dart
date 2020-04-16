import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:eduapp/screens/home_screen.dart';
import 'package:eduapp/components/round_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
 static final id='login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool securePassword =true;
  bool showSpinner=false;
  String userEmail;
  String userPassword;

  final _auth =FirebaseAuth.instance;
  

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
          title: Text('Login',
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
                RoundButton(mColor: Colors.blueGrey,mTitle: 'Login' , onPress: () async{
                  setState(() {
                    showSpinner=true;
                  });
               try{
                 final isUser = await _auth.signInWithEmailAndPassword(email: userEmail, password: userPassword);
                 if(isUser!=null){
                   setState(() {
                     showSpinner=false;
                   });
                   Navigator.pushNamed(context, HomeScreen.id);

                 }
               }catch(e){
                 print(e);
                 Navigator.pop(context);
               }
                  //navigate to home screen

                },),
              ],
            ),
          ),
        )
    );
  }
}
