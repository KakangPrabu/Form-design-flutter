//https://medium.com/flutter-community/build-your-responsive-flutter-layout-like-a-pro-6bf86aaed81e
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formdesign/responsive_design/lib_me/constants.dart';
import 'package:formdesign/responsive_design/lib_me/responsive.dart';

//import '../Size_config.dart';

class DesignFlat extends StatefulWidget {
  @override

  _DesignFlatState createState() => _DesignFlatState();
}


class _DesignFlatState extends State<DesignFlat> {
  double defaultSize = 16;//SizeConfig.defaultSize;

  @override
  void dispose() {
    //SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>

        Scaffold(
          appBar: buildAppBar(),
          body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                //child: AspectRatio( aspectRatio: 3,
               child:
                Container(
                  //padding: EdgeInsets.all(10),
                  padding: EdgeInsets.all(isMobile(context) ? 10 : 20),
                  color: Colors.white70, //Color(0xFF00B6F0),
                  alignment: Alignment.topLeft,
                  child:
                  /////
                  Container(
                    padding: EdgeInsets.all(5),
                    color: Colors.transparent,
                    child:
                    Row(
                      children: <Widget>[

                        //middlerow 1 50% of screen
                        Expanded(
                          flex: 2,
                          child:Container(
                            color: Colors.transparent,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(right: 1),

                            child: Container(
                              //height: 130.0,
                              height: isMobile(context) ? 130 : 250,
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
                                      //fontSize: 13, //16
                                      fontSize: isMobile(context) ? 13 : 30,
                                      fontWeight: FontWeight.bold,
                                      height: 1.6,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  //Text('Rating 15'),
                                  Text(
                                    "Rating 15",
                                    style: TextStyle(
                                      //fontSize: 13, //16
                                      fontSize: isMobile(context) ? 10 : 20,
                                      //fontWeight: FontWeight.bold,
                                      height: 1.6,
                                    ),
                                  ),
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
                                  //Icon(Icons.notification_important, color: Colors.red, size: 40),
                                  Icon(Icons.notification_important, color: Colors.red, size: isMobile(context) ? 10 : 40,),
                                  SizedBox(height: 8),
                                  //Text('Rating 15'),
                                  Text(
                                    "Rating 20",
                                    style: TextStyle(
                                      //fontSize: 13, //16
                                      fontSize: isMobile(context) ? 10 : 20,
                                      //fontWeight: FontWeight.bold,
                                      height: 1.6,
                                    ),
                                  ),
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
                              child:                                   Text(
                                "Images",
                                style: TextStyle(
                                  //fontSize: 13, //16
                                  fontSize: isMobile(context) ? 10 : 20,
                                  //fontWeight: FontWeight.bold,
                                  height: 1.6,
                                ),
                              ),
                          ),
                        ),

                      ],
                    ),

                  ),
                  /////

                ),
              ),

              Expanded(
                flex: isMobile(context) ? 6 : 8,
                child:
                Container(
                  //padding: EdgeInsets.all(10),
                  padding: EdgeInsets.all(isMobile(context) ? 10 : 20),
                  color: Colors.transparent, //Color(0xFF00B6F0),
                  alignment: Alignment.topLeft,
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Caroline",
                          style: TextStyle(
                            fontSize: isMobile(context) ? 16 : 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Tulips (Tulipa) are a genus of spring-blooming perennial herbaceous bulbiferous geophytes (having bulbs as storage organs). The flowers are usually large, showy and brightly colored, generally red, pink, yellow, or white (usually in warm colors).",
                          style: TextStyle(
                            fontSize: isMobile(context) ? 12 : 20,
                            color: kTextColor.withOpacity(0.7),
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          //width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Expanded(
                              flex: 2,
                              child: Container(padding: EdgeInsets.only(right: 10),
                                child:
                                /*
                                FlatButton(
                                  padding: EdgeInsets.all(defaultSize * 1.5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  color: kRedColor,
                                  onPressed: (){},
                                  child: Text(
                                    "Add to Cart",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: defaultSize * 1.6,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                */

                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size.fromHeight(42),
                                    primary: Colors.redAccent,
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                  child: Text(
                                    "Send Message",
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: (){},
                                )

                              ),
                              ),

                              Expanded(
                              flex: 2,
                              child: Container(padding: EdgeInsets.only(left: 10),
                              child:
                                /*FlatButton(
                                  padding: EdgeInsets.all(defaultSize * 1.5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  color: Colors.white,
                                  onPressed: (){},
                                  child: Text(
                                    "Add to Cart",
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: defaultSize * 1.6,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),*/
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size.fromHeight(42),
                                  primary: Colors.white,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                child: Text(
                                  "Save",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.redAccent),
                                ),
                                onPressed: (){},
                              )

                                ),
                                ),

                            ],
                          ),

                        ),


                      ],
                    ),
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
          ),

      );


  //widget class
  AppBar buildAppBar() {
    return AppBar(
      //backgroundColor: Color(0xFF00B6F0),
      backgroundColor: Colors.redAccent,
      leading:
        IconButton(icon: Icon(Icons.keyboard_backspace),),
    );
  }

  Widget buildName() => buildTitle(
    title: 'Name',
    child: TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(), hintText: 'Your Name',
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