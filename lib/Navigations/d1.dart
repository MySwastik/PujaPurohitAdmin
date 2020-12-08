import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:management/Authentication/auth.dart';
import 'package:management/Navigations/graph1.dart';
import 'package:management/Navigations/graph2.dart';
import 'package:management/constants/responsiveLayout.dart';
import 'package:provider/provider.dart';
dynamic request;
dynamic cancel;
dynamic bookings;
dynamic selected;
var dt = DateTime.now();
class D1 extends StatefulWidget {
  final String admin;
  D1({Key key, this.admin}) : super(key: key);
  @override
  _D1State createState() => _D1State();
}

class _D1State extends State<D1>{
  bool load=false;
  bool admin=false;
  call()async{
    await await FirebaseFirestore.instance.collection("Booking_analysis/${dt.year}/months/${dt.month}/days").doc("${dt.day}").get().then((value){
      setState(() {
        bookings=value.data()['booking'];
        request=value.data()['request'];
        cancel=value.data()['cancel'];
        selected="Today";
      });
    });
  }
  void initState() {
    call();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    showPopupMenu() async {
      return showMenu(
        context: context,
        position: RelativeRect.fromLTRB(800, 100, 100, 100),
        items: [
          PopupMenuItem<String>(
              child:  InkWell(
                  onTap: ()async{
                    await FirebaseFirestore.instance.collection("Booking_analysis/${dt.year}/months/${dt.month}/days").doc("${dt.day}").get().then((value) {
                      setState(() {
                        bookings=value.data()['booking'];
                        request=value.data()['request'];
                        cancel=value.data()['cancel'];
                        selected="Today";
                      });
                    });
                  },
                  child: Text('Today')), value: 'log'),
          PopupMenuItem<String>(
              child:  InkWell(
                  onTap: ()async{
                    await FirebaseFirestore.instance.collection("Booking_analysis/${dt.year}/months").doc("${dt.month}").get().then((value) {
                      setState(() {
                        bookings=value.data()['booking'];
                        request=value.data()['request'];
                        cancel=value.data()['cancel'];
                        selected="Last 28 Days";
                      });
                    });
                  },
                  child: Text('Last 28 Days')), value: 'log'),
          PopupMenuItem<String>(
              child:  InkWell(
                  onTap: ()async{
                    await FirebaseFirestore.instance.collection("Booking_analysis/${dt.year}/months").doc("${1}").get().then((value) {
                      setState(() {
                        bookings=value.data()['booking'];
                        request=value.data()['request'];
                        cancel=value.data()['cancel'];
                        selected="Jan";
                      });
                    });
                  },
                  child: Text('Jan')), value: 'log'),
          PopupMenuItem<String>(
              child:  InkWell(
                  onTap: ()async{
                    await FirebaseFirestore.instance.collection("Booking_analysis/${dt.year}/months").doc("${2}").get().then((value) {
                      setState(() {
                        bookings=value.data()['booking'];
                        request=value.data()['request'];
                        cancel=value.data()['cancel'];
                        selected="Feb";
                      });
                    });
                  },
                  child: Text('Feb')), value: 'log'),
          PopupMenuItem<String>(
              child:  InkWell(
                  onTap: ()async{
                    await FirebaseFirestore.instance.collection("Booking_analysis/${dt.year}/months").doc("${3}").get().then((value) {
                      setState(() {
                        bookings=value.data()['booking'];
                        request=value.data()['request'];
                        cancel=value.data()['cancel'];
                        selected="March";
                      });
                    });
                  },
                  child: Text('March')), value: 'log'),
          PopupMenuItem<String>(
              child:  InkWell(
                  onTap: ()async{
                    await FirebaseFirestore.instance.collection("Booking_analysis/${dt.year}/months").doc("${4}").get().then((value) {
                      setState(() {
                        bookings=value.data()['booking'];
                        request=value.data()['request'];
                        cancel=value.data()['cancel'];
                        selected="April";
                      });
                    });
                  },
                  child: Text('April')), value: 'log'),
          PopupMenuItem<String>(
              child:  InkWell(
                  onTap: ()async{
                    await FirebaseFirestore.instance.collection("Booking_analysis/${dt.year}/months").doc("${5}").get().then((value) {
                      setState(() {
                        bookings=value.data()['booking'];
                        request=value.data()['request'];
                        cancel=value.data()['cancel'];
                        selected="May";
                      });
                    });
                  },
                  child: Text('May')), value: 'log'),
          PopupMenuItem<String>(
              child:  InkWell(
                  onTap: ()async{
                    await FirebaseFirestore.instance.collection("Booking_analysis/${dt.year}/months").doc("${6}").get().then((value) {
                      setState(() {
                        bookings=value.data()['booking'];
                        request=value.data()['request'];
                        cancel=value.data()['cancel'];
                        selected="Jun";
                      });
                    });
                  },
                  child: Text('Jun')), value: 'log'),
          PopupMenuItem<String>(
              child:  InkWell(
                  onTap: ()async{
                    await FirebaseFirestore.instance.collection("Booking_analysis/${dt.year}/months").doc("${7}").get().then((value) {
                      setState(() {
                        bookings=value.data()['booking'];
                        request=value.data()['request'];
                        cancel=value.data()['cancel'];
                        selected="Jul";
                      });
                    });
                  },
                  child: Text('Jul')), value: 'log'),
          PopupMenuItem<String>(
              child:  InkWell(
                  onTap: ()async{
                    await FirebaseFirestore.instance.collection("Booking_analysis/${dt.year}/months").doc("${8}").get().then((value) {
                      setState(() {
                        bookings=value.data()['booking'];
                        request=value.data()['request'];
                        cancel=value.data()['cancel'];
                        selected="Aug";
                      });
                    });
                  },
                  child: Text('Aug')), value: 'log'),
          PopupMenuItem<String>(
              child:  InkWell(
                  onTap: ()async{
                    await FirebaseFirestore.instance.collection("Booking_analysis/${dt.year}/months").doc("${9}").get().then((value) {
                      setState(() {
                        bookings=value.data()['booking'];
                        request=value.data()['request'];
                        cancel=value.data()['cancel'];
                        selected="Sept";
                      });
                    });
                  },
                  child: Text('Sept')), value: 'log'),
          PopupMenuItem<String>(
              child:  InkWell(
                  onTap: ()async{
                    await FirebaseFirestore.instance.collection("Booking_analysis/${dt.year}/months").doc("${10}").get().then((value) {
                      setState(() {
                        bookings=value.data()['booking'];
                        request=value.data()['request'];
                        cancel=value.data()['cancel'];
                        selected="Oct";
                      });
                    });
                  },
                  child: Text('Oct')), value: 'log'),
          PopupMenuItem<String>(
              child:  InkWell(
                  onTap: ()async{
                    await FirebaseFirestore.instance.collection("Booking_analysis/${dt.year}/months").doc("${11}").get().then((value) {
                      setState(() {
                        bookings=value.data()['booking'];
                        request=value.data()['request'];
                        cancel=value.data()['cancel'];
                        selected="Nov";
                      });
                    });
                  },
                  child: Text('Nov')), value: 'log'),
          PopupMenuItem<String>(
              child:  InkWell(
                  onTap: ()async{
                    await FirebaseFirestore.instance.collection("Booking_analysis/${dt.year}/months").doc("${12}").get().then((value) {
                      setState(() {
                        bookings=value.data()['booking'];
                        request=value.data()['request'];
                        cancel=value.data()['cancel'];
                        selected="Dec";
                      });
                    });
                  },
                  child: Text('Dec')), value: 'log'),
          PopupMenuItem<String>(
              child:  InkWell(
                  onTap: (){},
                  child: Text('Last 365 days')), value: 'log'),
          PopupMenuItem<String>(
              child:  InkWell(
                  onTap: (){},
                  child: Text('LifeTime')), value: 'log'),
        ],
        elevation: 8.0,
      );
    }

    return load?Center(child: CircularProgressIndicator(),):Scaffold(
      appBar: AppBar(
        leadingWidth: ResponsiveLayout.isLargeScreen(context)?600:200,
        leading:  Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, offset: Offset(0, 8), blurRadius: 8)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 10),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(bottom: 8,left: 30),
                        hintText: 'Search'),
                  )),
              Spacer(),
              Expanded(
                  child: FaIcon(FontAwesomeIcons.search,color: Colors.orangeAccent,size: ResponsiveLayout.isLargeScreen(context)?20:15,)),
            ],
          ),
        ),
        actions: [
          Padding(
            padding:  EdgeInsets.only(right:35.0),
            child: Row(
              children: [
                Icon(Icons.notifications_none_outlined,color: Colors.white,),
                SizedBox(width: 10,),
                InkWell(
                  onTap: _showPopupMenu,
                  child: CircleAvatar(
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow:[
                            BoxShadow(
                                color: Colors.black12, offset: Offset(0, 8), blurRadius: 8)
                          ] ,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/image.jpg"
                              )
                          )
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),],
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xFFFF8008),Color(0xFFFFC837)])
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            D1Body(function:showPopupMenu,)
          ],
        ),
      ),
    );
  }
  void _showPopupMenu() async {
    void submit() async{
      final auth = Provider.of<AuthBase>(context, listen: false);
      try{
        setState(() {
          load=true;
        });
        await auth.signOut().whenComplete(() async {
          Navigator.pushNamed(context, '/home').whenComplete(() {
            setState(() {
              load=false;
            });
          });
        });
      }catch(e){
        BotToast.showText(text: e);
        print(e);
      }
    }
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(800, 100, 100, 100),
      items: [
        PopupMenuItem<String>(
            child:  FlatButton(
                onPressed: (){
                  submit();
                },
                child: Text('Log out')), value: 'log'),
      ],
      elevation: 8.0,
    );
  }
}
class D1Body extends StatelessWidget{
  final VoidCallback function;

