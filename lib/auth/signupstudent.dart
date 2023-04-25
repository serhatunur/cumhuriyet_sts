import 'package:flutter/material.dart';
import 'package:cumhuriyet_sts/auth/loginstudent.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:cumhuriyet_sts/dashboards/studentdash.dart';
class SignUpStudent extends StatefulWidget {
  const SignUpStudent({super.key});

  @override
  State<SignUpStudent> createState() => _SignUpStudentState();
}

class _SignUpStudentState extends State<SignUpStudent> {

  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController email = TextEditingController();

 Future signUp() async {
    var url = "http://qrcumhuriyetfirini.online/cumhuriyetserver/auth/studentregister.php";
    var response = await http.post(Uri.parse(url),
        body: {"email": email.text, "password": pass.text  ,"name": name.text});

    if (response.statusCode == 200) {
      var userData = json.decode(response.body);
      if (userData == "ERROR") {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Message"),
            content: Text("This User Already Exists"),
            actions: [
              MaterialButton(
                color: Colors.red,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              )
            ],
          ),
        );
      
      } else{
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StudentDash(name: userData["name"],email:userData["email"]),
            ),
          );
        print(userData);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Message"),
            content: Text("SignUp Sucessfull"),
            actions: [
              MaterialButton(
                color: Colors.red,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              )
            ],
          ),
        );
      }
    }
  }

late String role_id;
  List<String> role = [
    "Tutor",
    "Admin",
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Kayıt Ol'),
        ),
        body: Stack(
          children: [
            Container(
              color: Colors.grey[100],
            ),
            Positioned(
              top: 80,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Kayıt Ol',
                  style: TextStyle(fontFamily: 'Bebas', fontSize: 30),
                ),
              ),
            ),
             Positioned(
              top: 120,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 190,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: name,
                    decoration: InputDecoration(
                      labelText: 'name',
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 260,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: pass,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                ),
              ),
            ),
       
            Positioned(
              top: 350,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      color: Colors.pink,
                      child: Text(
                        "Kayıt Ol",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        signUp();
                      },
                    )),
              ),
            ),
            Positioned(
              top: 420,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Veya Giriş Yap",
                    style: TextStyle(color: Colors.pink),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 440,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    child: Text(
                      "Giriş Yapmak İçin Tıklayın",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onPressed: () {
                      debugPrint("test signin");
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginStudent()),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}