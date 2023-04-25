import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cumhuriyet_sts/studentcrud/studentcrud.dart';

class AddEditPageStudent extends StatefulWidget {
  final list;
  final index;
  const AddEditPageStudent({super.key, this.list, this.index});

  @override
  State<AddEditPageStudent> createState() => _AddEditPageStudentState();
}

class _AddEditPageStudentState extends State<AddEditPageStudent> {

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController sube = TextEditingController();
  bool editMode = false;
  addUpdateData() {
    if (editMode) {
      var url = 'http://qrcumhuriyetfirini.online/cumhuriyetserver/userstudentcrud/kullaniciedit.php';
      http.post(Uri.parse(url), body: {
        'id': widget.list[widget.index]['id'],
        'name': name.text,
        'email': email.text,
        'pass': pass.text,
        'sube': sube.text,
      });
    } else {
      var url = 'http://qrcumhuriyetfirini.online/cumhuriyetserver/userstudentcrud/kullaniciadd.php';
      http.post(Uri.parse(url), body: {
        'name': name.text,
        'email': email.text,
        'pass': pass.text,
        'sube': sube.text,
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      editMode = true;
      name.text = widget.list[widget.index]['name'];
      email.text = widget.list[widget.index]['email'];
      pass.text = widget.list[widget.index]['password'];
      sube.text = widget.list[widget.index]['sube'];
    }
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(editMode ? 'Update' : 'Add Data'),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                  labelText: ' Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  labelText: 'email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: pass,
                decoration: InputDecoration(
                  labelText: 'password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: sube,
                decoration: InputDecoration(
                  labelText: 'sube',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    addUpdateData();
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyWidget(),
                    ),
                  );
                  debugPrint('Clicked RaisedButton Button');
                },
                color: Colors.blue,
                child: Text(
                  editMode ? 'Update' : 'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

