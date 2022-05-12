import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:formdesign/profile_screen.dart';
import 'package:formdesign/responsive_design/responsive_screen.dart';
import 'package:formdesign/widget/roles_api.dart';
import 'package:http/http.dart' as http;
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:formdesign/widget/botton_widget.dart';
import 'package:formdesign/widget/date_widget.dart';
import 'package:formdesign/widget/option_widget.dart';
import 'package:formdesign/widget/toggle_widget.dart';
import 'package:intl/intl.dart';
import 'package:smart_select/smart_select.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';

import 'ComboBox/ServicesController.dart';
import 'ComboBox/UserModel.dart';
import 'ComboBox/combo_select.dart';

import 'ComboBox/combo_select_dropdown.dart';
import 'buildClass/constant.dart';
import 'columnRow/basicOne.dart';
import 'columnRow/basicOne_dedsign.dart';
import 'columnRow/basicSafeArea.dart';
import 'columnRow/card_design.dart';
import 'columnRow/design_flat.dart';
import 'columnRow/design_flat_responsive.dart';
import 'columnRow/furniture_ecom/main.dart';
import 'customForm/expand_form.dart';
import 'model/user_model.dart';
import 'package:find_dropdown/find_dropdown.dart';

import 'package:dio/dio.dart';

class UserPage extends StatefulWidget {
  final String idUser, itemHolder;

  const UserPage({
    Key key,
    this.idUser,
    this.itemHolder}) : super(key: key);

  @override

  _UserPageState createState() => _UserPageState();

}

class Debouncer {
  final int     milliseconds;
  VoidCallback  action;
  Timer         _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class _UserPageState extends State<UserPage> {
  String        name,countryValue,selTogle,setTogle;
  DateTime      birthday;
  List<String>  pets = [];
  List<String>  sexs = ['Female']; //set value
  List<String>  jenis_kelamin = [];
  String        value = 'Muslim'; //set default

  String _appBadgeSupported = 'Unknown';
  ScrollController _scrollController;

  //list country
  final           _debouncer    = Debouncer(milliseconds: 500);
  List<UserListModel> users         = List();
  List<UserListModel> filteredUsers = List();

  //list country

  List<bool>    _selection= List.generate(2, (_) => false);

  //var nameKey = GlobalKey<FindDropdownState>();
  String dropdownValue = '';
  String holder='';

  //TextEditingController etUsername = new TextEditingController();
  final String nUsername = "";
  //final myController = new TextEditingController(text: "");
  final List<Map<String, dynamic>> _rolesLocal = [
    {
      "name": "Super Admin",
      "desc": "Having full access rights",
      "role": 1
    },
    {
      "name": "Admin",
      "desc": "Having full access rights of a Organization",
      "role": 2
    },
    {
      "name": "Manager",
      "desc": "Having Magenent access rights of a Organization",
      "role": 3
    },
    {
      "name": "Technician",
      "desc": "Having Technician Support access rights",
      "role": 4
    },
    {
      "name": "Customer Support",
      "desc": "Having Customer Support access rights",
      "role": 5
    },
    {"name": "User", "desc": "Having End User access rights", "role": 6},
  ];

  Future<List<Map<String, dynamic>>> fetch() async {
    http.Response response = await http.get('https://jsonplaceholder.typicode.com/users');
    if (response.statusCode != 200) return null;

    return List<Map<String, dynamic>>.from(json.decode(response.body));//['users']);
  }


  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }


  @override
  void initState() {
    super.initState();
    //name    = holder;
    //final jenis_kelamin="Female";
    //_selection == true;

    initPlatformState();

    _scrollController = ScrollController();

    ServicesController.getUsers().then((usersFromServer) {
      setState(() {
        users = usersFromServer;
        filteredUsers = users;
      });
    });

  }
  
  @override
  Widget build(BuildContext context) =>