  const D1Body({Key key, this.function}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: D1Large(function: function,),
      smallScreen:D1Small(function: function,) ,
    );
  }
}

class D1Large extends StatelessWidget{
  final VoidCallback function;
  D1Large({Key key, this.function}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top:35,left: 20),
          child: Row(
            children: [
              Text("Sales Analytics",style: GoogleFonts.roboto(color: Colors.purple,fontSize: 24,shadows: [Shadow(
                color: Colors.black87
              )]),),
             Spacer(),
             InkWell(
               onTap:function,
               child: Padding(
                 padding: const EdgeInsets.only(right: 100),
                 child: Text("${selected??"Today"}",style: GoogleFonts.roboto(color: Colors.purple,fontSize: 24,shadows: [Shadow(
                     color: Colors.black87
                 )]),),
               ),
             )
            ],
          ),
        ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(top:30,left: 30),
          child: Row(
            children: [
              Container(
                height: height*0.15,
                width: width*0.18,
                decoration: BoxDecoration(
                    boxShadow:[
                      BoxShadow(
                          color: Colors.black12, offset: Offset(0, 8), blurRadius: 8)
                    ] ,
                    borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                      colors: [Color(0xFF26D0CE),Colors.blueAccent]
                  )
                ),
                child: Center(
                  child: ListTile(
                    title: Text("${request??0}",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold),),
                    subtitle: Text("Total Req. Bookings",style: GoogleFonts.roboto(color: Colors.white),),
                    trailing: FaIcon(FontAwesomeIcons.shopify,color:Colors.white,size: 24,),
                  ),
                ),
              ),
              SizedBox(width: width*0.03,),
              Container(
                height: height*0.15,
                width: width*0.18,
                decoration: BoxDecoration(
                    boxShadow:[
                      BoxShadow(
                          color: Colors.black12, offset: Offset(0, 8), blurRadius: 8)
                    ] ,
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                        colors: [Color(0xFFFF512F),Color(0xFFDD2476)]
                    )
                ),
                child: Center(
                  child: ListTile(
                    title: Text("${bookings??0}",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold),),
                    subtitle: Text("Total Bookings",style: GoogleFonts.roboto(color: Colors.white),),
                    trailing: FaIcon(FontAwesomeIcons.shopify,color:Colors.white,size: 24),
                  ),
                ),
              ),
              SizedBox(width: width*0.03,),
              Container(
                height: height*0.15,
                width: width*0.18,
                decoration: BoxDecoration(
                    boxShadow:[
                      BoxShadow(
                          color: Colors.black12, offset: Offset(0, 8), blurRadius: 8)
                    ] ,
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                        colors: [Colors.orangeAccent,Colors.orange]
                    )
                ),
                child: Center(
                  child: ListTile(
                    title: Text("${cancel??0}",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold),),
                    subtitle: Text("Cancelled",style: GoogleFonts.roboto(color: Colors.white),),
                    trailing: FaIcon(Icons.close_outlined,color:Colors.white,),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(top:35,left: 20),
          child: Row(
            children: [
              Text("Booking Requests",style: GoogleFonts.roboto(color: Colors.purple,fontSize: 24,shadows: [Shadow(
                  color: Colors.black87
              )]),)
            ],
          ),
        ),
        SizedBox(height: 20,),
        Padding(
          padding: EdgeInsets.only(left:50),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                    height: height*0.35,
                    width: width*0.3,
                    child:LineChartSample4()),
                SizedBox(width: 150,),
                SizedBox(
                    height: height*0.35,
                    width: width*0.3,
                    child:LineChartSample1()),


              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:35,left: 20),
          child: Row(
            children: [
              Text("Confirmed Booking Analytics",style: GoogleFonts.roboto(color: Colors.purple,fontSize: 24,shadows: [Shadow(
                  color: Colors.black87
              )]),)
            ],
          ),
        ),
        SizedBox(height: 20,),
        Padding(
          padding: EdgeInsets.only(left:50),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                    height: height*0.35,
                    width: width*0.3,
                    child:LineChartSample4()),
                SizedBox(width: 150,),
                SizedBox(
                    height: height*0.35,
                    width: width*0.3,
                    child:LineChartSample1()),


              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:35,left: 20),
          child: Row(
            children: [
              Text("Cancel Analytics",style: GoogleFonts.roboto(color: Colors.purple,fontSize: 24,shadows: [Shadow(
                  color: Colors.black87
              )]),)
            ],
          ),
        ),
        SizedBox(height: 20,),
        Padding(
          padding: EdgeInsets.only(left:50),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                    height: height*0.35,
                    width: width*0.3,
                    child:LineChartSample4()),
                SizedBox(width: 150,),
                SizedBox(
                    height: height*0.35,
                    width: width*0.3,
                    child:LineChartSample1()),


              ],
            ),
          ),
        ),

      ],
    );
  }
}
class D1Small extends StatelessWidget{
  final VoidCallback function;

