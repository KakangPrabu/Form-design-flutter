class UserListModel {
  int id;
  String name;
  String email;

  UserListModel({this.id, this.name, this.email});

  factory UserListModel.fromJson(Map<String, dynamic> json) {
    return UserListModel(
      //id: json["id"] as int,
      name: json["name"] as String,
      email: json["email"] as String,
    );
  }
}