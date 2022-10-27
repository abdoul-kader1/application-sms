import 'package:application_sms/controlleur/LogControlleur.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:application_sms/controlleur/MainAppControlleur.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _VerifiAuth(),
    );
  }
}
Widget _VerifiAuth(){
  return StreamBuilder<User?> (
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context,snapshot){
        if(snapshot.hasData){
          return MainAppControlleur(title: 'Acceuil');
        }else{
          return LogControlleur();
        }
      }
  );
}