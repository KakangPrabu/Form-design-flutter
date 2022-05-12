import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BasicColumnAndRowSA extends StatefulWidget {
  @override

  _BasicColumnAndRowSAState createState() => _BasicColumnAndRowSAState();
}


class _BasicColumnAndRowSAState extends State<BasicColumnAndRowSA> {

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>


        Scaffold(
        body: SafeArea(
          //child: Column(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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


  /*Scaffold(
    body:
    Column(
      children: <Widget>[

        Expanded(
          flex: 4,
          child: Container(
            color: Colors.redAccent,
            alignment: Alignment.center,
            child:

            Text("#1"),
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
    ),

  );*/



}