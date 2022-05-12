//https://www.freecodecamp.org/news/build-a-chat-app-ui-with-flutter/
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:formdesign/ComboBox/ServicesController.dart';

import 'UserModel.dart';

class chatPage extends StatefulWidget{
  final String idUser;

  const chatPage({
    Key key,
    this.idUser,
  }) : super(key: key);

  @override
  chatPageState createState() => chatPageState();

}

class Debouncer {
  final int     milliseconds;
  VoidCallback  action;
  Timer         _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}


class chatPageState extends State<chatPage> {
  final _debouncer = Debouncer(milliseconds: 500);
  List<UserListModel> users = List();
  List<UserListModel> filteredUsers = List();

  @override
  void initState() {
    super.initState();
    ServicesController.getUsers().then((UsersFromServer) {
      setState(() {
        users = UsersFromServer;
        filteredUsers = users;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: //SingleChildScrollView(
        //physics: BouncingScrollPhysics(),
//        child:
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Conversations",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
                    Container(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.pink[50],
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.add,color: Colors.pink,size: 20,),
                          SizedBox(width: 2,),
                          Text("Add New",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    )
                  ],
                ),
              ),


            ),

            //searchbar
            Padding(
              padding: EdgeInsets.only(top: 16,left: 16,right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.grey.shade100
                      )
                  ),
                ),
                  onChanged: (string) {
                    _debouncer.run(() {
                      setState(() {
                        filteredUsers =
                            users.where((u) => (u.name
                                .toLowerCase()
                                .contains(
                                string.toLowerCase()) ||
                                u.email.toLowerCase().contains(
                                    string.toLowerCase())))
                                .toList();
                      });
                    });
                  }
              ),
            ),
            //searchbar

            //listview
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(10.0),
                itemCount: filteredUsers.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: EdgeInsets.all(10.0),
                      child:
                      GestureDetector(
                        onTap: (){
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: NetworkImage("https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg"),
                                      maxRadius: 30,
                                    ),
                                    SizedBox(width: 16,),
                                    Expanded(
                                      child: Container(
                                        color: Colors.transparent,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(filteredUsers[index].name, style: TextStyle(fontSize: 16),),
                                            SizedBox(height: 6,),
                                            Text(filteredUsers[index].email,style: TextStyle(fontSize: 13,color: Colors.grey.shade600, fontWeight: true?FontWeight.bold:FontWeight.normal),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text('20.00',style: TextStyle(fontSize: 12,fontWeight: true ? FontWeight.bold:FontWeight.normal),),
                            ],
                          ),
                        ),
                      )


                  );
                },
              ),
            ),
            //listview

          ],
        ),



    //  ),


    );



  }
}
