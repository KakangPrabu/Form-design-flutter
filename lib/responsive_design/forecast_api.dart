//https://flutter-examples.com/flutter-create-json-parse-listview-using-listtile/

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(HourlyForecast());

class HourlyForecast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Center(
              child: JSONListView()
          ),
        ));
  }
}

class GetUsers {
  int id;
  String name,email,phoneNumber;
  UserAddress adres;

  GetUsers({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.adres
  });

  factory GetUsers.fromJson(Map<String, dynamic> json) {
    return GetUsers(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phoneNumber: json['phone'],
        adres: UserAddress.fromJson(json['address'])
    );
  }
}

class UserAddress {
  String city, stret;

  UserAddress(this.city, this.stret);

  factory UserAddress.fromJson(dynamic json) {
    return UserAddress(json['city'] as String, json['street'] as String);
  }

}





class JSONListView extends StatefulWidget {
  CustomJSONListView createState() => CustomJSONListView();
}

class CustomJSONListView extends State {

  final String apiURL = 'https://jsonplaceholder.typicode.com/users';

  Future<List<GetUsers>> fetchJSONData() async {

    var jsonResponse = await http.get(apiURL);

    if (jsonResponse.statusCode == 200) {
      //array reference: https://www.bezkoder.com/dart-flutter-parse-json-string-array-to-object-list/
      // #DartFlutter_parse_JSON_array_into_List
      final jsonItems = json.decode(jsonResponse.body).cast<Map<String, dynamic>>();

      List<GetUsers> usersList = jsonItems.map<GetUsers>((json) {
        return GetUsers.fromJson(json);
      }).toList();


      return usersList;

    } else {
      throw Exception('Failed to load data from internet');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON ListView in Flutter'),
      ),

      body: FutureBuilder<List<GetUsers>>(
        future: fetchJSONData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
            return ListView(
              children: snapshot.data
                  .map((user) => ListTile(
                title: Text(user.name+'-'+user.adres.city),
                onTap: (){ print(user.name); },
                subtitle: Text(user.phoneNumber),
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text(user.name[0],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      )),
                ),
              ),
              ).toList(),
            );
        },
      ),
    );
  }
}