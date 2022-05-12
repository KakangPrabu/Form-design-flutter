import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicColumnAndRow extends StatefulWidget {
  @override
  _BasicColumnAndRowState createState() => _BasicColumnAndRowState();
}

class _BasicColumnAndRowState extends State<BasicColumnAndRow> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>

      /*
        Scaffold(

        body: SafeArea(
          child: Row(
            //crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              /*Container(
                width: 100.0,
                color: Colors.red,
              ),

              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      height: 100.0,
                      color: Colors.yellow,
                    ),
                    Container(
                      width: 100.0,
                      height: 100.0,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),

              Container(
                width: 100.0,
                color: Colors.blue,
              ),
              */

              Container(
                width: 392,
                //height: 600,

                child: Row(
                  children: <Widget>[

                    Expanded(flex: 4,
                      child: Container(
                        color: Colors.red,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),

                    Expanded(flex: 4,
                      child: Column(
                        children: <Widget>[
                          Expanded(flex:2,
                            child: Container(
                              color: Colors.yellow,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          Expanded(flex:2,
                            child: Container(
                              color: Colors.blue,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(flex: 4,
                      child: Container(
                        color: Colors.green,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),

                  ],
                ),
              ),


            ],
          ),
        ),
      );
*/


          Scaffold(
            appBar: buildAppBar(),
              body:
                Column(
                  children: <Widget>[

                      Expanded(
                        flex: 4,
                        child:
                        Container(
                          padding: EdgeInsets.all(15),
                          color: Color(0xFF00B6F0),
                          alignment: Alignment.topLeft,
                          child:

                          /*
                          Container(
                            margin: EdgeInsets.only(top: 15, left: 20, bottom: 15),
                            child: Text(
                              'Today',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54),
                            ),
                          ),*/

                          /////
                          Container(
                            //height: 100,
                            padding: EdgeInsets.all(5),
                            color: Colors.transparent,
                            child:
                              Row(
                                children: <Widget>[

                                  //middlerow 1 50% of screen
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      color: Colors.transparent,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.only(right: 1),
                                      child: Container(
                                        height: 130.0,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(fit: BoxFit.cover, image: NetworkImage('https://assets.mycast.io/actor_images/actor-sharon-sahertian-205085_large.jpg?1619290076'))),
                                      ),
                                    ),
                                  ),

                                  //middlerow 1 50% of screen
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      color: Colors.transparent,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.only(right: 1),
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              "999",
                                              style: TextStyle(
                                                fontSize: 16, //16
                                                fontWeight: FontWeight.bold,
                                                height: 1.6,
                                              ),
                                            ),
                                            SizedBox(height: 8),
                                            Text('Rating 15'),
                                          ]
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      color: Colors.transparent,
                                      alignment: Alignment.center,
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(Icons.notification_important, color: Colors.red),
                                            SizedBox(height: 8),
                                            Text('Rating 15'),
                                          ]
                                      ),
                                      //Text("#2-2"),
                                    ),
                                  ),

                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                        color: Colors.transparent,
                                        alignment: Alignment.center,
                                        child: Text("image")
                                      //Text("#2-2"),
                                    ),
                                  ),

                                ],
                              ),

                          ),
                          /////


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
                                  child: Container(
                                    margin: EdgeInsets.only(top: 15, left: 20, bottom: 15),
                                    child: Text(
                                      'Today',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black87),
                                    ),
                                  ),
                                ),
                              ),

                              //middlerow 1 50% of screen
                              Expanded(
                                flex: 5,
                                child: Container(
                                  color: Colors.transparent,
                                  alignment: Alignment.center,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                                    padding: EdgeInsets.fromLTRB(5, 13, 5, 13),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Image.asset('assets/images/checked.png'),
                                        Text(
                                          '07.00 AM',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Container(
                                          width: 180,
                                          child: Text(
                                            'Go jogging with Christin',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                //fontWeight: FontWeight.w600,
                                                decoration: TextDecoration.lineThrough),
                                          ),
                                        ),
                                        Image.asset('assets/images/bell-small.png'),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        stops: [0.015, 0.015],
                                        colors: [Colors.yellowAccent, Colors.white],
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.0),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.blueGrey,
                                          blurRadius: 10.0,
                                          spreadRadius: 5.0,
                                          offset: Offset(0.0, 0.0),
                                        ),
                                      ],
                                    ),
                                  ),

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
                ),

          );

      /*
      SafeArea(
        child: Scaffold(
          body: Container(
              child: Stack(
            alignment: Alignment.bottomCenter,
            overflow: Overflow.visible,
            children: <Widget>[

              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 240.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(fit: BoxFit.cover, image: NetworkImage('https://timelinecovers.pro/facebook-cover/download/stunning-little-flowers-facebook-cover.jpg'))),
                    ),
                  ),
                ],
              ),

              Positioned(
                top: 0.0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                              onPressed: () {}),
                          Text(
                            'My Profile',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ],
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                          onPressed: () {}),
                    ],
                  ),
                  height: 52,
                ),
              ),

              Positioned(
                top: 120.0,
                child: Container(
                  height: 210.0,
                  width: 210.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage('https://media-cldnry.s-nbcnews.com/image/upload/t_fit-2000w,f_auto,q_auto:best/rockcms/2021-11/211110-elon-musk-jm-1954-9aa966.jpg'),
                      ),
                      border: Border.all(color: Colors.white, width: 6.0)),
                ),
              ),

            ],
          )),
        ),
      );
      */

    AppBar buildAppBar() {
      return AppBar(
        leading: IconButton(
          icon: Icon(Icons.home),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.keyboard_backspace)),
          Center(
            child: Text(
              "Scan",
              style: TextStyle(color: Colors.transparent, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(),
        ],
      );
    }

}
