import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  String? idm;
  String? name;
  MyStatefulWidget({this.idm, this.name});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState(adam: idm, adi: name);
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool isChecked = false;
  String? adam;
  String? adi;
  _MyStatefulWidgetState({this.adam, this.adi});



  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
          var url = 'http://qrcumhuriyetfirini.online/cumhuriyetserver/userstudentcrud/onay.php';
          http.post(Uri.parse(url), body: {
            'id':adam.toString(),
            'onay':isChecked.toString(),
            'onaylayan':adi.toString(),
          });
        });
      },
    );
  }
}
