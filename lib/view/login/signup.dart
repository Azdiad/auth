import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:granregister/controller/authprovider.dart';
import 'package:granregister/view/login/login.dart';
import 'package:provider/provider.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        color: Colors.purple[200],
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 1.5,
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
                    decoration: InputDecoration(
                      hintText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                  ),
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
                  // TextFormField(
                  //   decoration: InputDecoration(
                  //     hintText: 'Confirm Password',
                  //     border: OutlineInputBorder(),
                  //   ),

                  // ),
                  Container(
                    width: 100,
                    height: 50,
                    child: FloatingActionButton(
                      onPressed: () async {
                        await authProvider.signupUser(emailcontroller.text,
                            passwordcontroller.text, context);

                        print('Registration Successful');
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => login(),
                        ));
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
                          builder: (context) => login(),
                        ));
                      },
                      child: Text('Already Have an Account')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
