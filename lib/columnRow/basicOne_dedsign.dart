import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicColumnAndRow2 extends StatefulWidget {
  @override
  _BasicColumnAndRowState createState() => _BasicColumnAndRowState();
}

class _BasicColumnAndRowState extends State<BasicColumnAndRow2> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: buildAppBar(),
      body:
          //Center(child:
          SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 100,
              child: Container(
                padding: EdgeInsets.all(15),
                color: Color(0xFF00B6F0),
                alignment: Alignment.topLeft,
                child: (Text('')),
              ),
            ),
            Container(
                //width: 350,
                padding: EdgeInsets.all(15),
                color: Colors.transparent,
                child: buildName()
                //TextField(autocorrect: true, decoration: InputDecoration(hintText: 'Enter Your First Name Here'),)
                ),
            Container(
              //width: 350,
              padding: EdgeInsets.all(15),
              color: Colors.white24,
              child: Expanded(
                flex: 4,
                child: Row(
                  children: <Widget>[
                    //middlerow 1 50% of screen
                    Expanded(
                      flex: 5,
                      child: Container(
                          color: Colors.transparent,
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(right: 5),
                          child: buildName()),
                    ),

                    //middlerow 1 50% of screen
                    Expanded(
                      flex: 5,
                      child: Container(
                          color: Colors.transparent,
                          alignment: Alignment.center,
                          child: buildName()
                          //Text("#2-2"),
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                //width: 350,
                padding: EdgeInsets.all(15),
                child: TextField(
                  //controller: subject,
                  autocorrect: true,
                  decoration:
                      InputDecoration(hintText: 'Enter Your Subject Here'),
                )),
            Container(
                //width: 350,
                padding: EdgeInsets.all(15),
                child: TextField(
                  //controller: subject,
                  autocorrect: true,
                  decoration:
                      InputDecoration(hintText: 'Enter Your Subject Here'),
                )),
            Container(
                //width: 350,
                padding: EdgeInsets.all(15),
                child: TextField(
                  //controller: subject,
                  autocorrect: true,
                  decoration:
                      InputDecoration(hintText: 'Enter Your Subject Here'),
                )),
            Container(
                //width: 350,
                padding: EdgeInsets.all(15),
                child: TextField(
                  //controller: subject,
                  autocorrect: true,
                  decoration:
                      InputDecoration(hintText: 'Enter Your Subject Here'),
                )),
            Container(
                //width: 350,
                padding: EdgeInsets.all(15),
                child: TextField(
                  //controller: subject,
                  autocorrect: true,
                  decoration:
                      InputDecoration(hintText: 'Enter Your Subject Here'),
                )),
            Container(
                //width: 350,
                padding: EdgeInsets.all(15),
                child: TextField(
                  //controller: className,
                  autocorrect: true,
                  decoration:
                      InputDecoration(hintText: 'Enter Your Class Here'),
                )),
            Container(
                //width: 350,
                padding: EdgeInsets.all(15),
                child: TextField(
                  //controller: phoneNumber,
                  autocorrect: true,
                  decoration:
                      InputDecoration(hintText: 'Enter Your Phone Number Here'),
                )),
            RaisedButton(
              //onPressed: getValues,
              color: Colors.green,
              textColor: Colors.white,
              //padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              padding: EdgeInsets.all(15),
              child: Text('Click Here To Get Text Field Entered Data'),
            ),
          ],
        ),
      )

      /*Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.all(15),
            color: Color(0xFF00B6F0),
            alignment: Alignment.topLeft,
            child:(
                buildName()
            ),
          ),
        ),

        //row 2 40% of screen
        Expanded(
          flex: 4,
          child: Row(
            children: <Widget>[

              //middlerow 1 50% of screen
              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.black45,
                  alignment: Alignment.center,
                  child: Text("#2-1"),
                ),
              ),

              //middlerow 1 50% of screen
              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.black54,
                  alignment: Alignment.center,
                  child: Text("#2-2"),
                ),
              ),

            ],
          ),

        ),

        //row 3 20% of screen
        Expanded(
          flex: 4,
          child: Row(
            children: <Widget>[

              //middlerow 1 50% of screen
              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.green,
                  alignment: Alignment.center,
                  child: Text("#3-1"),
                ),
              ),

              //middlerow 2 50% of screen
              Expanded(
                flex: 5,
                child: Column(
                  children: <Widget>[

                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.blueAccent,
                        alignment: Alignment.center,
                        child: Text("#3-2-1"),
                      ),
                    ),

                    Expanded(
                      flex: 8,
                      child: Container(
                        color: Colors.blueGrey,
                        alignment: Alignment.center,
                        child: Text("#3-2-2"),
                      ),
                    ),

                    Expanded(
                      flex: 4,
                      child: Container(
                        color: Colors.blueAccent,
                        alignment: Alignment.center,
                        child: Text("#3-2-3"),
                      ),
                    ),

                  ],
                ),

              ),
            ],
          ),
        ),

        //row 4 20% of screen
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.redAccent,
            alignment: Alignment.center,
            child: Text("#4"),
          ),
        ),

      ],
    ),*/

      );

  //widget class
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xFF00B6F0),
      leading: IconButton(
        icon: Icon(Icons.keyboard_backspace),
      ),
    );
  }

  Widget buildName() => buildTitle(
        title: 'Name',
        child: TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Your Name',
          ),
        ),
      );

  Widget buildTitle({
    @required String title,
    @required Widget child,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 5),
          child,
        ],
      );
}
