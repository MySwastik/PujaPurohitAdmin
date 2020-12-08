import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:management/Authentication/auth.dart';
import 'package:management/Navigations/graph1.dart';
import 'package:management/constants/responsiveLayout.dart';
import 'package:management/detail/bookings.dart';
import 'package:management/detail/panditdetail.dart';
import 'package:management/detail/userslist.dart';
import 'package:provider/provider.dart';

class D6 extends StatefulWidget {
  final String admin;
  D6({Key key, this.admin}) : super(key: key);
  @override
  _D6State createState() => _D6State();
}

class _D6State extends State<D6> {
  bool load=false;
  bool admin=false;
  dynamic users;
  dynamic brahmans;
  dynamic trend;
  dynamic req;
  dynamic book;
  call()async{
    await FirebaseFirestore.instance.collection("RBOOKING").get().then((value){
      setState(() {
        req=value.docs.length;
      });
    });
    await FirebaseFirestore.instance.collection("Bookings").get().then((value){
      setState(() {
        book=value.docs.length;
      });
    });
    await FirebaseFirestore.instance.collection("users").get().then((value){
      setState(() {
        users=value.docs.length;
      });
    });
    await FirebaseFirestore.instance.collection("Avaliable_pundit").get().then((value){
      setState(() {
        brahmans=value.docs.length;
      });
    });
    await FirebaseFirestore.instance.collection("Trending").orderBy("num").get().then((value){
      setState(() {
        trend=value.docs.reversed.elementAt(0).data()['name'];
      });
      print(trend);
    });

  }
  @override
  void initState() {
    call();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
            D6Body(trend:trend,users: users,brahmans: brahmans,req: req,book: book,)
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
class D6Body extends StatelessWidget{
  final dynamic users;
  final dynamic brahmans;
  final dynamic trend;
  final dynamic req;
  final dynamic book;


  const D6Body({Key key,this.book, this.req, this.users, this.brahmans,this.trend}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: D6Large(trend:trend,users: users,brahmans: brahmans,req: req,book: book,),
      smallScreen:D6Small(trend:trend,users: users,brahmans: brahmans,req: req,book: book,) ,
    );
  }
}

class D6Large extends StatelessWidget{
  final dynamic users;
  final dynamic brahmans;
  final dynamic trend;
  final dynamic req;
  final dynamic book;

  const D6Large({Key key, this.users, this.brahmans,this.trend, this.req, this.book}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top:35,left: 20),
          child: Text("Dashboard",style: GoogleFonts.roboto(color: Colors.purple,fontSize: 24,shadows: [Shadow(
              color: Colors.black87
          )]),),
        ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(top:30,left: 30),
          child: Row(
            children: [
              InkWell(
                onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Userslist()));},
                child: Container(
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
                      title:Text("${users??"Fetching"}",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold),),
                      subtitle: Text("Users",style: GoogleFonts.roboto(color: Colors.white),),
                      trailing: FaIcon(FontAwesomeIcons.usersCog,color:Colors.white,size: 24,),
                    ),
                  ),
                ),
              ),
              SizedBox(width: width*0.03,),
              InkWell(
                onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>PanditList()));},
                child: Container(
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
                      title: Text("${brahmans??"Fetching"}",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold),),
                      subtitle: Text("Purohit",style: GoogleFonts.roboto(color: Colors.white),),
                      trailing: FaIcon(FontAwesomeIcons.users,color:Colors.white,size: 24),
                    ),
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
                    title: Text("Trending",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold),),
                    subtitle: Text("${trend??"Fetching"}",style: GoogleFonts.roboto(color: Colors.white),),
                    trailing: FaIcon(Icons.analytics_outlined,color:Colors.white,),
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
                    title: Text("",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold),),
                    subtitle: Text("Company Revenue",style: GoogleFonts.roboto(color: Colors.white),),
                    trailing: FaIcon(FontAwesomeIcons.apple,color:Colors.white,),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(top:30,left: 30),
          child: Row(
            children: [
              InkWell(
                onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>bookings(doc:"RBOOKING",)));},
                child: Container(
                  height: height*0.15,
                  width: width*0.18,
                  decoration: BoxDecoration(
                      boxShadow:[
                        BoxShadow(
                            color: Colors.black12, offset: Offset(0, 8), blurRadius: 8)
                      ] ,
                      borderRadius: BorderRadius.circular(5),
                      gradient: LinearGradient(
                          colors: [Color(0xFFfc00ff),Color(0xFF00dbde)]
                      )
                  ),
                  child: Center(
                    child: ListTile(
                      title:Text("${req??"Fetching"}",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold),),
                      subtitle: Text("Request",style: GoogleFonts.roboto(color: Colors.white),),
                      trailing: FaIcon(FontAwesomeIcons.usersCog,color:Colors.white,size: 24,),
                    ),
                  ),
                ),
              ),
              SizedBox(width: width*0.03,),
              InkWell(
                onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>bookings(doc:"Bookings")));},
                child: Container(
                  height: height*0.15,
                  width: width*0.18,
                  decoration: BoxDecoration(
                      boxShadow:[
                        BoxShadow(
                            color: Colors.black12, offset: Offset(0, 8), blurRadius: 8)
                      ] ,
                      borderRadius: BorderRadius.circular(5),
                      gradient: LinearGradient(
                          colors: [Color(0xFFee9ca7),Color(0xFFffdde1)]
                      )
                  ),
                  child: Center(
                    child: ListTile(
                      title: Text("${book??"Fetching"}",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold),),
                      subtitle: Text("Booked",style: GoogleFonts.roboto(color: Colors.white),),
                      trailing: FaIcon(FontAwesomeIcons.users,color:Colors.white,size: 24),
                    ),
                  ),
                ),
              ),
              SizedBox(width: width*0.03,),

            ],
          ),
        ),
        SizedBox(height: 20,),


      ],
    );
  }

}
class D6Small extends StatelessWidget{
  final dynamic users;
  final dynamic brahmans;
  final dynamic trend;
  final dynamic req;
  final dynamic book;
  const D6Small({Key key, this.users, this.brahmans,this.trend, this.req, this.book}) : super(key: key);
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
              Text("Dashboard",style: GoogleFonts.roboto(color: Colors.purple,fontSize: 19,shadows: [Shadow(
                  color: Colors.black87
              )]),),
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
                      title: Text("${users??"Fetching"}",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
                      subtitle: Text("Users",style: GoogleFonts.roboto(color: Colors.white,fontSize: 12),),
                      trailing: FaIcon(FontAwesomeIcons.usersCog,color:Colors.white,),
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
                    title: Text("${brahmans??"Fetching"}",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
                    subtitle: Text("Purohit",style: GoogleFonts.roboto(color: Colors.white,fontSize: 12),),
                    trailing: FaIcon(FontAwesomeIcons.users,color:Colors.white,),
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
                    title: Text("Trending",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
                    subtitle: Text("${trend??"Fetching"}",style: GoogleFonts.roboto(color: Colors.white,fontSize: 12),),
                    trailing: FaIcon(Icons.analytics_outlined,color:Colors.white,),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20,),
      ],
    );
  }

}