import 'dart:math';

import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:management/Authentication/auth.dart';
import 'package:management/Navigations/pie1.dart';
import 'package:management/constants/responsiveLayout.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:management/Navigations/graph1.dart';
import 'package:management/Navigations/graph2.dart';
dynamic overall;
dynamic vendor;
dynamic purohit;
dynamic company;
dynamic selected;
dynamic company_loss;
dynamic overall_loss;
dynamic vendor_loss;
dynamic purohit_loss;
dynamic sum=100/(overall+vendor+purohit+company);
dynamic poverall=overall*sum;
dynamic pvendor=vendor*sum;
dynamic ppurohit=purohit*sum;
dynamic pcompany=company*sum;
dynamic losssum=100/(overall_loss+vendor_loss+purohit_loss+company_loss);
dynamic poverall_loss=overall*losssum;
dynamic pvendor_loss=vendor*losssum;
dynamic ppurohit_loss=purohit*losssum;
dynamic pcompany_loss=company*losssum;
var dt = DateTime.now();
class D2 extends StatefulWidget {
  final String admin;

  D2({Key key, this.admin}) : super(key: key);
  @override
  _D2State createState() => _D2State();
}

class _D2State extends State<D2> {
  call()async{
    await await FirebaseFirestore.instance.collection("Booking_analysis/${dt.year}/months/${dt.month}/days").doc("${dt.day}").get().then((value){
      setState(() {
        overall=value.data()['overall']??0;
        vendor=value.data()['vendor']??0;
        purohit=value.data()['purohit']??0;
        company=value.data()['company']??0;
        overall_loss=value.data()['overall_loss']??0;
        vendor_loss=value.data()['vendor_loss']??0;
        purohit_loss=value.data()['purohit_loss']??0;
        company_loss=value.data()['company_loss']??0;
        selected="Today";
      });
    });
  }
  void initState() {
    call();
    super.initState();
  }
  bool load=false;
  bool admin=false;
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
                        overall=value.data()['overall']??0;
                        vendor=value.data()['vendor']??0;
                        purohit=value.data()['purohit']??0;
                        company=value.data()['company']??0;
                        overall_loss=value.data()['overall_loss']??0;
                        vendor_loss=value.data()['vendor_loss']??0;
                        purohit_loss=value.data()['purohit_loss']??0;
                        company_loss=value.data()['company_loss']??0;
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
                        overall=value.data()['overall'];
                        vendor=value.data()['vendor'];
                        purohit=value.data()['purohit'];
                        company=value.data()['company'];
                        overall_loss=value.data()['overall_loss']??0;
                        vendor_loss=value.data()['vendor_loss']??0;
                        purohit_loss=value.data()['purohit_loss']??0;
                        company_loss=value.data()['company_loss']??0;
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
                        overall=value.data()['overall'];
                        vendor=value.data()['vendor'];
                        purohit=value.data()['purohit'];
                        company=value.data()['company'];
                        overall_loss=value.data()['overall_loss']??0;
                        vendor_loss=value.data()['vendor_loss']??0;
                        purohit_loss=value.data()['purohit_loss']??0;
                        company_loss=value.data()['company_loss']??0;
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
                        overall=value.data()['overall'];
                        vendor=value.data()['vendor'];
                        purohit=value.data()['purohit'];
                        company=value.data()['company'];
                        overall_loss=value.data()['overall_loss']??0;
                        vendor_loss=value.data()['vendor_loss']??0;
                        purohit_loss=value.data()['purohit_loss']??0;
                        company_loss=value.data()['company_loss']??0;
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
                        overall=value.data()['overall'];
                        vendor=value.data()['vendor'];
                        purohit=value.data()['purohit'];
                        company=value.data()['company'];
                        overall_loss=value.data()['overall_loss']??0;
                        vendor_loss=value.data()['vendor_loss']??0;
                        purohit_loss=value.data()['purohit_loss']??0;
                        company_loss=value.data()['company_loss']??0;
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
                        overall=value.data()['overall'];
                        vendor=value.data()['vendor'];
                        purohit=value.data()['purohit'];
                        company=value.data()['company'];
                        overall_loss=value.data()['overall_loss']??0;
                        vendor_loss=value.data()['vendor_loss']??0;
                        purohit_loss=value.data()['purohit_loss']??0;
                        company_loss=value.data()['company_loss']??0;
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
                        overall=value.data()['overall'];
                        vendor=value.data()['vendor'];
                        purohit=value.data()['purohit'];
                        company=value.data()['company'];
                        overall_loss=value.data()['overall_loss']??0;
                        vendor_loss=value.data()['vendor_loss']??0;
                        purohit_loss=value.data()['purohit_loss']??0;
                        company_loss=value.data()['company_loss']??0;
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
                        overall=value.data()['overall'];
                        vendor=value.data()['vendor'];
                        purohit=value.data()['purohit'];
                        company=value.data()['company'];
                        overall_loss=value.data()['overall_loss']??0;
                        vendor_loss=value.data()['vendor_loss']??0;
                        purohit_loss=value.data()['purohit_loss']??0;
                        company_loss=value.data()['company_loss']??0;
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
                        overall=value.data()['overall'];
                        vendor=value.data()['vendor'];
                        purohit=value.data()['purohit'];
                        company=value.data()['company'];
                        overall_loss=value.data()['overall_loss']??0;
                        vendor_loss=value.data()['vendor_loss']??0;
                        purohit_loss=value.data()['purohit_loss']??0;
                        company_loss=value.data()['company_loss']??0;
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
                        overall=value.data()['overall'];
                        vendor=value.data()['vendor'];
                        purohit=value.data()['purohit'];
                        company=value.data()['company'];
                        overall_loss=value.data()['overall_loss']??0;
                        vendor_loss=value.data()['vendor_loss']??0;
                        purohit_loss=value.data()['purohit_loss']??0;
                        company_loss=value.data()['company_loss']??0;
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
                        overall=value.data()['overall'];
                        vendor=value.data()['vendor'];
                        purohit=value.data()['purohit'];
                        company=value.data()['company'];
                        overall_loss=value.data()['overall_loss']??0;
                        vendor_loss=value.data()['vendor_loss']??0;
                        purohit_loss=value.data()['purohit_loss']??0;
                        company_loss=value.data()['company_loss']??0;
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
                        overall=value.data()['overall'];
                        vendor=value.data()['vendor'];
                        purohit=value.data()['purohit'];
                        company=value.data()['company'];
                        overall_loss=value.data()['overall_loss']??0;
                        vendor_loss=value.data()['vendor_loss']??0;
                        purohit_loss=value.data()['purohit_loss']??0;
                        company_loss=value.data()['company_loss']??0;
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
                        overall=value.data()['overall'];
                        vendor=value.data()['vendor'];
                        purohit=value.data()['purohit'];
                        company=value.data()['company'];
                        overall_loss=value.data()['overall_loss']??0;
                        vendor_loss=value.data()['vendor_loss']??0;
                        purohit_loss=value.data()['purohit_loss']??0;
                        company_loss=value.data()['company_loss']??0;
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
                        overall=value.data()['overall'];
                        vendor=value.data()['vendor'];
                        purohit=value.data()['purohit'];
                        company=value.data()['company'];
                        overall_loss=value.data()['overall_loss']??0;
                        vendor_loss=value.data()['vendor_loss']??0;
                        purohit_loss=value.data()['purohit_loss']??0;
                        company_loss=value.data()['company_loss']??0;
                        selected="Dec";
                      });
                    });
                  },
                  child: Text('Dec')), value: 'log'),
          PopupMenuItem<String>(
              child:  InkWell(
                  onTap: ()async{
                    await FirebaseFirestore.instance.collection("Booking_analysis").doc("${dt.year}").get().then((value) {
                      setState(() {
                        overall=value.data()['overall'];
                        vendor=value.data()['vendor'];
                        purohit=value.data()['purohit'];
                        company=value.data()['company'];
                        overall_loss=value.data()['overall_loss']??0;
                        vendor_loss=value.data()['vendor_loss']??0;
                        purohit_loss=value.data()['purohit_loss']??0;
                        company_loss=value.data()['company_loss']??0;
                        selected="Last 365 days";
                      });
                    });
                  },
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
            D2Body(
              tap:showPopupMenu
            )
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
class D2Body extends StatelessWidget{
  final VoidCallback tap;

  const D2Body({Key key, this.tap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: D2Large(tap:tap),
      smallScreen:D2Small(tap:tap) ,
    );
  }
}

class D2Large extends StatelessWidget{
  final VoidCallback tap;
  double roundDouble(double value, int places){
    double mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  const D2Large({Key key, this.tap}) : super(key: key);
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
              Text("Revenue Analytics",style: GoogleFonts.roboto(color: Colors.purple,fontSize: 24,shadows: [Shadow(
                  color: Colors.black87
              )]),),
              Spacer(),
              InkWell(
                onTap: tap,
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
          child: Column(
            children: [
              Row(
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
                        title: Text("\₹${roundDouble(overall,2)??0.0}",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold),),
                        subtitle: Text("Overall",style: GoogleFonts.roboto(color: Colors.white),),
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
                        title: Text("\₹${roundDouble(vendor, 2)??0.0}",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold),),
                        subtitle: Text("Vendor Revenue",style: GoogleFonts.roboto(color: Colors.white),),
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
                            colors: [Colors.tealAccent,Colors.teal[400]]
                        )
                    ),
                    child: Center(
                      child: ListTile(
                        title: Text("\₹${roundDouble(purohit, 2)??0.0}",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold),),
                        subtitle: Text("Purohit Revenue",style: GoogleFonts.roboto(color: Colors.white),),
                        trailing: FaIcon(FontAwesomeIcons.rupeeSign,color:Colors.white,),
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
                        title: Text("\₹${roundDouble(company, 2)??0.0}",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold),),
                        subtitle: Text("Company Revenue",style: GoogleFonts.roboto(color: Colors.white),),
                        trailing: FaIcon(FontAwesomeIcons.apple,color:Colors.white,),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 20,),
              Row(
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
                        title: Text("\₹${roundDouble(overall_loss,2)??0.0}",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold),),
                        subtitle: Text("Overall loss",style: GoogleFonts.roboto(color: Colors.white),),
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
                        title: Text("\₹${roundDouble(vendor_loss, 2)??0.0}",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold),),
                        subtitle: Text("Vendor Loss",style: GoogleFonts.roboto(color: Colors.white),),
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
                            colors: [Colors.tealAccent,Colors.teal[400]]
                        )
                    ),
                    child: Center(
                      child: ListTile(
                        title: Text("\₹${roundDouble(purohit_loss, 2)??0.0}",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold),),
                        subtitle: Text("Purohit Loss",style: GoogleFonts.roboto(color: Colors.white),),
                        trailing: FaIcon(FontAwesomeIcons.rupeeSign,color:Colors.white,),
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
                        title: Text("\₹${roundDouble(company_loss, 2)??0.0}",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold),),
                        subtitle: Text("Company Loss",style: GoogleFonts.roboto(color: Colors.white),),
                        trailing: FaIcon(FontAwesomeIcons.apple,color:Colors.white,),
                      ),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20,),
        Padding(
          padding: EdgeInsets.only(left:width/4),
          child: SizedBox(
              height: height*0.35,
              width: width*0.3,
              child:PieChartSample3(pp:overall,pp1: vendor,pp2: purohit,pp3: company,)),
        ),
        SizedBox(height: 20,),
        Padding(
          padding: EdgeInsets.only(left:width/4),
          child: SizedBox(
              height: height*0.35,
              width: width*0.3,
              child:PieChartSample3(pp:poverall_loss,pp1: pvendor_loss,pp2: ppurohit_loss,pp3: pcompany_loss,)),
        ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(top:35,left: 20),
          child: Row(
            children: [
              Text("Overall Revenue Analytics",style: GoogleFonts.roboto(color: Colors.purple,fontSize: 24,shadows: [Shadow(
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
              Text("Vendor Revenue Analytics",style: GoogleFonts.roboto(color: Colors.purple,fontSize: 24,shadows: [Shadow(
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
              Text("Purohit Revenue Analytics",style: GoogleFonts.roboto(color: Colors.purple,fontSize: 24,shadows: [Shadow(
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
              Text("Company Revenue Analytics",style: GoogleFonts.roboto(color: Colors.purple,fontSize: 24,shadows: [Shadow(
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
class D2Small extends StatelessWidget{
  final VoidCallback tap;
  double roundDouble(double value, int places){
    double mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }
  const D2Small({Key key, this.tap}) : super(key: key);
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
              Text("Revenue Analytics",style: GoogleFonts.roboto(color: Colors.purple,fontSize: 19,shadows: [Shadow(
                  color: Colors.black87
              )]),),
              Spacer(),
              InkWell(
                onTap: tap,
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
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                          title: Text("\₹${roundDouble(overall, 2)??0.0}",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
                          subtitle: Text("Overall",style: GoogleFonts.roboto(color: Colors.white,fontSize: 12),),
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
                        title: Text("\₹${roundDouble(vendor, 2)??0.0}",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
                        subtitle: Text("Vendor Revenue",style: GoogleFonts.roboto(color: Colors.white,fontSize: 12),),
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
                              colors: [Colors.tealAccent,Colors.teal[400]]
                          )
                      ),
                      child: ListTile(
                        title: Text("\₹${roundDouble(purohit,2)??0.0}",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
                        subtitle: Text("Purohit Revenue",style: GoogleFonts.roboto(color: Colors.white,fontSize: 12),),
                        trailing: FaIcon(FontAwesomeIcons.rupeeSign,color:Colors.white,),
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
                        title: Text("\₹${roundDouble(company, 2)??0.0}",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
                        subtitle: Text("Company Revenue",style: GoogleFonts.roboto(color: Colors.white,fontSize: 12),),
                        trailing: FaIcon(FontAwesomeIcons.shopify,color:Colors.white,),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Row(
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
                          title: Text("\₹${roundDouble(overall_loss,2)??0.0}",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold),),
                          subtitle: Text("Overall loss",style: GoogleFonts.roboto(color: Colors.white),),
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
                          title: Text("\₹${roundDouble(vendor_loss, 2)??0.0}",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold),),
                          subtitle: Text("Vendor Loss",style: GoogleFonts.roboto(color: Colors.white),),
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
                              colors: [Colors.tealAccent,Colors.teal[400]]
                          )
                      ),
                      child: Center(
                        child: ListTile(
                          title: Text("\₹${roundDouble(purohit_loss, 2)??0.0}",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold),),
                          subtitle: Text("Purohit Loss",style: GoogleFonts.roboto(color: Colors.white),),
                          trailing: FaIcon(FontAwesomeIcons.rupeeSign,color:Colors.white,),
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
                          title: Text("\₹${roundDouble(company_loss, 2)??0.0}",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold),),
                          subtitle: Text("Company Loss",style: GoogleFonts.roboto(color: Colors.white),),
                          trailing: FaIcon(FontAwesomeIcons.apple,color:Colors.white,),
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(top:35,left: 20),
          child: Row(
            children: [
              Text("Overall Revenue Analytics",style: GoogleFonts.roboto(color: Colors.purple,fontSize: 19,shadows: [Shadow(
                  color: Colors.black87
              )]),)
            ],
          ),
        ),
        SizedBox(height: 20,),
        Padding(
          padding:EdgeInsets.only(left:width/5),
          child: SizedBox(
              height: height*0.3,
              width: width*0.4,
              child: LineChartSample4()),
        ),
        Padding(
          padding: const EdgeInsets.only(top:35,left: 20),
          child: Row(
            children: [
              Text("Vendor Revenue Analysis",style: GoogleFonts.roboto(color: Colors.purple,fontSize: 19,shadows: [Shadow(
                  color: Colors.black87
              )]),)
            ],
          ),
        ),
        SizedBox(height: 20,),
        Padding(
          padding:EdgeInsets.only(left:width/5),
          child: SizedBox(
              height: height*0.3,
              width: width*0.4,
              child: LineChartSample4()),
        ),
        Padding(
          padding: const EdgeInsets.only(top:35,left: 20),
          child: Row(
            children: [
              Text("Purohit Revenue Analytics",style: GoogleFonts.roboto(color: Colors.purple,fontSize: 19,shadows: [Shadow(
                  color: Colors.black87
              )]),)
            ],
          ),
        ),
        SizedBox(height: 20,),
        Padding(
          padding:EdgeInsets.only(left:width/5),
          child: SizedBox(
              height: height*0.3,
              width: width*0.4,
              child: LineChartSample4()),
        ),
        Padding(
          padding: const EdgeInsets.only(top:35,left: 20),
          child: Row(
            children: [
              Text("Company Revenue Analytics",style: GoogleFonts.roboto(color: Colors.purple,fontSize: 19,shadows: [Shadow(
                  color: Colors.black87
              )]),)
            ],
          ),
        ),
        SizedBox(height: 20,),
        Padding(
          padding:EdgeInsets.only(left:width/5),
          child: SizedBox(
              height: height*0.3,
              width: width*0.4,
              child: LineChartSample4()),
        ),
      ],
    );
  }

}