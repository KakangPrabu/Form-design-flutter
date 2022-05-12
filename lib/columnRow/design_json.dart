
import 'package:flutter/material.dart';
import 'package:formdesign/columnRow/services/area_categories.dart';
import 'package:formdesign/columnRow/services/area_services.dart';


class DesignJson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Responsive Layout"),centerTitle: true,),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>
                [
                  Padding(
                    padding: EdgeInsets.all(20), //20
                    child: Text("Categories",),
                  ),

                  FutureBuilder(
                    future: fetchCategories(),
                    builder: (context, snapshot)
                      {
                        return snapshot.hasData
                            ? area_Categories(area_categories: snapshot.data)
                            : Center(child: Text("assets/loader.gif"))
                            ;
                      }
                  ),
                ]
            ),
          ),
        )
    );
  }
}

/*
class DesignJson extends StatefulWidget {
  @override

  _DesignFlatState createState() => _DesignFlatState();
}


class _DesignFlatState extends State<DesignJson> {

  @override
  Widget build(BuildContext context) =>

  Scaffold(
    appBar: AppBar(title: Text("Responsive Layout"),centerTitle: true,),
    body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>
        [
          Padding(
            padding: EdgeInsets.all(20), //20
            child: Text("Categories",),
          ),
          FutureBuilder(
            future: fetchCategories(),
            builder: (context, snapshot) => snapshot.hasData
                ? area_Categories(categories: snapshot.data)

                : Center(child: Text("assets/loader.gif")),
          ),
        ]
      ),
    ),
  )
  );

}

*/