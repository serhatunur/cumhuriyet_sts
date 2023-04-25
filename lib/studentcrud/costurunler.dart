import 'dart:convert';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cumhuriyet_sts/studentcrud/studenteditadd.dart';
import  'package:intl/intl.dart' ;
import '../controller/controller.dart';
import 'costduzenle.dart';
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

class CostUrunlerWidget extends StatefulWidget {
  String? sube;
  int? urunturu;
  CostUrunlerWidget({this.sube, this.urunturu});

  @override
  State<CostUrunlerWidget> createState() => _CostUrunlerWidget();
}

class _CostUrunlerWidget extends State<CostUrunlerWidget> {
  final format = DateFormat("yyyy-MM-dd");
  String onay = 'true';
  DateTime? value;
  String dropdownValue = list.first;
  Future getData() async {
    var url =
        'http://qrcumhuriyetfirini.online/cumhuriyetserver/userstudentcrud/costurunler.php';
    var response = await http
        .post(Uri.parse(url), body: {"urunturu": widget.urunturu.toString(), "tarih": value.toString(), 'sube': dropdownValue.toString(),});
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ürünler'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          Navigator.pop(context);
          debugPrint('Clicked FloatingActionButton Button');
        },
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child:  Container(
                  height: 50,
                  child: DateTimeField(
                    initialValue: value,
                    format: format,
                    onShowPicker: (context, currentValue) async {
                      await showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return BottomSheet(
                              builder: (context) => Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    constraints: BoxConstraints(maxHeight: 200),
                                    child: CupertinoDatePicker(
                                      onDateTimeChanged: (DateTime date) {
                                        value = date;
                                      },
                                    ),
                                  ),
                                  TextButton(onPressed: () => Navigator.pop(context), child: Text('Ok')),
                                ],
                              ),
                              onClosing: () {},
                            );
                          });
                      setState(() {});
                      return value;
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: Container(

                  height: 62,
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    underline: Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items:
                    list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),

          Expanded(
            flex: 10,
            child: Container(
              child: FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            List list = snapshot.data;
                            return ListTile(
                              tileColor: list[index]['onay'] == 'true'
                                  ? Colors.white
                                  : Colors.red,
                              leading: GestureDetector(
                                child: Icon(Icons.edit),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CostDuzenle(
                                        list: list,
                                        index: index,
                                      ),
                                    ),
                                  );
                                  debugPrint('Edit Clicked');
                                },
                              ),
                              title: Row(
                                children: [
                                  Text(list[index]['urunadi']),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(list[index]['miktar']),
                                ],
                              ),
                              subtitle: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(list[index]['sube']),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(list[index]['tarih']),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(list[index]['teslimalan']),
                                    ],
                                  ),
                                  Text(list[index]['aciklama']),
                                ],
                              ),
                              trailing: GestureDetector(child: Icon(Icons.delete),
                                onTap: (){
                                  setState(() {
                                    var url = 'http://qrcumhuriyetfirini.online/cumhuriyetserver/userstudentcrud/delete.php';
                                    http.post(Uri.parse(url),body: {
                                      'id' : list[index]['id'],
                                    });
                                  });
                                  Navigator.pop(context);
                                  debugPrint('delete Clicked');
                                },),


                            );
                          })
                      : CircularProgressIndicator();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
