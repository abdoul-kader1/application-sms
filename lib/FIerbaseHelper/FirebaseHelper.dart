import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';


class FirebaseHelper{

  //creation des variables de la baese de donnée
  static final inBase=FirebaseDatabase.instance.ref("User");
  final uneBranche =inBase.child("Users");

  //Methode pour qu'un utilisateur se connecte a fire base
  Future<User?> connectionFireBase({required String email,required String mdp})async{
    final User? user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: mdp)).user;
    return user;
  }
  // methode pour enrégistrer un utilisateur a firebase
  Future<User?> enregistrementFirebase({required String email,required String mdp,required String nom,required String prenom})async{
    final User?kuser = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: mdp)).user;
    String? kid = (kuser!.uid);
    Map map={
      "uid":kid,
      "nom":nom,
      "prenom":prenom
    };
    Createuser(uid: kid, map: map);
    return kuser;
  }

  //methode pour créé des utilisateurs
  Createuser({String?uid,required Map map})async{
    await uneBranche.child(uid!).set(map);
  }

}