import 'package:flutter/material.dart';
import 'package:formdesign/buildClass/constant.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'package:ant_icons/ant_icons.dart';

class ToggleButtons1 extends StatelessWidget {
  final List<String> sex;
  final ValueChanged<String> onSelectedSex;

  const ToggleButtons1({
    Key key,
    @required this.sex,
    @required this.onSelectedSex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final background = Colors.redAccent; //Theme.of(context).unselectedWidgetColor;

    return Container(
      alignment: Alignment.centerLeft,
      child: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: background,
        ),

        child: ToggleSwitch(
          minWidth: 90.0,
          minHeight: 45.0,
          //initialLabelIndex: 1, //set value
          initialLabelIndex: setVal,
          cornerRadius: 5,
          activeFgColor: Colors.white,
          inactiveBgColor: Colors.white,
          inactiveFgColor: Colors.green,
          totalSwitches: 2,
          labels: ['Male', 'Female'],
          icons: [Icons.person_outline, Icons.pregnant_woman],

          activeBgColors: [[Colors.redAccent], [Colors.redAccent]],
          //onToggle: (index) {print('switched to: $index');},
          onToggle: (index) {print('switched to: $index'); setVal = index;},  //get value

        ),

      ),
    );
  }

  Widget buildPet(String text) => Container(
    padding: EdgeInsets.symmetric(horizontal: 24),
    child: Text(text),
  );
}


/*
class ToggleButtons1 extends StatefulWidget {
  const ToggleButtons1({
    Key key,
    @required this.pets,
    @required this.onSelectedPet,
  }) : super(key: key);

  @override
  _ToggleButtons1State createState() => _ToggleButtons1State();
}

class _ToggleButtons1State extends State<ToggleButtons1> {


  List<bool> isSelected = [true,false];

  @override
  Widget build(BuildContext context) => Container(
    color: Colors.green.withOpacity(0.5),
    child: ToggleButtons(
      isSelected: isSelected,
      selectedColor: Colors.white,
      color: Colors.black,
      fillColor: Colors.lightBlue.shade900,
      renderBorder: false,
      //splashColor: Colors.red,
      highlightColor: Colors.orange,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text('Male', style: TextStyle(fontSize: 18)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text('Female', style: TextStyle(fontSize: 18)),
        ),

      ],
      onPressed: (int newIndex) {
        setState(() {
          for (int index = 0; index < isSelected.length; index++) {
            if (index == newIndex) {
              isSelected[index] = true;
            } else {
              isSelected[index] = false;
            }
          }
        });
      },
    ),
  );
}
*/