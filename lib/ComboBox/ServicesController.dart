import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:formdesign/ComboBox/UserModel.dart';

class ServicesController {
  static const String url = 'https://jsonplaceholder.typicode.com/users';
  //final List<Map<String, dynamic>> _rolesLocal = [
  static Future<List<UserListModel>> getUsers() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserListModel> list = parseUsers(response.body);
        return list;
      } else {
        throw Exception("error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<UserListModel> parseUsers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<UserListModel>((json) => UserListModel.fromJson(json)).toList();
  }
}