import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:granregister/controller/authprovider.dart';
import 'package:granregister/view/homepage/home.dart';
import 'package:granregister/view/login/login.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthState>(
        builder: (context, authState, _) {
          return StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                authState.login();
                return HomePage();
              } else {
                authState.logout();
                return login();
              }
            },
          );
        },
      ),
    );
  }
}