  const D1Small({Key key, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top:35,left: 20),
          child: Row(
            children: [
              Text("Sales Analytics",style: GoogleFonts.roboto(color: Colors.purple,fontSize: 19,shadows: [Shadow(
                  color: Colors.black87
              )]),),
              Spacer(),
              InkWell(
                onTap: function,
                child: Padding(
                  padding: const EdgeInsets.only(right: 100),
                  child: Text("${selected??"Today"}",style: GoogleFonts.roboto(color: Colors.purple,fontSize: 19,shadows: [Shadow(
                      color: Colors.black87
                  )]),),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20,),
        Padding(
         padding: EdgeInsets.only(top:30,left:10,right: 10),
         child:  SingleChildScrollView(
           scrollDirection: Axis.horizontal,
           child: Row(
             children: [
               Container(
                 height: height*0.12,
                 width: width*0.24,
                 decoration: BoxDecoration(
                     boxShadow:[
                       BoxShadow(
                           color: Colors.black12, offset: Offset(0, 8), blurRadius: 8)
                     ] ,
                     borderRadius: BorderRadius.circular(5),
                     gradient: LinearGradient(
                         colors: [Color(0xFF26D0CE),Colors.blueAccent]
                     )
                 ),
                 child: Padding(
                   padding: const EdgeInsets.only(top:10),
                   child: ListTile(
                     title: Text("${request??0}",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
                     subtitle: Text("Total Bookings",style: GoogleFonts.roboto(color: Colors.white,fontSize: 12),),
                     trailing: FaIcon(FontAwesomeIcons.shopify,color:Colors.white,),
                   ),
                 ),
               ),
               SizedBox(width: 10,),
               Container(
                 height: height*0.12,
                 width: width*0.24,
                 decoration: BoxDecoration(
                     boxShadow:[
                       BoxShadow(
                           color: Colors.black12, offset: Offset(0, 8), blurRadius: 8)
                     ] ,
                     borderRadius: BorderRadius.circular(5),
                     gradient: LinearGradient(
                         colors: [Color(0xFFFF512F),Color(0xFFDD2476)]
                     )
                 ),
                 child: ListTile(
                   title: Text("${bookings??0}",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
                   subtitle: Text("Total Bookings",style: GoogleFonts.roboto(color: Colors.white,fontSize: 12),),
                   trailing: FaIcon(FontAwesomeIcons.shopify,color:Colors.white,),
                 ),
               ),
               SizedBox(width: 10,),
               Container(
                 height: height*0.12,
                 width: width*0.24,
                 decoration: BoxDecoration(
                     boxShadow:[
                       BoxShadow(
                           color: Colors.black12, offset: Offset(0, 8), blurRadius: 8)
                     ] ,
                     borderRadius: BorderRadius.circular(5),
                     gradient: LinearGradient(
                         colors: [Colors.orangeAccent,Colors.orange]
                     )
                 ),
                 child: ListTile(
                   title: Text("${cancel??0}",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold),),
                   subtitle: Text("Cancel",style: GoogleFonts.roboto(color: Colors.white),),
                   trailing: FaIcon(Icons.close_outlined,color:Colors.white,),
                 ),
               )
             ],
           ),
         ),
       ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(top:35,left: 20),
          child: Row(
            children: [
              Text("Reqested Bokings",style: GoogleFonts.roboto(color: Colors.purple,fontSize: 19,shadows: [Shadow(
                  color: Colors.black87
              )]),)
            ],
          ),
        ),
        SizedBox(height: 20,),
        Padding(
          padding:EdgeInsets.only(left:10),
          child: Row(
            children: [
              SizedBox(
                  height: height*0.3,
                  width: width*0.4,
                  child: LineChartSample4()),
              SizedBox(width: 20,),
              SizedBox(
                  height: height*0.3,
                  width: width*0.4,
                  child: LineChartSample1()),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:35,left: 20),
          child: Row(
            children: [
              Text("Confirmed Bookings Analysis",style: GoogleFonts.roboto(color: Colors.purple,fontSize: 19,shadows: [Shadow(
                  color: Colors.black87
              )]),)
            ],
          ),
        ),
        SizedBox(height: 20,),
        Padding(
          padding:EdgeInsets.only(left:10),
          child: Row(
            children: [
              SizedBox(
                  height: height*0.3,
                  width: width*0.4,
                  child: LineChartSample4()),
              SizedBox(width: 20,),
              SizedBox(
                  height: height*0.3,
                  width: width*0.4,
                  child: LineChartSample1()),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:35,left: 20),
          child: Row(
            children: [
              Text("Cancelled Analytics",style: GoogleFonts.roboto(color: Colors.purple,fontSize: 19,shadows: [Shadow(
                  color: Colors.black87
              )]),)
            ],
          ),
        ),
        SizedBox(height: 20,),
        Padding(
          padding:EdgeInsets.only(left:10),
          child: Row(
            children: [
              SizedBox(
                  height: height*0.3,
                  width: width*0.4,
                  child: LineChartSample4()),
              SizedBox(width: 20,),
              SizedBox(
                  height: height*0.3,
                  width: width*0.4,
                  child: LineChartSample1()),
            ],
          ),
        ),
      ],
    );
  }
}