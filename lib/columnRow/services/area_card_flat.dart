import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'destination_area_model.dart';

class CategoryCardFlat extends StatelessWidget {
  const CategoryCardFlat({
    Key key,
    @required this.category_field,
  }) : super(key: key);

  final Category category_field;


  @override
  Widget build(BuildContext context) {


    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffeeeeee), width: 2.0),
        color: Colors.white38,
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
      height: 200,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.network(
                category_field.Countryinfo.flag == null
                    ? 'https://disease.sh/assets/img/flags/ad.png'
                    : category_field.Countryinfo.flag,
              )),
          SizedBox(
            height: 10.0,
          ),
          Text(category_field.country,
            style: TextStyle(
              //fontWeight: FontWeight.bold,
                fontSize: 12.0,
                color: Colors.redAccent),
          ),
        ],
      ),
    );


/*
      Container(
      height: 200,
      padding: EdgeInsets.only(right: 10),
      child: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[


              Container(
                child: SafeArea(
                  child: Image.network(
                    category_field.Countryinfo.flag == null
                        ? 'https://disease.sh/assets/img/flags/ad.png'
                        : category_field.Countryinfo.flag,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                child: SafeArea(
                  child: Text(
                    "${category_field.country}", //"${category.act}+ Products",
                    style: TextStyle(
                      //fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black12.withOpacity(0.6),
                    ),
                  ),
                ),
              ),



            ]),
      ),
    );
*/


  }
}
