import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:formdesign/buildClass/constant.dart';

class combo_selectDrop extends StatefulWidget {

  @override
  combo_selectFieldState createState() => combo_selectFieldState();
}

class combo_selectFieldState extends State<combo_selectDrop> {
  String        name;
  String        itemHolder;

  Future<List<Map<String, dynamic>>> fetch() async {
    http.Response response = await http.get('https://jsonplaceholder.typicode.com/users');
    if (response.statusCode != 200) return null;

    return List<Map<String, dynamic>>.from(json.decode(response.body));//['users']);
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        body: SafeArea(
          child:

          ListView(
            //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.all(16),
            children: [

              const SizedBox(height: 32),
              buildDropdownSearch(),

            ],
          ),
        ),
      );

  void _showToast(BuildContext context, String getData) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Added to favourite'),
        action: SnackBarAction(
          label: getData,
          onPressed:scaffold.hideCurrentSnackBar,
        ),
      ),
    );
  }

  getItemAndNavigate(String item, BuildContext context){
    getValue = item;
    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserPage(itemHolder : item,)));
    Navigator.pop(context,true);
  }


  Widget buildDropdownSearch() =>
      buildTitle(
        title: 'User',
        child:
        DropdownFormField<Map<String, dynamic>>(

          onEmptyActionPressed: () async {},
          decoration: InputDecoration(border: OutlineInputBorder(), suffixIcon: Icon(Icons.arrow_drop_down)),
          onSaved:    (dynamic str) {},
          onChanged:  (dynamic str) {},
          //onChanged:  (dynamic str) => setState(() => countryValue = str['name']),
          validator:  (dynamic str) {},

          displayItemFn: (dynamic item) => Text(
            (item ?? {})['name'] ?? '',
            style: TextStyle(fontSize: 16),
          ),

          findFn: (dynamic str) async => fetch(),
          selectedFn: (dynamic item1, dynamic item2) {
            if (item1 != null && item2 != null) {
              return item1['name'] == item2['name'];
            }
            return false;
          },

          filterFn: (dynamic item, str) =>
          item['name'].toLowerCase().indexOf(str.toLowerCase()) >= 0,
          dropdownItemFn: (dynamic item, int position, bool focused,
              bool selected, Function() onTap) =>
              ListTile(
                title: Text(item['name']),
                subtitle: Text(item['email'] ?? '',),
                tileColor: focused ? Color.fromARGB(20, 0, 0, 0) : Colors.transparent,
                onTap: onTap,
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
