import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:http/http.dart' as http;

void main() => runApp(Group_card());

class Group_card extends StatefulWidget {
  @override
  _DesignFlatState createState() => _DesignFlatState();
}

class _DesignFlatState extends State<Group_card> {
  List data;

  //with json http
  @override
  void initState() {
    this.getdata();
    super.initState();
  }

  Future<String> getdata() async{
    var response = await http.get(
        Uri.encodeFull("https://corona.lmao.ninja/v2/countries"),
        headers: {"Accept" : "application/json"}
    );
    this.setState((){
      data = json.decode(response.body);
    });
  }
  //with json http

  //with manual
  List _elements =[
  {'country': 'John', 'continent': 'Team A'},
  {'country': 'Will', 'continent': 'Team B'},
  {'country': 'Beth', 'continent': 'Team A'},
  {'country': 'Miranda', 'continent': 'Team B'},
  {'country': 'Mike', 'continent': 'Team C'},
  {'country': 'Danny', 'continent': 'Team C'},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo group card',
      theme: ThemeData(primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Grouped List View Example'),
        ),
        body:
          GroupedListView<dynamic, String>(
          elements: data, //_elements,
          groupBy: (element) => element['country'].toString(),
          groupComparator: (value1, value2) => value2.compareTo(value1),
          itemComparator: (item1, item2) => item1['continent'].compareTo(item2['continent']),
          order: GroupedListOrder.DESC,
          useStickyGroupSeparators: true,
          groupSeparatorBuilder: (String value) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(value,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          itemBuilder: (c, element) {
            return Card(
              elevation: 8.0,
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(
                child: ListTile(
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  leading: Icon(Icons.account_circle),
                  title: Text(element['continent']),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
            );
          },
        ),


      ),
    );
  }
}