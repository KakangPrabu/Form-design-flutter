//https://medium.com/flutter-community/build-your-responsive-flutter-layout-like-a-pro-6bf86aaed81e
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formdesign/columnRow/services/area_categories.dart';
import 'package:formdesign/columnRow/services/area_services.dart';
import 'package:formdesign/columnRow/services/destination_area_model.dart';
import 'package:formdesign/customForm/design_food_app.dart';
import 'package:formdesign/responsive_design/forecast_api.dart';
import 'package:formdesign/responsive_design/lib_me/constants.dart';
import 'package:formdesign/responsive_design/lib_me/responsive.dart';

import 'package:responsive_grid/responsive_grid.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'design_json.dart';
import 'group_card.dart';

//import '../Size_config.dart';

class DesignFlatResponsive extends StatefulWidget {
  @override

  _DesignFlatState createState() => _DesignFlatState();
}


class _DesignFlatState extends State<DesignFlatResponsive> {
  double defaultSize = 16;//SizeConfig.defaultSize;
  List<Category> ss;


  @override
  void dispose() {

    //SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    super.dispose();
  }


  @override
  Widget build(BuildContext context) =>



      Scaffold(
        appBar: AppBar(
          title: Text("Responsive Layout"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
          child: Container(
            child:
            ResponsiveGridRow(
                children: [

                  ResponsiveGridCol(
                    lg: 12,
                    child: Container(
                      //padding: EdgeInsets.all(10),
                      padding: EdgeInsets.all(isMobile(context) ? 10 : 20),
                      color: Colors.white70, //Color(0xFF00B6F0),
                      alignment: Alignment.topLeft,
                      child:
                      /////
                      Container(
                        padding: EdgeInsets.all(5),
                        color: Colors.transparent,
                        child: SafeArea(
                        child: Row(
                          children: <Widget>[

                            //middlerow 1 50% of screen
                            Expanded(
                              flex: 2,
                              child:Container(
                                color: Colors.transparent,
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(right: 1),

                                child: Container(
                                  //height: MediaQuery.of(context).size.height/40,
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
                                child: SafeArea(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "999",
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.height/40,
                                          //fontSize: isMobile(context) ? 13 : 30,
                                          fontWeight: FontWeight.bold,
                                          height: 1.6,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      //Text('Rating 15'),
                                      Text(
                                        "Rating 15",
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.height/40,
                                          //fontSize: isMobile(context) ? 10 : 20,

                                          height: 2.2,
                                        ),
                                      ),
                                    ]
                                ),
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
                                      Icon(Icons.notification_important, color: Colors.red, size: MediaQuery.of(context).size.height/40,),
                                      SizedBox(height: 8),
                                      //Text('Rating 15'),

                                      Text(
                                        "Rating 20",
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.height/40, //16
                                          //fontSize: isMobile(context) ? 10 : 20,
                                          //fontWeight: FontWeight.bold,
                                          height: 2.2,
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
                                child: Text(
                                  "Images",
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height/40,
                                    //fontSize: isMobile(context) ? 10 : 20,
                                    //fontWeight: FontWeight.bold,
                                    height: 1.6,
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                        ),
                      ),
                      /////

                    ),
                  ),

                  ResponsiveGridCol(
                    lg: 12,
                    child: Container(
                      //padding: EdgeInsets.all(10),
                      padding: EdgeInsets.all(isMobile(context) ? 15 : 20),
                      color: Colors.transparent, //Color(0xFF00B6F0),
                      alignment: Alignment.topLeft,
                      child: SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Caroline",
                              style: TextStyle(
                                fontSize: isMobile(context) ? 18 : 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Tulips (Tulipa) are a genus of spring-blooming perennial herbaceous bulbiferous geophytes (having bulbs as storage organs). The flowers are usually large, showy and brightly colored, generally red, pink, yellow, or white (usually in warm colors).",
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height/50, //isMobile(context) ? 12 : 20,
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

                                          child: //Text("Send Message", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                          Wrap(
                                            children: <Widget>[
                                              Icon(
                                                Icons.send,
                                                color: Colors.white,
                                                size: 14.0,
                                              ),
                                              SizedBox(
                                                width:10,
                                              ),
                                              Text("Send Message", style:TextStyle(fontSize:12, fontWeight: FontWeight.bold)),
                                            ],
                                          ),


                                          //onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DesignJson()));},
                                          onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HourlyForecast()));},

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
                                          child: //Text("Save", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.redAccent),),
                                          Wrap(
                                            children: <Widget>[
                                              Icon(
                                                Icons.person_add,
                                                color: Colors.redAccent,
                                                size: 14.0,
                                              ),
                                              SizedBox(
                                                width:10,
                                              ),
                                              Text("Send Message", style:TextStyle(fontSize:12, color: Colors.redAccent)),
                                            ],
                                          ),
                                          onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>food_design()));},
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

                  ResponsiveGridCol(
                      lg: 12,
                      child: Container(
                        padding: EdgeInsets.all(isMobile(context) ? 15 : 20),
                        color: Colors.transparent, //Color(0xFF00B6F0),
                        alignment: Alignment.topLeft,
                        child: SafeArea(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                  Text("March",
                                  style: TextStyle(
                                  fontSize: isMobile(context) ? 18 : 30,
                                  fontWeight: FontWeight.bold,
                                  ),
                                  ),
                                  SizedBox(height: 10),

                                  FutureBuilder(
                                    future: fetchCategories(),
                                    builder: (context, snapshot) => snapshot.hasData
                                        ? area_Categories(area_categories: snapshot.data)
                                        : Text('Please wait'),//Center(child: Image.asset("assets/images/logo.png")),
                                  ),



                                  /*Text(
                                    "Tulips (Tulipa) are a genus of spring-blooming perennial herbaceous bulbiferous geophytes (having bulbs as storage organs). The flowers are usually large, showy and brightly colored, generally red, pink, yellow, or white (usually in warm colors).",
                                    style: TextStyle(
                                    //fontSize: isMobile(context) ? 12 : 20,
                                    color: kTextColor.withOpacity(0.7),
                                    height: 1.5,
                                    ),
                                  ),*/

                              ],
                            ),
                        ),
                  ),
                  ),

                  ResponsiveGridCol(
                    xs: 6,
                    md: 3,
                    child: Container(
                      height: 100,
                      alignment: Alignment.center,
                      color: Colors.green,
                      child: Text("Colunm 2, Row 1", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                    ),
                  ),

                  ResponsiveGridCol(
                    xs: 6,
                    md: 3,
                    child: Container(
                      height: 100,
                      alignment: Alignment.center,
                      color: Colors.orange,
                      child: Text("Colunm 2, Row 2", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                    ),
                  ),

                  ResponsiveGridCol(
                    xs: 6,
                    md: 3,
                    child: Container(
                      height: 100,
                      alignment: Alignment.center,
                      color: Colors.red,
                      child: Text("Colunm 3, Row 1", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                    ),
                  ),

                  ResponsiveGridCol(
                    xs: 6,
                    md: 3,
                    child: Container(
                      height: 100,
                      alignment: Alignment.center,
                      color: Colors.blue,
                      child: Text("Colunm 3, Row 2", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                    ),
                  ),

                  ResponsiveGridCol(
                    lg: 12,
                    child: SafeArea(
                    /*child: Container( height: 400, alignment: Alignment.center, color: Colors.yellow,*/

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(alignment: Alignment.center,
                            child: Text("See more",
                          style: TextStyle(
                            fontSize: isMobile(context) ? 18 : 30,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                        SizedBox(height: 10),

                        FutureBuilder(
                          future: fetchCategories(),
                          builder: (context, snapshot) => snapshot.hasData
                              ? area_CategoriesMe(area_categories: snapshot.data)
                              : Text('Please wait'),//Center(child: Image.asset("assets/images/logo.png")),
                        ),

                      ],
                    ),

                    ),
                  ),

                ]
            ),

          ),
        ),
      ));


}


class area_CategoriesMe extends StatelessWidget {
  const area_CategoriesMe({
    Key key,
    this.area_categories,
  }) : super(key: key);

  final List<Category> area_categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(

          children: List.generate(
            area_categories.length, (x) => IceCreamCardMe(category_fieldx: area_categories[x],),
            //area_categories.length, (x) => CategoryCardFlat(category_field: area_categories[x],
          ),

        ),
      ),
    );

  }
}


class IceCreamCardMe extends StatelessWidget {
  const IceCreamCardMe({
    Key key,
    @required this.category_fieldx,
  }) : super(key: key);

