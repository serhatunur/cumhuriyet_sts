import 'package:flutter/material.dart';
import 'package:cumhuriyet_sts/auth/loginstudent.dart';

import '../main.dart';

class StudentDash extends StatefulWidget {
  final name;
  final email;
  const StudentDash({super.key, this.name = "Guest", this.email = ""});

  @override
  State<StudentDash> createState() => _StudentDashState();
}

class _StudentDashState extends State<StudentDash> {
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
        title: Text('Öğrenci Paneli'),
      ),
      drawer: menuDrawer(),
      body: ListView(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Ders İşlemleri',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(padding: EdgeInsets.all(10),),
                              Icon(Icons.import_contacts,color: Colors.white),
                              Text(
                                'Videolar',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              ),
                            ],
                          ),
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.pinkAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(padding: EdgeInsets.all(10),),
                              Icon(Icons.import_contacts,color: Colors.white),
                              Text(
                                'Sınavlar',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              ),
                            ],
                          ),
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.cyanAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(padding: EdgeInsets.all(10),),
                              Icon(Icons.import_contacts,color: Colors.white),
                              Text(
                                'Canlı Ders',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              ),
                            ],
                          ),
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.lightGreenAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