  Scaffold(
    resizeToAvoidBottomInset: false,
    body: SafeArea(
          child: ListView(
              controller: _scrollController,
            //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.all(16),
            children: [
              Text('Shared\nPreferences'),

              Text(
                'Choose date',
                style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 16,
                    color: Colors.redAccent.withOpacity(0.9)),
              ),


              ////
              const SizedBox(height: 16),

              Row(
                  //mainAxisSize: MainAxisSize.max,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Padding(padding: EdgeInsets.all(3),
                      child: Container(height: 48, width: 125, color: Colors.transparent,
                        child: buildNameCode(),
                      ),
                    ),

                    Padding(padding: EdgeInsets.all(3),
                      child: Container(height: 48, width: 200, color: Colors.transparent,
                        child: buildNameCode(),
                      ),
                    ),

                  ],),





              ////

              const SizedBox(height: 32),
              buildName(),

              const SizedBox(height: 12),
              buildName2(),

              const SizedBox(height: 12),
              buildDropdownSearch(),

              const SizedBox(height: 12),
              buildBirthday(),

              const SizedBox(height: 12),
              buildPets(),

              const SizedBox(height: 12),
              buildToggle(),
              //buildToggleCS(),

              const SizedBox(height: 12),
              buildDropdownSM(),

              const SizedBox(height: 32),
              Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 16, top: 8),
                  child:
                  buildButton(),
              ),



            ],

            ),
          ),

    ////footer
    bottomNavigationBar: AnimatedBuilder(
      animation: _scrollController,
      builder: (context, child) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 400),
          height: _scrollController.position.userScrollDirection == ScrollDirection.reverse ? 0: 70,
          child: child,
        );
      },

      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //IconButton(icon: Icon(Icons.menu), onPressed: () {},),
          //IconButton(icon: Icon(Icons.search), onPressed: () {},)

          Padding(
            padding: const EdgeInsets.only(
                left: 25, right: 5, bottom: 16, top: 8),
            child: Container(
              height: 48,
              width: 75,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    blurRadius: 8,
                    offset: const Offset(4, 4),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(2.0)),
                  highlightColor: Colors.transparent,
                  onTap: () {
                    //BasicColumnAndRow
                    //_showToast(context);
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DesignFlatResponsive()));
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>card_design()));
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>shooping_cart()));


                  },
                  child: Center(
                    child: Text('Draft',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Padding(
            //padding: const EdgeInsets.all(16),
            padding: const EdgeInsets.only(
                left: 90, right: 16, bottom: 16, top: 8),
            child: Container(
              height: 48,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    blurRadius: 8,
                    offset: const Offset(4, 4),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(2.0)),
                  highlightColor: Colors.transparent,
                  onTap: () {
                    //Navigator.pop(context);
                    _showToast(context);
                  },
                  child: Center(
                    child: Text('Save',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),

    ////


  );

  Widget buildName() => buildTitle(
    title: 'Name',
    child: TextFormField(

      initialValue: nUsername,
      //controller: myController,
      decoration: InputDecoration(
        border: OutlineInputBorder(), hintText: 'Your Name',
      ),
      onChanged: (name) => setState(() => this.name = name),
    ),
  );

  Widget buildNameCode() => buildTitle(
    title: 'Post Code',
    child: Container(height: 65,width: 48,
    child:TextFormField(
      initialValue: nUsername,
      //controller: myController,
      decoration: InputDecoration(
        border: OutlineInputBorder(), hintText: 'Your Name',
      ),
      onChanged: (name) => setState(() => this.name = name),
    ),
  ),
  );

  Widget buildName2() => buildTitle(
    title: 'User-dialog',
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

    /*
    TextFormField(
      readOnly: true,
      initialValue: getValue,
      decoration: InputDecoration(
        border: OutlineInputBorder(), hintText: 'select country',
        suffixIcon: IconButton(
          icon: Icon(Icons.search),
        ),
      ),

      onChanged: (name) => setState(() => this.name = name),

      onTap: () {
        //popupCountry();
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>combo_selectField()));
      },
    ),
    */
  );

  Widget buildBirthday() => buildTitle(
    title: 'Birthday',
    child: DateWidget(
      birthday: birthday,
      onChangedBirthday: (birthday) =>
          setState(() => this.birthday = birthday),
    ),
  );

  Widget buildPets() => buildTitle(
    title: 'Pets',
    child: optionButtonsWidget(
      pets: pets,
      onSelectedPet: (pet) => setState(
              () => pets.contains(pet) ? pets.remove(pet) : pets.add(pet)),
    ),
  );

  Widget buildToggle() => buildTitle(
    title: 'Sex',
    child: ToggleButtons1(
      sex: jenis_kelamin,
      //onSelectedPet: (sex) => setState(() => jenis_kelamin.contains(sex) ? jenis_kelamin.remove(sex) : jenis_kelamin.add(sex)),
      onSelectedSex: (sex) => setState(() => this.jenis_kelamin==sex),
    ),

  );


  //dropdown plus
  Widget buildDropdownSearch() =>
    buildTitle(
    title: 'Country',
    child:
    DropdownFormField<Map<String, dynamic>>(

      onEmptyActionPressed: () async {},
      decoration: InputDecoration(border: OutlineInputBorder(), suffixIcon: Icon(Icons.arrow_drop_down)),
      onSaved:    (dynamic str) {},
      //onChanged:  (dynamic str) {},
      onChanged:  (dynamic str) => setState(() => countryValue = str['name']),
      validator:  (dynamic str) {},

      displayItemFn: (dynamic item) => Text(
        (item ?? {})['name'] ?? '',
        style: TextStyle(fontSize: 16),
      ),

      findFn: (dynamic str) async => _rolesLocal,
      //findFn: (dynamic str) async => fetch(),
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
            subtitle: Text(item['desc'] ?? '',),
            tileColor: focused ? Color.fromARGB(20, 0, 0, 0) : Colors.transparent,
            onTap: onTap,
          ),
    ),

    /*TextFormField(
      readOnly: false,
      initialValue: name,
      decoration: InputDecoration(
        border: OutlineInputBorder(), hintText: 'choose country',
      ),

      onTap:() {setState(() {
          popupCountry();
        });
      },

      onChanged: (name) => setState(() => this.name = name),
    ),*/

  );

  Widget buildToggleCS() => buildTitle(

    title: 'Sex 2',
    /*child: optionButtonsSexWidget(
      sexs: sexs,
      onSelectedSex: (sex) => setState(
              () => sexs.contains(sex) ? sexs.remove(sex) : sexs.add(sex)),
    ),*/

    child:
    ToggleButtons(

      children: [
        Icon(Icons.person_outline),
        Icon(Icons.pregnant_woman),
        //Icon(Icons.add_location),
      ],
      isSelected: _selection,

      onPressed: (int index) {  //single select
        setState(() {
          for (int i = 0; i < _selection.length; i++) {
            //_selection[i] = i == index;
            i == index ? _selection[i] = true : _selection[i] = false;
          }

          if  (index==0)
          {
            print("VALUE : Laki'");
            selTogle = 'Laki-Laki';
          }
          else
          {
            print("VALUE : cewe");
            selTogle = 'Perempuan';
          }

        });

      },

      color: Colors.white,
      selectedColor: Colors.white,
      fillColor: Colors.redAccent,

    ),

  );



  S2ModalType modalType;
  List<S2Choice<String>> options = [
    S2Choice<String>(value: 'Muslim', title: 'Muslim'),
    S2Choice<String>(value: 'Kristen', title: 'Kristen'),
    S2Choice<String>(value: 'Budha', title: 'Budha'),
    S2Choice<String>(value: 'Hindu', title: 'Hindu'),
    S2Choice<String>(value: 'Protestan', title: 'Protestan'),
  ];

  Widget buildDropdownSM() => buildTitleSM(
    child: SmartSelect<String>.single(
        title: "Religion",
        value: value,
        modalType: S2ModalType.bottomSheet,
        choiceItems: options,
        onChange: (state) => setState(() => value = state.value)
    ),

  );

  Widget buildButton() => ButtonWidget(
      text: 'Save',
      //Save to temp reference
      onClicked: () async {
        //await UserSimplePreferences.setUsername(name);
        //await UserSimplePreferences.setBirthday(birthday);
        //await UserSimplePreferences.setPets(pets);

        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HotelHomeScreen()));

        //_showToast(context);
        _addBadge();

        //popupCountry();
      }
    //Save to temp reference
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

  Widget buildTitleSM({
    //@required String title,
    @required Widget child,
  }) =>

      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /*Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),*/
          child,
        ],
      );

  void _hideKeyboard()
  {
    final focus = FocusScope.of(context);
    if(!focus.hasPrimaryFocus) focus.unfocus();
  }


  //void popupCountry(){
    Future popupCountry()=> showDialog(
        context: context,
        //builder: (BuildContext context) {
        builder: (context) {
          return AlertDialog(

            content: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Positioned(
                  right: -40.0,
                  top: -40.0,
                  child: InkResponse(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      child: Icon(Icons.close, color: Colors.white,),
                      backgroundColor: Colors.redAccent,
                    ),
                  ),
                ),
                Form(
                  //key: _formKey,
                  child:
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[

                      Padding(
                        padding: EdgeInsets.all(8.0),
                        //child: TextFormField(),


                        child:
                            /*
                        FindDropdown(
                          items: ["Brasil", "Italia", "Estados", "Canada"],
                          label: "Select country",
                          onChanged: (String data) {
                            setState(() {
                              dropdownValue = data;
                            });
                          },//print,
                          selectedItem: "Brasil",
                          validate: (String item) {
                            if (item == null)
                              return "Required field";
                            else if (item == "Brasil")
                              return "Invalid item";
                            else
                              return null;
                          },
                        ),
*/

                        //multi line
                        FindDropdown<UserModel>(
                          label: "Personagem",
                          onFind: (String filter) async {
                            var response = await Dio().get(
                              "http://5d85ccfb1e61af001471bf60.mockapi.io/user",
                              queryParameters: {"filter": filter},
                            );
                            var models = UserModel.fromJsonList(response.data);
                            return models;
                          },
                          onChanged: (UserModel data) {
                            print(data);
                          },
                          dropdownBuilder: (BuildContext context, UserModel item) {
                            return Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Theme.of(context).dividerColor),
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              child: (item?.avatar == null)
                                  ? ListTile(
                                leading: CircleAvatar(),
                                title: Text("No item selected"),
                              )
                                  : ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(item.avatar),
                                ),
                                title: Text(item.name),
                                subtitle: Text(item.createdAt.toString()),
                              ),
                            );
                          },
                          dropdownItemBuilder:  (BuildContext context, UserModel item, bool isSelected) {
                            return Container(
                              decoration: !isSelected
                                  ? null
                                  : BoxDecoration(
                                border: Border.all(color: Theme.of(context).primaryColor),
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              child: ListTile(
                                selected: isSelected,
                                title: Text(item.name),
                                subtitle: Text(item.createdAt.toString()),
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(item.avatar),
                                ),
                              ),
                            );
                          },
                        ),

                        /*
                        //standard
                        FindDropdown<UserModel>(
                          key: nameKey,
                          label: "Nome",
                          onFind: (String filter) => getData(filter),
                          searchBoxDecoration: InputDecoration(hintText: "Search", border: OutlineInputBorder()),
                          onChanged: (UserModel data) => print(data),
                        ),
                        */


                      /*Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(),
                      ),*/

                      /*
                      DropdownFormField<Map<String, dynamic>>(
                        autoFocus: true,

                        onEmptyActionPressed: () async {},
                        decoration: InputDecoration(border: OutlineInputBorder(), suffixIcon: Icon(Icons.arrow_drop_down)),
                        onSaved:    (dynamic str) {},
                        //onChanged:  (dynamic str) {},
                        onChanged: (dynamic data) {
                          setState(() {
                            dropdownValue = data.toString();
                          });
                        },

                        validator:  (dynamic str) {},

                        displayItemFn: (dynamic item) => Text((item ?? {})['name'] ?? '', style: TextStyle(fontSize: 16),),

                        findFn: (dynamic str) async => _rolesLocal, selectedFn: (dynamic item1, dynamic item2) {
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
                              subtitle: Text(item['desc'] ?? '',),
                              tileColor: focused ? Color.fromARGB(20, 0, 0, 0) : Colors.transparent,
                              onTap: onTap,
                            ),
                      ),
                        */
                      ),


                      Padding(
                          padding: EdgeInsets.only(top: 30, bottom: 30),
                          child :
                          //Printing Item on Text Widget
                          Text('Selected Item = ' + '$holder',
                              style: TextStyle
                                (fontSize: 12,
                                  color: Colors.black))),


                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          child: Text("Select"),
                          onPressed: getDropDownItem,
                           /*   () {
                              setState(() {

                                //Navigator.pop(context);//close dialog
                              });
                              //Navigator.pop(context);//close dialog
                              },*/

                          /*onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                            }
                          },*/
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),


          );
        });



  Future<List<UserModel>> getData(filter) async {
    var response =  await Dio().get(
      "http://5d85ccfb1e61af001471bf60.mockapi.io/user",
      queryParameters: {"filter": filter},
    );

    var models = UserModel.fromJsonList(response.data);
    return models;
  }


  void getDropDownItem(){
    setState(() {
      holder = dropdownValue ;
    });
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text('$name'+
            '-'
            +'$countryValue'.toString()
            +
            '-'
            +
            (birthday==null ? 'kosong': DateFormat('dd MMMM yyyy').format(birthday).toString())
            +'-'+
            selTogle.toString()
            +'-'+setVal.toString()
            +'-'+value.toString()),

        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  getItemAndNavigate(String item, BuildContext context){
    getValue = item;
    Navigator.pop(context);//close dialog
  }


  initPlatformState() async {
    String appBadgeSupported;
    try {
      bool res = await FlutterAppBadger.isAppBadgeSupported();
      if (res) {
        appBadgeSupported = 'Supported';
      } else {
        appBadgeSupported = 'Not supported';
      }
    } on PlatformException {
      appBadgeSupported = 'Failed to get badge support.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
    setState(() {
      _appBadgeSupported = appBadgeSupported;
    });
  }

  void _addBadge() {
    return FlutterAppBadger.updateBadgeCount(1);
  }

}

