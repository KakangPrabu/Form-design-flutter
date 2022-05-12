import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import 'destination_area_model.dart';

class CategoryCard extends StatelessWidget {
  final String    categoryName    = '';
  const           CategoryCard({Key key,

  @required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      //onTap: () =>{getListViewItems(category.title)},
      onTap: () =>{},
      child:Padding(
        padding: EdgeInsets.all(10), //20
        child: SizedBox(
          width: 170, //200
          child: AspectRatio(
            aspectRatio: 0.83,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                // This is custom Shape thats why we need to use ClipPath
                ClipPath(
                  clipper: CategoryCustomShape(),
                  child: AspectRatio(
                    aspectRatio: 1.025,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      color: Colors.white70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[

                          Text(
                            category.country,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16, //16
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 2),

                          Text(
                            "${category.act} Products", //"${category.act}+ Products",
                            style: TextStyle(
                              //fontSize: 5,
                              color: Colors.black12.withOpacity(0.6),
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: AspectRatio(
                    aspectRatio: 1.15,

                    /*child: Lottie.network('https://assets4.lottiefiles.com/packages/lf20_kk62um5v.json',
                    repeat: false,
                    reverse: false,
                    animate: false,

                  ),*/

                    child: FadeInImage.assetNetwork(
                      //placeholder: "assets/spinner.gif",
                      fadeInDuration: Duration(seconds: 1),
                      fadeInCurve: Curves.bounceIn,
                      placeholder: "assets/loader.gif",
                      //image: category.image,
                      //image: 'https://cdn.britannica.com/30/94430-050-D0FC51CD/Niagara-Falls.jpg',
                      image: category.flag == null?'https://disease.sh/assets/img/flags/ad.png':category.flag,
                    ),


                  ),
                ),


              ],
            ),
          ),
        ),
      ),);
  }


}

class CategoryCustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double height = size.height;
    double width = size.width;
    double cornerSize = 30;

    path.lineTo(0, height - cornerSize);
    path.quadraticBezierTo(0, height, cornerSize, height);
    path.lineTo(width - cornerSize, height);
    path.quadraticBezierTo(width, height, width, height - cornerSize);
    path.lineTo(width, cornerSize);
    path.quadraticBezierTo(width, 0, width - cornerSize, 0);
    path.lineTo(cornerSize, cornerSize * 0.75);
    path.quadraticBezierTo(0, cornerSize, 0, cornerSize * 2);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}