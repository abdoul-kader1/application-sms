import 'package:application_sms/FIerbaseHelper/FirebaseHelper.dart';
import 'package:flutter/material.dart';

class LogControlleur extends StatefulWidget{
  LogControlleur({Key?key}):super(key:key);
  @override
  State<StatefulWidget> createState()=>_LogControlleur();

}

class _LogControlleur extends State<LogControlleur>{
  String ?mdp;
  String?email;
  String?nom;
  String?prenom;
  bool auth =true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Authentification"),
        ),
        body:SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width-40,
                  height: MediaQuery.of(context).size.height/2,
                  child: Card(
                    elevation: 20,
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:SenregistrerSeconnecter(k: auth),
                        )
                    ),
                  ),
                ),
                TextButton(
                    onPressed:(){
                      setState(() {
                        auth=!auth;
                      });
                    },
                    child: Text(auth?"S'enregistrer ":"Se connecter")
                ),
                ElevatedButton(
                    onPressed: ValiderLesChamps,
                    child:Text("Valider")
                )
              ],
            )
        )
    );
  }

  ValiderLesChamps(){
    if(email!="" && email!=null){
      if(mdp!=""&& mdp!=null){
        if(!auth){
          if(nom!=""&& nom!=null){
            if(prenom!=""&& prenom!=null){
              FirebaseHelper().enregistrementFirebase(email:email!, mdp: mdp!, nom: nom!, prenom: prenom!).then((user){
                print(user!.uid);
              }).catchError((erreur){
                Alertes(DescriptionAlerte: erreur.toString());
              });
            }else{
              Alertes(DescriptionAlerte: "Vous n'avez pas renseigner votre prenom");
            }
          }else{
            Alertes(DescriptionAlerte: "Vous n'avez pas renseigner votre nom");
          }
        }else{
          FirebaseHelper().connectionFireBase(email:email!, mdp: mdp!).then((user){
            print(user?.uid);
          }).catchError((erreur){
            Alertes(DescriptionAlerte: erreur.toString());
          });
        }
      }else{
        Alertes(DescriptionAlerte: "Le champs mot de passe ne peut pas etre vide");
      }
    }else{
      Alertes(DescriptionAlerte: "Le champs email ne peut pas etre vide");
    }
  }

  List <Widget> SenregistrerSeconnecter({bool?k}){
    List <Widget>Seconnecter=[
      TextField(
        onChanged: (string){
          setState(() {
            email=string;
          });
        },
        decoration:InputDecoration(
            hintText: "Adresse email"
        ) ,
      ),
      TextField(
        onChanged: (string){
          setState(() {
            mdp=string;
          });
        },
        obscureText: true,
        decoration:InputDecoration(
            hintText: "Mot de passe "
        ) ,
      )
    ];

    List <Widget>Senregistrer=[
      TextField(
        onChanged: (string){
          setState(() {
            email=string;
          });
        },
        decoration:InputDecoration(
            hintText: "Adresse email"
        ) ,
      ),
      TextField(
        onChanged: (string){
          setState(() {
            mdp=string;
          });
        },
        obscureText: true,
        decoration:InputDecoration(
            hintText: "Mot de passe "
        ) ,
      ),
      TextField(
        onChanged: (string){
          setState(() {
            nom=string;
          });
        },
        decoration:InputDecoration(
            hintText: "Le nom "
        ) ,
      ),
      TextField(
        onChanged: (string){
          setState(() {
            prenom=string;
          });
        },
        decoration:InputDecoration(
            hintText: "Le prenom"
        ) ,
      )
    ];
    return k==true?Seconnecter:Senregistrer;
  }

  //Methode pour les arletes
  Future<Null> Alertes({required String DescriptionAlerte})async{
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext contecte){
          return AlertDialog(
            title: Text("Erreur"),
            content: Text(DescriptionAlerte),
            actions: [
              ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child:Text("OK")
              )
            ],
          );
        }
    );
  }

}