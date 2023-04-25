
import 'dart:convert';

import 'package:cumhuriyet_sts/studentcrud/yeniurunadd.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cumhuriyet_sts/studentcrud/studenteditadd.dart';
class UrunWidget extends StatefulWidget {
  const UrunWidget({super.key});

  @override
  State<UrunWidget> createState() => _UrunWidget();
}

class _UrunWidget extends State<UrunWidget> {
   Future getData()async{
    var url = 'http://qrcumhuriyetfirini.online/cumhuriyetserver/userstudentcrud/urunread.php';
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }


  @override
  void initState() {
    super.initState();

  }
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Urunler'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddEditPageUrun(),),);
          debugPrint('Clicked FloatingActionButton Button');
        },
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context,snapshot){
          if(snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context,index){
                List list = snapshot.data;
                return ListTile(
                  leading: GestureDetector(child: Icon(Icons.edit),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddEditPageUrun(list: list,index: index,),),);
                    debugPrint('Edit Clicked');
                  },),
                  title: Text(list[index]['adi']),
                  subtitle: Text(list[index]['barcode']),
                  trailing: GestureDetector(child: Icon(Icons.delete),
                    onTap: (){
                      setState(() {
                        var url = 'http://qrcumhuriyetfirini.online/cumhuriyetserver/userstudentcrud/urundelete.php';
                        http.post(Uri.parse(url),body: {
                          'id' : list[index]['id'],
                        });
                      });
                      Navigator.pop(context);
                      debugPrint('delete Clicked');
                    },),
                );
              }
          )
              : CircularProgressIndicator();
        },
      ),
    );
  }
}