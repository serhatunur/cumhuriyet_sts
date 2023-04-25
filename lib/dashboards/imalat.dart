import 'package:flutter/material.dart';
import 'package:cumhuriyet_sts/auth/loginstudent.dart';

import '../main.dart';
import 'borcode.dart';

class imalatDash extends StatefulWidget {
  final name;
  final email;
  const imalatDash({super.key, this.name = "Guest", this.email = ""});

  @override
  State<imalatDash> createState() => _imalatDash();
}

class _imalatDash extends State<imalatDash> {
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
                'Anasayfa',
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
                          builder: (context) => LoginStudent(),
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(),
                        ),
                      );
                    },
                    leading: Icon(Icons.lock_open),
                    title: Text(
                      'Çıkış',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Sevkiyat Paneli'),
      ),
      drawer: menuDrawer(),
      body: barcode(),
    );
  }
}
