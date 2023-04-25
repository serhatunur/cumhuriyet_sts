import 'package:flutter/material.dart';
import 'package:cumhuriyet_sts/auth/logintutor.dart';

import '../main.dart';

class TutorDash extends StatefulWidget {
  final name;
  final email;
  const TutorDash({super.key, this.name, this.email});

  @override
  State<TutorDash> createState() => _TutorDashState();
}

class _TutorDashState extends State<TutorDash> {
  @override
  Widget build(BuildContext context) {
    Widget menuDrawer() {
      return Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.pinkAccent),
              currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
              )),
              accountName: Text(widget.name),
              accountEmail: Text(widget.email),
            ),
            ListTile(
              onTap: () {
                debugPrint("Home");
              },
              leading: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(color: Colors.green),
              ),
            ),
            widget.name == "Guest"
                ? ListTile(
                    onTap: () {
                      debugPrint("login");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginTutor(),
                        ),
                      );
                    },
                    leading: Icon(Icons.lock),
                    title: Text(
                      'Login',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : ListTile(
                    onTap: () {
                      debugPrint("Logout");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(),
                        ),
                      );
                    },
                    leading: Icon(Icons.lock_open),
                    title: Text(
                      'Log out',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Student DashBoard'),
      ),
      drawer: menuDrawer(),
      
    );
  }
}
