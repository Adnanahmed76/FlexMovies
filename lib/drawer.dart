import 'package:flutter/material.dart';
class Drawerrr extends StatelessWidget {
  const Drawerrr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     drawer: Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("Logout"),
            onTap: (){},
          )
        ],
      ),
     ),
    );
  }
}