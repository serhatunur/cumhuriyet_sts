import 'package:cumhuriyet_sts/dashboards/turkozudash.dart';
import 'package:flutter/material.dart';
import 'package:cumhuriyet_sts/auth/signupstudent.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../dashboards/akdere.dart';
import '../dashboards/bayi.dart';
import '../dashboards/bogazicidash.dart';
import '../dashboards/ertugrulgazi.dart';
import '../dashboards/ilkerdash.dart';
import '../dashboards/imalat.dart';
import '../dashboards/tuzlucayirdash.dart';

const List<String> list = <String>[
  'Tuzlucayir',
  'Turkozu',
  'Bogazici',
  'Akdere',
  'Ertugrulgazi',
  'ilker',
  'Bayi',
  'imalat'
];

class LoginStudent extends StatefulWidget {
  const LoginStudent({super.key});

  @override
  State<LoginStudent> createState() => _LoginStudentState();
}

class _LoginStudentState extends State<LoginStudent> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  String dropdownValue = list.first;

  Future login() async {
    var url = "http://qrcumhuriyetfirini.online/cumhuriyetserver/auth/studentlogin.php";
    var response = await http.post(Uri.parse(url), body: {
      "email": email.text,
      "password": pass.text,
      "sube": dropdownValue
    });

    if (response.statusCode == 200) {
      var userData = json.decode(response.body);

      if (userData == "ERROR") {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Mesaj"),
            content: Text("Şifre veya e-mail Adresin Yanlış"),
            actions: [
              MaterialButton(
                color: Colors.red,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Kapat"),
              )
            ],
          ),
        );
      } else {
        if (dropdownValue == 'Turkozu') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  TurkozuDash(name: userData["name"], email: userData["email"], sube: userData['sube']),
            ),
          );
        } else if (dropdownValue == 'Tuzlucayir') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => TuzlucayirDash(
                  name: userData["name"], email: userData["email"], sube: userData['sube']),
            ),
          );
        } else if (dropdownValue == 'Bogazici') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BogaziciDash(
                  name: userData["name"], email: userData["email"], sube: userData['sube']),
            ),
          );
        } else if (dropdownValue == 'Akdere') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  AkdereDash(name: userData["name"], email: userData["email"], sube: userData['sube']),
            ),
          );
        } else if (dropdownValue == 'Ertugrulgazi') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ErtugrulgaziDash(
                  name: userData["name"], email: userData["email"], sube: userData['sube']),
            ),
          );
        }else if (dropdownValue == 'Bayi') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BayiDash(
                  name: userData["name"], email: userData["email"], sube: userData['sube']),
            ),
          );
        }else if (dropdownValue == 'ilker') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ilkerDash(
                  name: userData["name"], email: userData["email"], sube: userData['sube']),
            ),
          );
        }else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  BayiDash(name: userData["name"], email: userData["email"]),
            ),
          );
        }
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Mesaj"),
            content: Text("Giriş Başarılı"),
            actions: [
              MaterialButton(
                color: Colors.red,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Kapat"),
              )
            ],
          ),
        );
        print(userData);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Giriş Sayfası'),
        ),
        body: Stack(
          children: [
            Container(
              color: Colors.grey[100],
            ),
            Positioned(
              top: 90,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Giriş Yap',
                  style: TextStyle(fontFamily: 'Bebas', fontSize: 30),
                ),
              ),
            ),
            Positioned(
              top: 140,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
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
                    controller: email,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
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
                        "Giriş",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        login();
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
                    "Veya Kayıt OL",
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
                      "Kayıt Olmak İçin Tıklayın",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onPressed: () {
                      debugPrint("signup check");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpStudent()),
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