  final Category category_fieldx;

  @override
  Widget build(BuildContext context) {

    return
      Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffeeeeee), width: 2.0),
                //color: Colors.white38,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white10,
                    blurRadius: 4,
                    spreadRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              margin: EdgeInsets.all(8),
              height: 280,
              width: 150,
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                  Expanded(
                  flex: 2,
                  child:
                    Container(
                      //alignment: Alignment.center,
                      padding: EdgeInsets.only(top: 0),
                      child:SafeArea(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[

                              Container(
                                height: 90.0,
                                child: Ink.image(
                                  image: NetworkImage(category_fieldx.Countryinfo.flag == null
                                      ? 'https://disease.sh/assets/img/flags/ad.png'
                                      : category_fieldx.Countryinfo.flag),
                                  fit: BoxFit.cover,
                                ),

                              ),

                            ]
                        ),
                      ),
                    ),
                  ),

                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(right: 10, top: 10, left: 10, bottom: 10),
                      child:SafeArea(
                        child: Column(
                            children: <Widget>[
                              Container(
                                  child: Text(category_fieldx.country+' '+category_fieldx.Countryinfo.flag+' '+category_fieldx.country+' '+category_fieldx.Countryinfo.flag,
                                    style: TextStyle(
                                      //fontWeight: FontWeight.bold,
                                        fontSize: 12.0,
                                        color: Colors.black87),
                                  ))

                            ]
                        ),
                      ),
                    ),

                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(right: 10, left: 10, bottom: 5),
                      child:SafeArea(
                        child: Column(
                            children: <Widget>[
                              Container(
                                  child: Text(category_fieldx.act.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.0,
                                        color: Colors.redAccent),
                                  ))

                            ]
                        ),
                      ),
                    ),

                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child:SafeArea(
                        child: Column(
                            children: <Widget>[
                              Container(
                                  child:
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size.fromHeight(20),
                                      primary: Colors.redAccent,

                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),

                                    child:
                                    Wrap(
                                      children: <Widget>[
                                        Icon(
                                          Icons.send,
                                          color: Colors.white,
                                          size: 14.0,
                                        ),
                                        SizedBox(
                                          width:10,
                                        ),
                                        Text("Lihat", style:TextStyle(fontSize:12, fontWeight: FontWeight.bold)),
                                      ],
                                    ),

                                    //onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DesignJson()));},
                                    onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Group_card()));},

                                  )

                              )

                            ]
                        ),
                      ),
                    ),

                  ],
                ),



              ),
            ),

            Positioned(
              left: 20,//Constants.padding,
              right: 20,//Constants.padding,
              top: 80,
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    Image.network(category_fieldx.Countryinfo.flag,
                        height: 35,
                        fit:BoxFit.fill
                    ),

                  ],
                ),
              ),


            ),


          ]);




  }
}
