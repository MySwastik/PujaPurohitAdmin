import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:management/Authentication/auth.dart';
import 'package:management/Modal/refund.dart';
import 'package:management/Navigations/pie1.dart';
import 'package:management/constants/responsiveLayout.dart';
import 'package:management/services/database.dart';
import 'package:management/widgets/sendbtn.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
var dt = DateTime.now();

var selected;
class D7 extends StatefulWidget {
  final String admin;

  D7({Key key, this.admin}) : super(key: key);
  @override
  _D7State createState() => _D7State();
}

class _D7State extends State<D7> {
  call()async{
    await await FirebaseFirestore.instance.collection("Booking_analysis/${dt.year}/months/${dt.month}/days").doc("${dt.day}").get().then((value){
      setState(() {
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
            D7Body(
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
class D7Body extends StatelessWidget{
  final VoidCallback tap;

  const D7Body({Key key, this.tap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: D7Large(tap:tap),
      smallScreen:D7Small(tap:tap) ,
    );
  }
}

class D7Large extends StatelessWidget{
  final VoidCallback tap;
  double roundDouble(double value, int places){
    double mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  const D7Large({Key key, this.tap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final user=Provider.of<Users>(context);
    final database=Provider.of<Database>(context,listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top:35,left: 20),
          child: Row(
            children: [
              Text("Refund Section",style: GoogleFonts.roboto(color: Colors.purple,fontSize: 24,shadows: [Shadow(
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
        Row(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.black87)],
                    borderRadius: BorderRadius.circular(40)
                ),
                width: width*0.58,
                height: height,
                child: SingleChildScrollView(scrollDirection:Axis.vertical,child: Column(children: [
                  Text("Pending"),
                  SizedBox(height: 30,),
                  SingleChildScrollView(scrollDirection:Axis.vertical,child:
                   StreamBuilder<QuerySnapshot>(
                      stream:FirebaseFirestore.instance.collection("Refund").snapshots(),
                      // ignore: missing_return
                      builder: (context, snapshot) {
                        if(snapshot.data==null){
                          return Center(child: CircularProgressIndicator(),);
                        }
                        final servicess = snapshot.data.docs;
                        List<Widget> servicessWidgets=[];
                        for(var mess in servicess){
                          final messegecontent=mess.data()['Booked_by'];
                          final time= mess.data()['total'];
                          final messagewidget=RefundTile(messegecontent,time,context);
                          servicessWidgets.add(messagewidget);
                        }
                        return ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: servicessWidgets
                        );
                      }
                  )
                  )
                ],))),
            SizedBox(width: 5,),
            Container(
                height: height,
                width: width*0.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black87)],
                  borderRadius: BorderRadius.circular(40)
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Text("Refunded"),
                      SizedBox(height: 30,),
                      StreamBuilder<List<Refund>>(
                        stream: database.Return(),
                        // ignore: missing_return
                        builder: (context, snapshot) {
                          if(snapshot.data==null){
                            return Center(child: CircularProgressIndicator(),);
                          }
                             final pd=snapshot.data;
                          pd.forEach((element) {
                            if(element.refunded==false){
                              return SizedBox();
                            }

                          });
                          final pdata=pd.map((Refund) =>RefundedTile(Refund,context)).toList();
                          return ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: pdata,
                          );
                        }
                      ),
                    ],
                  ),
                ),
               ),],
        ),

      ],
    );
  }
  Widget RefundedTile(Refund refund,BuildContext context){
    return ListTile(
      onTap:(){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>RefundDetail(rrefund: refund,)));
      } ,
      title: Text("${refund.Booked_by}"),
      subtitle: Text("${refund.total.toStringAsFixed(2)}"),
    );
  }
  Widget RefundTile(String name,double total,BuildContext context){

    return ListTile(
      onTap:(){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>RefundDetail()));
      } ,
      title: Text("${name}"),
      subtitle: Text("${total}"),
    );
  }


}
class D7Small extends StatelessWidget{
  final VoidCallback tap;
  double roundDouble(double value, int places){
    double mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }
  const D7Small({Key key, this.tap}) : super(key: key);
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
      ],
    );
  }
  
}
class RefundDetail extends StatelessWidget{
  final Refund rrefund;
  double AmountRefund;
  RefundDetail({Key key, this.rrefund}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Duration claim=rrefund.Booking_for.toDate().difference(rrefund.Claim_time.toDate());
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
  return Scaffold(
    backgroundColor: Colors.white,
    body: Stack(
      children:[
        Padding(
          padding: const EdgeInsets.only(top: 150,left:900.0),
          child: Image.asset("assets/refund.png",fit: BoxFit.fill,),
        ),
        Container(
          padding: EdgeInsets.only(top:100),
            width: width*0.58,
            height: height,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    itemRow("Booking Id:", "${rrefund.bookingId}"),
                    SizedBox(height: 20,),
                    itemRow("Booked by:", "${rrefund.Booked_by}"),
                    SizedBox(height: 20,),
                    itemRow("Booked Purohit:", "${rrefund.Booked_purohit}"),
                    SizedBox(height: 20,),
                    itemRow("Amount Claimed:", "${rrefund.total.toStringAsFixed(2)}"),
                    Divider(),
                    SizedBox(height: 20,),
                    itemRow("Booking For:", "${rrefund.Booking_for.toDate()}"),
                    SizedBox(height: 20,),
                    itemRow("Cancel Time:", "${rrefund.cancel_time.toDate()}"),
                    SizedBox(height: 20,),
                    itemRow("Claim Time:", "${rrefund.Claim_time.toDate()}"),
                    SizedBox(height: 20,),
                    itemRow("Booking Time:", "${rrefund.Booking_time.toDate()}"),
                    SizedBox(height: 30,),
                    itemRow("Hours left:", "${claim}"),
                    SizedBox(height: 30,),
                    refund(),
                    SizedBox(height: 30,),
                    rrefund.refunded?Row(
                      children: [
                        AutoSizeText(
                            "Money Refunded",maxLines: 1,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              letterSpacing:1.3,
                              color: Color(0xff5b6990),)
                        ),
                        Spacer(),
                        Icon(Icons.verified,color: Colors.green,)
                      ],
                    ):Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 4.0,
                            right: ResponsiveLayout.isSmallScreen(context) ? 4 : 74,
                            top: 10,
                            bottom: 40,
                          ),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12, offset: Offset(0, 8), blurRadius: 8)
                                ]),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                      flex: 8,
                                      child: TextField(
                                        onChanged: (value){
                                          AmountRefund=double.parse(value);
                                        },
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Refunded Amount'),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left:100,right:150),
                          child: SendBtn(
                            tap: (){
                              FirebaseFirestore.instance.collection("Refund").doc("${rrefund.bookingId}").update({
                                'RefundAmount': AmountRefund,
                                'Refunded':true,
                              }).whenComplete(() => {
                                FirebaseFirestore.instance.collection("users/${rrefund.clientuid}/bookings").doc("${rrefund.bookingId}").update({
                                  'refunded':true,
                                  'refundmoney':AmountRefund,
                                })
                              }).whenComplete(() => {Navigator.pop(context)});
                            },
                              txt:"Refund"),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )),


      ] ,
    ),
  );
  }
  refund(){
    Duration claim=rrefund.Booking_for.toDate().difference(rrefund.Claim_time.toDate());
    double half=rrefund.total/2;
    double onlinehalf=half-rrefund.Transaction;
    double onlinefull=rrefund.total-rrefund.Transaction;
    if(claim<=Duration(hours: 24)){
      return itemRow("Expected Refund:", "${rrefund.cod?half.toStringAsFixed(2):onlinehalf.toStringAsFixed(2)}");
    }
    else{
      return itemRow("Expected Refund:", "${rrefund.cod?rrefund.total.toStringAsFixed(2):onlinefull.toStringAsFixed(2)}");
    }
  }
  itemRow(name, title) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AutoSizeText(
            name,maxLines: 1,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              letterSpacing:1.3,
              color: Color(0xff5b6990),)
        ),
        SizedBox(width: 10,),
        Flexible(
            fit: FlexFit.loose,
            child: AutoSizeText(
                title,maxLines: 2,style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              letterSpacing:1.3,
              color: Color(0xff5b6990),)))
      ],
    );
  }
}
