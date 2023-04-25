import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cumhuriyet_sts/studentcrud/studentcrud.dart';

import 'costurunler.dart';

class CostDuzenle extends StatefulWidget {
  final list;
  final index;
  const CostDuzenle({super.key, this.list, this.index});

  @override
  State<CostDuzenle> createState() => _CostDuzenle();
}

class _CostDuzenle extends State<CostDuzenle> {

  TextEditingController urunadi = TextEditingController();
  TextEditingController miktar = TextEditingController();
  TextEditingController sube = TextEditingController();
  TextEditingController aciklama = TextEditingController();
  bool editMode = false;
  addUpdateData() {
    if (editMode) {
      var url = 'http://qrcumhuriyetfirini.online/cumhuriyetserver/userstudentcrud/edit.php';
      http.post(Uri.parse(url), body: {
        'id': widget.list[widget.index]['id'],
        'urunadi': urunadi.text,
        'miktar': miktar.text,
        'sube': sube.text,
        'aciklama': aciklama.text,
      });
    } else {
      var url = 'http://qrcumhuriyetfirini.online/cumhuriyetserver/userstudentcrud/add.php';
      http.post(Uri.parse(url), body: {
        'urunadi': urunadi.text,
        'miktar': miktar.text,
        'sube': sube.text,
        'aciklama': aciklama.text,
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      editMode = true;
      urunadi.text = widget.list[widget.index]['urunadi'];
      miktar.text = widget.list[widget.index]['miktar'];
      sube.text = widget.list[widget.index]['sube'];
      aciklama.text = widget.list[widget.index]['aciklama'];
    }
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(editMode ? 'Güncelle' : 'Add Data'),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: urunadi,
                decoration: InputDecoration(
                  labelText: 'Ürün Adı',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: miktar,
                decoration: InputDecoration(
                  labelText: 'Miktar',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: sube,
                decoration: InputDecoration(
                  labelText: 'Sube',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: aciklama,
                decoration: InputDecoration(
                  labelText: 'Acıklama',
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
                  Navigator.pop(context);
                  debugPrint('Clicked RaisedButton Button');
                },
                color: Colors.blue,
                child: Text(
                  editMode ? 'Kaydet' : 'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

