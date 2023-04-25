import 'package:flutter/material.dart';
import 'package:cumhuriyet_sts/auth/signupmanagement.dart';
import 'package:cumhuriyet_sts/dashboards/userManagementDash.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginManagement extends StatefulWidget {
  const LoginManagement({super.key});

  @override
  State<LoginManagement> createState() => _LoginManagementState();
}

class _LoginManagementState extends State<LoginManagement> {
   TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

Future login() async {
    var url = "http://qrcumhuriyetfirini.online/cumhuriyetserver/auth/umanagementlogin.php";
    var response = await http.post(Uri.parse(url),
        body: {"email": email.text, "password": pass.text});

    if (response.statusCode == 200) {
      var userData = json.decode(response.body);

      if (userData == "ERROR") {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Mesaj"),
            content: Text("E-mail Veya Şifre Hatalı"),
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
       
         Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => userManagementDash(name: userData["name"],email:userData["email"]),
            ),
          );

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
          title: Text('Giriş'),
        ),
        body: Stack(
          children: [
            Container(
              color: Colors.grey[100],
            ),
            Positioned(
              top: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Giriş Yap',
                  style: TextStyle(fontFamily: 'Bebas', fontSize: 30),
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
                        "Login",
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
                    "Veya Kayıt Ol",
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
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => SignupManagement()),
                      // );
                    },
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}