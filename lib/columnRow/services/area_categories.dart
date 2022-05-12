import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'area_card.dart';
import 'area_card_flat.dart';
import 'destination_area_model.dart';

//import 'category_card.dart';

class area_Categories extends StatelessWidget {
  const area_Categories({
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
          area_categories.length, (x) => IceCreamCard(category_field: area_categories[x],),
        //area_categories.length, (x) => CategoryCardFlat(category_field: area_categories[x],
          ),

          /*
          children: [
            IceCreamCard(flavorColor: Colors.redAccent, flavor: 'Strawberry'),
          ],
          */

        ),
      ),
    );

    /*var cardImage = NetworkImage('https://foyr.com/learn/wp-content/uploads/2021/08/design-your-dream-home.jpg');
    return
      Container(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [

                  Card(
                  elevation: 4.0,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text('heading'),
                        subtitle: Text('subheading'),
                        trailing: Icon(Icons.favorite_outline),
                      ),
                      Container(
                        height: 200.0,
                        child: Ink.image(
                          image: cardImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16.0),
                        alignment: Alignment.centerLeft,
                        child: Text('supportingText'),
                      ),
                      ButtonBar(
                        children: [
                          TextButton(
                            child: const Text('CONTACT AGENT'),
                            onPressed: () {/* ... */},
                          ),
                          TextButton(
                            child: const Text('LEARN MORE'),
                            onPressed: () {/* ... */},
                          )
                        ],
                      )
                    ],
                  )),

                ],
              )),
        );

     */

    /*
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          //area_categories.length, (x) => CategoryCard(category: area_categories[x],
          area_categories.length, (x) => CategoryCardFlat(category_field: area_categories[x],

          ),
        ),
      ),
    );
     */
  }
}

class IceCreamCard extends StatelessWidget {
  const IceCreamCard({
    Key key,
    @required this.category_field,
  }) : super(key: key);

  final Category category_field;



  @override
  Widget build(BuildContext context) {

    return Container(
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
      height: 190,
      width: 150,
    child: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
              padding: EdgeInsets.all(5),
              alignment: Alignment.centerLeft,
              color: Colors.transparent,
              child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Expanded(
                      flex: 2,
                      child:Container(
                          color: Colors.transparent,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(right: 1),

                          child: Text(category_field.country,
                            style: TextStyle(
                              //fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Colors.black87),
                          )


                      ),
                    ),




                  ]
              )),


          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(right: 1),
              child:SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 90.0,
                      child: Ink.image(
                        image: NetworkImage(category_field.Countryinfo.flag == null
                            ? 'https://disease.sh/assets/img/flags/ad.png'
                            : category_field.Countryinfo.flag),
                        fit: BoxFit.cover,
                      ),
                    ),

                  ]
              ),
              ),
            ),
          ),


          Container(
          padding: EdgeInsets.all(5),
          alignment: Alignment.centerLeft,
          color: Colors.transparent,
          child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: <Widget>[

            Expanded(
              flex: 2,
              child:Container(
                color: Colors.transparent,
                alignment: Alignment.center,
                padding: EdgeInsets.only(right: 1),

                child: Text(category_field.country,
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                      color: Colors.black87),
                )


              ),
            ),

            Expanded(
              flex: 1,
              child:Container(
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(right: 1),

                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[400],
                          blurRadius: 5.0,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),


              ),
            ),


          ]
          )),


          /*Container(padding: EdgeInsets.all(20),
          child:Text(category_field.country,
            style: TextStyle(
              //fontWeight: FontWeight.bold,
                fontSize: 12.0,
                color: Colors.black87),
          )),*/




          /*
          Center(
            child: Text('Step 1 : Setup Basic App Container', style: Theme.of(context).textTheme.subtitle2),
          ),
          SizedBox(
            height: 10.0,
          ),


          Center(
              child: Image.network(
                category_field.Countryinfo.flag == null
                    ? 'https://disease.sh/assets/img/flags/ad.png'
                    : category_field.Countryinfo.flag,
              )),
          SizedBox(
            height: 10.0,
          ),
        */


          //text

        ],
      ),),
    );
  }
}
