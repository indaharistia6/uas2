import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import './adddata.dart';
import './detail.dart';


class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  //disimpan dalam sebuah list berati menggunakan future
  //mengambil data dari database
  Future<List> getData() async {
    final response =
        await http.get("http://192.168.43.33:8080/api_pariwisata/getdata.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Pariwisata"),
      ),
      //tap nambah
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new AddData(),
        )),
      ),
      
      //masukkan dalam bentuk list
      body: new FutureBuilder<List>(
        future: getData(), //future berasal dari get data
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error); //penanganan untuk error
          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

//buat class itemlist

class ItemList extends StatelessWidget {
//kalo masih ijo butuh final
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      //ngitung data yang masuk
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: ()=>Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context)=> new Detail(list: list , index: i,)
              )
            ),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['nama']),
                leading: new Icon(Icons.widgets),
                subtitle: new Text("Tempat : ${list[i]['tempat']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
