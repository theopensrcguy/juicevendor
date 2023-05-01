import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  final user =  FirebaseAuth.instance.currentUser!;

  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Text('signed in as ${user.email}'),
            MaterialButton(onPressed: (){
              FirebaseAuth.instance.signOut();
            },
              color: Colors.deepOrangeAccent,
              child: Text('Sign out'),

            )
          ],

        )

    ));

  }
}
