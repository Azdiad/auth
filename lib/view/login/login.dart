import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:granregister/controller/authprovider.dart';
import 'package:granregister/view/homepage/home.dart';
import 'package:granregister/view/login/signup.dart';
// import 'package:provider/provider.dart';

class login extends StatefulWidget {
  login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  void logeduser() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailcontroller.text, password: passwordcontroller.text)
        .then((value) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomePage(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    // final authState = Provider.of<AuthState>(context);
    return Scaffold(
      body: Container(
        color: Colors.lightGreenAccent[200],
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 2.5,
            width: MediaQuery.of(context).size.width / 1.2,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Colors.white38,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                )),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFormField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextFormField(
                    controller: passwordcontroller,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 50,
                    child: FloatingActionButton(
                      onPressed: () {
                        logeduser();
                      },
                      child: Icon(
                        Icons.arrow_forward,
                        size: 30,
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => signUp(),
                        ));
                      },
                      child: Text('Create an Account')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
