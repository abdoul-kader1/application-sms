//import 'package:application_sms/FIerbaseHelper/FirebaseHelper.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MainAppControlleur extends StatefulWidget {
  const MainAppControlleur({super.key, required this.title});

  final String title;

  @override
  State<MainAppControlleur> createState() => _MainAppControlleurState();
}

class _MainAppControlleurState extends State<MainAppControlleur> {
  int _counter = 0;
  int kader=0 ;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex:kader,
          onTap: (int){
            setState(() {
              kader=int;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.home),
                ),
                label: "Home"
            ),
            BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.settings),
                ),
                label: "Reglage"
            ),

          ]
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed:()async{
          try {
            DatabaseReference ref = FirebaseDatabase.instance.ref("Users/123");
            await ref.set({
              "name": "John",
              "age": 18,
              "address": {
                "line1": "100 Mountain View"
              }
            });
          } catch(e) {
            print(e);
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}