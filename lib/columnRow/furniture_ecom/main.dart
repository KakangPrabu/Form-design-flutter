import 'package:flutter/material.dart';
import 'package:formdesign/columnRow/furniture_ecom/ui/screens/screens.dart';


void main() => runApp(shooping_cart());

class shooping_cart extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<shooping_cart> {
  int _currentIndex = 0;
  List<Widget> _pageList = [
    HomeScreen(),
    CatalogueScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'QuickSand',
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: _pageList[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (i) {
            setState(() {
              _currentIndex = i;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(Icons.list), title: Text("Catalogue")),
          ],
        ),
      ),
    );
  }
}