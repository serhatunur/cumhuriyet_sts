import 'package:flutter/material.dart';
import 'package:cumhuriyet_sts/auth/loginmanagement.dart';
import 'package:cumhuriyet_sts/auth/loginstudent.dart';
import 'package:cumhuriyet_sts/auth/logintutor.dart';
import 'package:cumhuriyet_sts/auth/signupmanagement.dart';
import 'package:cumhuriyet_sts/auth/signupstudent.dart';
import 'package:cumhuriyet_sts/auth/signuptutor.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cumhuriyet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cumhuriyet Ürün Sevk Sistemi',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.black54,
        elevation: 1,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      child: Column(
                        children: [
                          Image(image: AssetImage('images/logo.png',)),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.arrow_drop_down_circle),
                      title: const Text('Kullancı Girişi'),
                      subtitle: Text(
                        'Kullanıcı Girişi',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [
                        MaterialButton(
                          textColor: const Color(0xFF6200EE),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginStudent(),
                              ),
                            );
                          },
                          child: const Text('Giriş'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.arrow_drop_down_circle),
                      title: const Text('Yönetim Alanı'),
                      subtitle: Text(
                        'Yönetici İşlemleri',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Bakım Amacı',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [
                        MaterialButton(
                          textColor: const Color(0xFF6200EE),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginManagement(),
                              ),
                            );
                          },
                          child: const Text('Giriş'),
                        ),
                        // MaterialButton(
                        //   textColor: const Color(0xFF6200EE),
                        //   onPressed: () {
                        //     //for Security Reasons
                        //   //   Navigator.push(
                        //   //   context,
                        //   //   MaterialPageRoute(
                        //   //     builder: (context) => SignupManagement(),
                        //   //   ),
                        //   // );
                        //   },
                        //   child: const Text('Sign Up'),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
