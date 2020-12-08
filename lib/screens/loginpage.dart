import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:management/Authentication/auth.dart';
import 'package:management/constants/responsiveLayout.dart';
import 'package:management/widgets/navbar.dart';
import 'package:management/widgets/sendbtn.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Container(
     decoration: BoxDecoration(
         gradient: LinearGradient(colors: [
           Color(0xFFF8FBFF),
           Color(0xFFFCFDFD),
         ])),
     child: Scaffold(
       backgroundColor: Colors.transparent,
       body: SingleChildScrollView(
         child: Column(
           children: <Widget>[NavBar(txt: "Sign Up",), Body()],
         ),
       ),
     ),
   );
  }

}
class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: LLargeChild(),
      smallScreen: LSmallChild(),
    );
  }

}
class LLargeChild  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.centerRight,
            widthFactor: .6,
            child: Image.asset("assets/image.jpg", scale: .85),
          ),
          FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: .6,
            child: Padding(
              padding: EdgeInsets.only(left: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Welcome Back!",
                      style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Montserrat-Regular",
                          color: Color(0xFF8591B0))),
                  RichText(
                    text: TextSpan(
                        text: "SignIn ",
                        style:
                        TextStyle(fontSize: 60, color: Color(0xFF8591B0)),
                        children: [
                          TextSpan(
                              text: "",
                              style: TextStyle(
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87))
                        ]),
                  ),

                  SizedBox(
                    height: 40,
                  ),
                  fields(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}
class LSmallChild  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Welcome Back!",
              style: TextStyle(
                  fontSize: 40,
                  color: Color(0xFF8591B0),
                  fontWeight: FontWeight.bold,
                  fontFamily: "Montserrat-Regular"),
            ),
            RichText(
              text: TextSpan(
                text: 'SignIn',
                style: TextStyle(fontSize: 40, color: Color(0xFF8591B0)),
                children: <TextSpan>[
                  TextSpan(
                      text: '',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.black87)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 20),
              child: Text("LET’S EXPLORE THE WORLD"),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Image.network(
                "assets/image.jpg",
                scale: 1,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            fields(),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }


}

class fields extends StatefulWidget{
  @override
  _fieldsState createState() => _fieldsState();
}

class _fieldsState extends State<fields> {
  bool load = false;

  String email;

  String password;

  @override
  Widget build(BuildContext context) {
    void submit() async{
      final auth = Provider.of<AuthBase>(context, listen: false);
      try{
        setState(() {
          load=true;
        });
        await auth.signInWithEmailAndPassword(email, password).whenComplete(() async {
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
    return load?Center(child: CircularProgressIndicator()):Padding(
      padding: const EdgeInsets.only(right:100),
      child: Column(
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
                            email=value;
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Your Email Address'),
                        )),
                  ],
                ),
              ),
            ),
          ),
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
                            password=value;
                          },
                          decoration: InputDecoration(
                              suffixIcon: FaIcon(FontAwesomeIcons.eye),
                              border: InputBorder.none,
                              hintText: 'Password'),
                        )),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left:100,right:150),
            child: SendBtn(tap: submit,
                txt:"Login"),
          )
        ],
      ),
    );
  }
}