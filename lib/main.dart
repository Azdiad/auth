import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:granregister/controller/authprovider.dart';
import 'package:granregister/controller/imagepickerprovider.dart';
import 'package:granregister/view/login/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthState(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        //  ChangeNotifierProvider(
        //   create: (context) => Imagepicks(),
        // ),
      ],
      child: MaterialApp(
        title: 'fire Sign',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: AuthPage(),
        // home: login(),
        // home: homes(),
      ),
    );
  }
}
