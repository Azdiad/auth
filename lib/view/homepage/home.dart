import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:granregister/view/login/login.dart';
import 'package:granregister/view/settings/settingspage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  void logoutuser() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.indigoAccent, actions: [
        IconButton(
            color: Colors.black,
            onPressed: () {
              logoutuser();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => login(),
              ));
            },
            icon: Icon(Icons.logout))
      ]),
      body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                Colors.blueAccent,
                Colors.purpleAccent,
              ],
                  stops: [
                0.0,
                1.0
              ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  tileMode: TileMode.repeated)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Verified as :   ' + user.email!,
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Welcome ',
                style: TextStyle(fontSize: 30),
              ),
              Container(
                width: 200,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Settings(),
                    ));
                  },
                  child: Text('Click For Settings'),
                ),
              )
            ],
          )),
    );
  }
}
