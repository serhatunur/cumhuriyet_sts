import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cumhuriyet_sts/studentcrud/studentcrud.dart';

class AddEditPageUrun extends StatefulWidget {
  final list;
  final index;
  const AddEditPageUrun({super.key, this.list, this.index});

  @override
  State<AddEditPageUrun> createState() => _AddEditPageUrun();
}

class _AddEditPageUrun extends State<AddEditPageUrun> {

  TextEditingController adi = TextEditingController();
  TextEditingController barcode = TextEditingController();

  bool editMode = false;
  addUpdateData() {
    if (editMode) {
      var url = 'http://qrcumhuriyetfirini.online/cumhuriyetserver/userstudentcrud/yeniurunedit.php';
      http.post(Uri.parse(url), body: {
        'id': widget.list[widget.index]['id'],
        'adi': adi.text,
        'barcode': barcode.text,
      });
    } else {
      var url = 'http://qrcumhuriyetfirini.online/cumhuriyetserver/userstudentcrud/yeniurunadd.php';
      http.post(Uri.parse(url), body: {
        'adi': adi.text,
        'barcode': barcode.text,
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      editMode = true;
      adi.text = widget.list[widget.index]['adi'];
      barcode.text = widget.list[widget.index]['barcode'];
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
                controller: adi,
                decoration: InputDecoration(
                  labelText: ' Urun Adi',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: barcode,
                decoration: InputDecoration(
                  labelText: 'barcode',
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
                      builder: (context) => AddEditPageUrun(),
                    ),
                  );
                  debugPrint('Clicked RaisedButton Button');
                },
                color: Colors.blue,
                child: Text(
                  editMode ? 'Update' : 'Kaydet',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

