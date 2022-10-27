import 'package:firebase_database/firebase_database.dart';

class MyUser{
  String?uid,nom,prenom,urlimage,initiale;
  MyUser({required DataSnapshot snapshot}){
    this.uid=snapshot.key;
    Map? map={
      "ValeurSnapshot":snapshot.value
    };
    this.nom=map["ValeurSnapshot"]["nom"];
    this.prenom=map["ValeurSnapshot"]["prenom"];
    this.urlimage=map["ValeurSnapshot"]["urlimage"];

    if(this.prenom!=null && this.prenom!.length > 0){
      this.initiale=prenom![0];
    }

    if(this.nom!=null && this.nom!.length> 0){
      if(this.initiale!=null){
        this.initiale =this.initiale![0] + nom![0];
      }else{
        this.initiale=nom![0];
      }
    }
  }
  Map OnUser(){
    return {
      "nom":nom,
      'prenom':prenom,
      'urlimage':urlimage,
      "uid":uid
    };
  }
}