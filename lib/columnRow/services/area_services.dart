import 'dart:convert';
import 'package:http/http.dart' as http;

import 'area_categories.dart';
import 'destination_area_model.dart';

//https://stackoverflow.com/questions/53749905/how-to-get-data-from-url-json-array-in-flutter
//https://gist.github.com/diegoveloper/c53b4a3158f2ed710a089a830ed2e4b5




Future<List<Category>> fetchCategories() async {
  //const String apiUrl = "https://jsonplaceholder.typicode.com/photos?id=2&id=3&id=4&id=6&id=8&id=13";
  const String apiUrl = "https://corona.lmao.ninja/v2/countries";
  List<Category> hourly = List();

  final response = await http.get(apiUrl);
  if (response.statusCode == 200) {

    //https://dart.dev/tutorials/web/fetch-data

    List<Category> categoriesx2 = (json.decode(response.body) as List).map((data) => Category.fromJson(data)).toList();
    return categoriesx2;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }


}
