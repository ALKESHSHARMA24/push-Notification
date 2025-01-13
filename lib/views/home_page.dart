import 'package:flutter/material.dart';
import 'package:pushnotifcation/controllers/auth_controllers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
              onPressed: () async {
                AuthControllers.logout();
                Navigator.pushNamedAndRemoveUntil(
                    context, "/login", (Route) => false);
              },
              icon: Icon(Icons.logout)),
        ],
      ),
    );
  }
}
