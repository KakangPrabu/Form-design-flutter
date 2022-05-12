import 'package:flutter/material.dart';
import 'package:formdesign/ComboBox/ServicesController.dart';
import 'package:formdesign/buildClass/constant.dart';
import 'dart:async';
import 'dart:convert';
import '../form1.dart';
import 'UserModel.dart';

class combo_selectField extends StatefulWidget {
  final String idUser;

  const combo_selectField({
    Key key,
    this.idUser,
  }) : super(key: key);

  @override
  combo_selectFieldState createState() => combo_selectFieldState();
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

class combo_selectFieldState extends State<combo_selectField> {
  String        name;
  String        itemHolder;
  //list search
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
    /*return
    Scaffold(
      appBar: AppBar(
        title: Text('combo select'),
      ),

        body: SafeArea(
        child:
          ListView(
              padding: EdgeInsets.all(16),
              children: [

                const SizedBox(height: 32),
                buildName(),

                const SizedBox(height: 16,),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(10.0),
                    itemCount: filteredUsers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                filteredUsers[index].name,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                filteredUsers[index].email.toLowerCase(),
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

              ],

          ),

        ),
    );
*/
    return Scaffold(
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          Container(
            height: 120,
            color: Colors.grey[100],
            child: Padding(
              padding: EdgeInsets.all(0),

/*
              child: AppBar(
                title: Container(
                  color: Colors.white,
                  child:
                  TextField(

                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "Search name and e-mail",
                      contentPadding: EdgeInsets.only(left: 15, right: 15),
                    ),

                    onChanged: (string) {
                      _debouncer.run(() {
                        setState(() {
                          filteredUsers = users
                              .where((u) =>
                          (u.name.toLowerCase().contains(string.toLowerCase())
                              ||
                              u.email.toLowerCase().contains(string.toLowerCase())
                          ))
                              .toList();
                        });
                      });
                    },

                  ),
                ),

                actions: [

                  /*FlatButton(
                    onPressed: () {
                    },
                    child: new Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 25.0,
                    ),
                    //shape: new CircleBorder(),
                    //color: Colors.black12,

                  ),


                  IconButton(
                    icon: Icon(Icons.playlist_add_check),
                    onPressed: () => null,

                  ),
                  */

                  Hero(
                    tag: 'text',
                    transitionOnUserGestures: true,
                    child: Material(
                      type: MaterialType.transparency,
                      child: IconButton(
                          onPressed: () {

                          },
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          )),
                    ),
                  ),

                ],
              ) ,
*/

              //app bar
              child: AppBar(
                elevation: 0,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.redAccent,
                flexibleSpace: SafeArea(
                  child: Container(
                    padding: EdgeInsets.only(right: 16),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back,color: Colors.black,),
                        ),
                        /*SizedBox(width: 2,),
                        CircleAvatar(
                          backgroundImage: NetworkImage("<https://randomuser.me/api/portraits/men/5.jpg>"),
                          maxRadius: 20,
                        ),*/
                        SizedBox(width: 12,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              //Text("Kriss Benwat",style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                              //SizedBox(height: 6,),
                              //Text("Online",style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),

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
                                        borderRadius: BorderRadius.circular(5),
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


                              /*
                              TextField(
                                autofocus: true,
                                decoration: InputDecoration(
                                  hintText: "Search name and e-mail",
                                  contentPadding: EdgeInsets.only(left: 15, right: 15),
                                ),

                                onChanged: (string) {
                                  _debouncer.run(() {
                                    setState(() {
                                      filteredUsers = users
                                          .where((u) =>
                                      (u.name.toLowerCase().contains(string.toLowerCase())
                                          ||
                                          u.email.toLowerCase().contains(string.toLowerCase())
                                      ))
                                          .toList();
                                    });
                                  });
                                },
                              ),
                              */
                            ],
                          ),
                        ),
                        SizedBox(width: 12,),

                        Icon(Icons.settings,color: Colors.black54,),
                      ],
                    ),
                  ),
                ),
              ),
              //app bar


            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: filteredUsers.length,
              itemBuilder: (BuildContext context, int index) {

                return Padding(
                    padding: EdgeInsets.all(10.0),
                    child:
                    GestureDetector(
                    child:Column(

                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          filteredUsers[index].name,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,

                        ),
                        Text(
                          filteredUsers[index].email.toLowerCase(),
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),

                        Text("2h",style: TextStyle(fontSize: 12,fontWeight: true ? FontWeight.bold:FontWeight.normal),),

                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                "12.00",
                                maxLines: 2,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.star_outline,
                                color: Colors.lime,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.all_inclusive,
                                color: Colors.lightBlue,
                              ),
                            ),
                          ],
                        ),

                        Divider(
                          height: .5,
                          indent: 0,
                          color: Colors.grey[400],//Color(0xFFDDDDDD),
                        ),

                      ],

                    ),
                        onTap: ()=>{
                          //_showToast(context, filteredUsers[index].email.toLowerCase(),),
                          getItemAndNavigate(filteredUsers[index].email.toLowerCase(), context)
                        }
                    ),


                );

                },

            ),

          ),

        ],
      ),

    );


  }

  void _showToast(BuildContext context, String getData) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Added to favourite'),
        action: SnackBarAction(
          label: getData,
          onPressed:scaffold.hideCurrentSnackBar,
        ),
      ),
    );
  }

  getItemAndNavigate(String item, BuildContext context){
    getValue = item;
    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserPage(itemHolder : item,)));
    Navigator.pop(context,true);
  }


}
