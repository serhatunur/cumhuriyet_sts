import 'package:flutter/material.dart';
import 'package:cumhuriyet_sts/auth/loginstudent.dart';

import '../main.dart';
import '../studentcrud/urunler.dart';

class ErtugrulgaziDash extends StatefulWidget {
  final sube;
  final name;
  final email;
  const ErtugrulgaziDash({super.key, this.name = "Guest", this.email = "", this.sube=''});

  @override
  State<ErtugrulgaziDash> createState() => _ErtugrulgaziDash();
}

class _ErtugrulgaziDash extends State<ErtugrulgaziDash> {
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
        title: Text('Kullanıcı Paneli' ),
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
                    'Ertuğrulgazi',
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
                        child: InkWell(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(padding: EdgeInsets.all(10),),
                                Icon(Icons.import_contacts,color: Colors.white),
                                Text(
                                  'YaşPastalar',
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
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UrunlerWidget(sube: widget.sube, urunturu: 3, name: widget.name),
                              ),
                            );
                          },
                        ),

                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: InkWell(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(padding: EdgeInsets.all(10),),
                                Icon(Icons.import_contacts,color: Colors.white),
                                Text(
                                  'KuruPastalar',
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
                              color: Colors.cyan,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UrunlerWidget(sube: widget.sube, urunturu: 2, name: widget.name),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: InkWell(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(padding: EdgeInsets.all(10),),
                                Icon(Icons.import_contacts,color: Colors.white),
                                Text(
                                  'Şerbetli Tatlılar',
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
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UrunlerWidget(sube: widget.sube, urunturu: 4, name: widget.name),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(padding: EdgeInsets.all(10),),
                                Icon(Icons.import_contacts,color: Colors.white),
                                Text(
                                  'Mayalı',
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
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UrunlerWidget(sube: widget.sube, urunturu: 1, name: widget.name),
                              ),
                            );
                          },
                        ),

                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: InkWell(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(padding: EdgeInsets.all(10),),
                                Icon(Icons.import_contacts,color: Colors.white),
                                Text(
                                  'Adet Pastalar',
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
                              color: Colors.purpleAccent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UrunlerWidget(sube: widget.sube, urunturu: 0, name: widget.name),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: InkWell(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(padding: EdgeInsets.all(10),),
                                Icon(Icons.import_contacts,color: Colors.white),
                                Text(
                                  'Ekmek',
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
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UrunlerWidget(sube: widget.sube, urunturu: 6, name: widget.name),
                              ),
                            );
                          },
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
