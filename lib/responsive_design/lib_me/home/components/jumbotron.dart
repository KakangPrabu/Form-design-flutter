import 'package:flutter/material.dart';
import 'package:formdesign/responsive_design/lib_me/components/main_button.dart';
import 'package:formdesign/responsive_design/lib_me/constants.dart';
import 'package:formdesign/responsive_design/lib_me/responsive.dart';
import 'package:formdesign/widget/botton_widget.dart';




class Jumbotron extends StatelessWidget {
  const Jumbotron({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: !isMobile(context) ? 40:0),
                  child: Column(
                    mainAxisAlignment: !isMobile(context) ? MainAxisAlignment.start:MainAxisAlignment.center,
                    crossAxisAlignment: !isMobile(context) ? CrossAxisAlignment.start:CrossAxisAlignment.center,
                    children: <Widget>[
                      if (isMobile(context))
                        Image.asset(
                          'assets/images/main.png',
                          height: size.height * 0.3,
                        ),

                      RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Buy ',
                                    style: TextStyle(
                                        fontSize: isDesktop(context) ? 64 : 32,
                                        fontWeight: FontWeight.w800,
                                        color: kTextColor
                                    )
                                ),
                                TextSpan(
                                    text: 'Cruelty Free',
                                    style: TextStyle(
                                        fontSize: isDesktop(context) ? 64 : 32,
                                        fontWeight: FontWeight.w800,
                                        color: kPrimaryColor
                                    )
                                ),
                              ]
                          )
                      ),

                      Text(
                        'Makeup Products',
                        style: TextStyle(
                            fontSize: isDesktop(context) ? 64 : 32,
                            fontWeight: FontWeight.w800
                        ),
                      ),

                      Text(
                        'Online Today!',
                        style: TextStyle(
                            fontSize: isDesktop(context) ? 64 : 32,
                            fontWeight: FontWeight.w800
                        ),
                      ),

                      SizedBox(height: 10),

                      Text(
                        'Help us in making this world a better place for animals.',
                        textAlign: isMobile(context) ? TextAlign.center:TextAlign.start,
                        style: TextStyle(
                            fontSize: isDesktop(context) ? 36 : 18,
                            fontWeight: FontWeight.w300
                        ),
                      ),

                      SizedBox(height: 10),

                      Wrap(
                        runSpacing: 10,
                        children: <Widget>[
                          /*
                          MainButton(
                            title: 'GET STARTED',
                            color: kPrimaryColor,
                            tapEvent: () {},
                          ),

                           */

                          ButtonWidget(),

                          SizedBox(width: 10),

                          ButtonWidget()
                          /*
                          MainButton(
                            title: 'WATCH VIDEO',
                            color: kSecondaryColor,
                            tapEvent: () {},
                          )

                           */


                        ],
                      )
                    ],
                  ),
                )
            ),

            if (isDesktop(context) || isTab(context))
              Expanded(
                  child: Image.asset(
                    'assets/images/main.png',
                    height: size.height * 0.7,
                  )
              )


          ],
        )
    );
  }

  Widget buildButton() => ButtonWidget(
      text: 'Save',
      //Save to temp reference
      onClicked: () async {
        //await UserSimplePreferences.setUsername(name);
        //await UserSimplePreferences.setBirthday(birthday);
        //await UserSimplePreferences.setPets(pets);

        //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HotelHomeScreen()));

        //_showToast(context);
        //_addBadge();

        //popupCountry();
      }
    //Save to temp reference
  );

}

