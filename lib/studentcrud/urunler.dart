import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cumhuriyet_sts/studentcrud/studenteditadd.dart';

import '../controller/controller.dart';
import 'costduzenle.dart';

class UrunlerWidget extends StatefulWidget {
  String? sube;
  String? name;
  int? urunturu;
  UrunlerWidget({this.sube, this.urunturu, this.name});

  @override
  State<UrunlerWidget> createState() => _UrunlerWidget();
}

class _UrunlerWidget extends State<UrunlerWidget> {
  Future getData() async {
    var url =
        'http://qrcumhuriyetfirini.online/cumhuriyetserver/userstudentcrud/urunler.php';
    var response = await http.post(Uri.parse(url),
        body: {"sube": widget.sube, "urunturu": widget.urunturu.toString()});
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
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    List list = snapshot.data;
                    return ListTile(
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
                      subtitle: Row(
                        children: [
                          Text(list[index]['sube']),
                          SizedBox(
                            width: 20,
                          ),
                          Text(list[index]['tarih']),
                        ],
                      ),
                      trailing: GestureDetector(
                        child: MyStatefulWidget(idm: list[index]['id'], name: widget.name
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator();
        },
      ),
    );
  }
}
