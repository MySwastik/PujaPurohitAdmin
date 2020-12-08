import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:management/Authentication/auth.dart';
import 'package:management/Navigations/D7.dart';
import 'package:management/Navigations/d1.dart';
import 'package:management/Navigations/d2.dart';
import 'package:management/Navigations/d3.dart';
import 'package:management/Navigations/d4.dart';
import 'package:management/Navigations/d5.dart';
import 'package:management/Navigations/d6.dart';
import 'package:management/constants/responsiveLayout.dart';
import 'package:provider/provider.dart';

class SideNavigator extends StatefulWidget {
  final String admin;

  const SideNavigator({Key key, this.admin}) : super(key: key);

  @override
  _SideNavigatorState createState() => _SideNavigatorState();
}

class _SideNavigatorState extends State<SideNavigator> {
  bool admin=false;
  Future<bool> checkExist(String docID) async {
    bool exists = false;
    try {
      await FirebaseFirestore.instance.doc("Admin/$docID").get().then((doc) {
        if (doc.exists){
          setState(() {
            admin=true;
          });

          exists = true;
        }

        else{
          admin=false;
          exists = false;}
      });
      return exists;
    } catch (e) {
      return false;
    }
  }
  @override
  void initState() {
    final user = Provider.of<Users>(context,listen: false);
    checkExist(user.uid);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    void submit() async{
      final auth = Provider.of<AuthBase>(context, listen: false);
      try{

        await auth.signOut().whenComplete(() async {
          Navigator.pushNamed(context, '/home').whenComplete(() {

          });
        });
      }catch(e){
        BotToast.showText(text: e);
        print(e);
      }
    }
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFFF8FBFF),
            Color(0xFFFCFDFD),
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: admin?Stack(
          children: <Widget>[dashboard(admin:widget.admin)],
        ):Padding(
          padding: EdgeInsets.only(left:250,top:150.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("This website only for admin purpose"),
              SizedBox(height: 20,),
              OutlineButton.icon(
                label: Text("Log Out"),
                onPressed: submit,icon: FaIcon(FontAwesomeIcons.user,color: Colors.tealAccent,),)
            ],
          ),
        ),
      ),
    );
  }
}

class dashboard extends StatelessWidget{
  final String admin;

  const dashboard({Key key, this.admin}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   return ResponsiveLayout(
      largeScreen: DashboardLarge(),
      smallScreen:DashboardSmall() ,
   );
  }
}

class DashboardLarge extends StatefulWidget{
  final String admin;

  const DashboardLarge({Key key, this.admin}) : super(key: key);

  @override
  _DashboardLargeState createState() => _DashboardLargeState();
}

class _DashboardLargeState extends State<DashboardLarge> {
  final String admin;
  var _selectedOption = 0;


  _DashboardLargeState({this.admin});
  List allOptions = [D6(),D1(),D2(),D3(),D4(),D5(),D7()];

  List isSelected = [true,false, false,false,false,false,false];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            padding: EdgeInsets.all(15),
            color: Colors.black87,
            height: height,
            width: width*0.11,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          gradient: LinearGradient(colors: [
                            Color(0xFFC86DD7),
                            Color(0xFF3023AE),
                          ], begin: Alignment.bottomRight, end: Alignment.topLeft)),
                      child: Center(
                        child: Text("PP",
                            style: TextStyle(fontSize: 30, color: Colors.white)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                buildOption(FontAwesomeIcons.dashcube, "Dashboard", 0),
                buildOption(FontAwesomeIcons.salesforce, "Sales", 1),
                buildOption(FontAwesomeIcons.rupeeSign, "Revenue", 2),
                buildOption(FontAwesomeIcons.calendar, "Date", 3),
                buildOption(FontAwesomeIcons.om, "Rashifal", 4),
                buildOption(Icons.warning, "Complaint", 5),
                buildOption(FontAwesomeIcons.gifts, "Claim", 6),
              ],
            ),
          ),
        ),
        Positioned(
            left: width*0.11,
            child: Container(
                height: height,
                width: width*0.9,
                child: allOptions[_selectedOption]
            )
        ),
      ],
    );
  }
  buildOption(IconData iconData,String txt, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isSelected[index]
            ? Container(
            height: 8.0,
            width: 8.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Color(0xFF23163D)))
            : Container(
            height: 8.0,
            width: 8.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.transparent)),
        SizedBox(height: 5.0),
        GestureDetector(onTap: () {
          setState(() {
            _selectedOption = index;
            isOptionSelected(index);
          });

        },
          child:Row(
              children: [
                FaIcon(iconData,color: isSelected[index]?Colors.white:Colors.grey,),
                SizedBox(width: 10,),
                Expanded(
                    flex: 2,
                    child: Text("$txt",style: GoogleFonts.roboto(color: isSelected[index]?Colors.white:Colors.grey,fontWeight: FontWeight.bold,fontSize: isSelected[index]?18:16),))
              ],
            ),
        )
      ],
    );
  }

  isOptionSelected(index) {
    var previousIndex = isSelected.indexOf(true);
    isSelected[index] = true;
    isSelected[previousIndex] = false;
  }
}
class DashboardSmall extends StatefulWidget{
  @override
  _DashboardSmallState createState() => _DashboardSmallState();
}

class _DashboardSmallState extends State<DashboardSmall> {

  var _selectedOption = 0;
  List allOptions = [D6(),D1(),D2(),D3(),D4(),D5(),D7()];

  List isSelected = [true,false, false,false,false,false,false];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            padding: EdgeInsets.all(15),
            color: Colors.black87,
           height: height,
            width: width*0.15,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            gradient: LinearGradient(colors: [
                              Color(0xFFC86DD7),
                              Color(0xFF3023AE),
                            ], begin: Alignment.bottomRight, end: Alignment.topLeft)),
                        child: Center(
                          child: Text("PP",
                              style: TextStyle(fontSize: 14, color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  buildOption(FontAwesomeIcons.dashcube, 0),
                  buildOption(FontAwesomeIcons.salesforce, 1),
                  buildOption(FontAwesomeIcons.rupeeSign, 2),
                  buildOption(FontAwesomeIcons.calendar, 3),
                  buildOption(FontAwesomeIcons.om, 4),
                  buildOption(Icons.warning, 5),
                  buildOption(FontAwesomeIcons.gifts, 6)
                ],
              ),
            ),

          ),
        ),
        Positioned(
            left: width*0.15,
            child: Container(
                height:height,
                width: width*0.9,
                child: allOptions[_selectedOption]
            )
        )
      ],
    ) ;
  }

  buildOption(IconData iconData, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isSelected[index]
            ? Container(
            height: 8.0,
            width: 8.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Color(0xFF23163D)))
            : Container(
            height: 8.0,
            width: 8.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.transparent)),
        SizedBox(height: 5.0),
        GestureDetector(onTap: () {
          setState(() {
            _selectedOption = index;
            isOptionSelected(index);
          });

        },
            child:FaIcon(
              iconData,
              color: isSelected[index]?Colors.white:Colors.grey,

            )
        )
      ],
    );
  }

  isOptionSelected(index) {
    var previousIndex = isSelected.indexOf(true);
    isSelected[index] = true;
    isSelected[previousIndex] = false;
  }
}