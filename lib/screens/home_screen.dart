
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:eduapp/components/custom_drawer.dart';


class HomeScreen extends StatefulWidget {
  static final id= 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



 
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser ;
  String userName;

  void getCurrentUser () async{
    final currentUser = await _auth.currentUser();
    loggedInUser=currentUser;
    print(currentUser.email);

  }

 

  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      home:Scaffold(
        backgroundColor: Color(0xFFFAFAFA),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check),
          backgroundColor: Color(0xFF0D276B),
          elevation: 2.0,
          onPressed:(){
            print('FAB tapped');
          },
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Colors.white,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(icon: Icon(Icons.dashboard , color: Color(0xFFCED1DB),), onPressed: () {
                getCurrentUser();

              }
                ),
              IconButton(icon: Icon(Icons.alarm, color: Color(0xFFCED1DB)), onPressed: () {},),
            ],
          ),
        ),
        appBar: AppBar(
          title:Text('Welecome' ,style:TextStyle(color: Colors.blueGrey)),
          elevation:0.0,
          backgroundColor: Color(0xFFFAFAFA),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.close ,color: Colors.blueGrey,),
              onPressed: () async{
                final isUserSignOut = await _auth.signOut();
                print('Signout Succesfully');
            
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: Center(
          
          child: FlatButton(
            child: Text('Drawer'),
            onPressed: (){
              print('Tapped Drawer');
            },
          ),
        ),
      drawer:CustomDrawer(),
    ),
    );
  }
}

