import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:management/Authentication/auth.dart';
import 'package:management/Navigations/graph1.dart';
import 'package:management/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:management/screens/login.dart';
import 'package:management/services/database.dart';
import 'package:provider/provider.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(create: (context)=>Auth(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Color(0xFFFD3664),
          fontFamily: 'Montserrat',
        ),
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        debugShowCheckedModeBanner: false,
        home:Control(),
        routes: {
          '/home':(_)=>Control()
        },
      ),
    );
  }
}



class Control extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    final auth = Provider.of<AuthBase>(context,listen: false);
    return StreamBuilder<Users>(
      stream: auth.onAuthChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          Users user=snapshot.data;
          if(user==null){
            return Provider<Users>.value(
                value: user,
                child: Provider<Database>(
                  create: (_)=>FirestoreDatabase(uid: user.uid),
                  child: HomePage(),
                )
            );
          }

          else{
            return Provider<Users>.value(
                value: user,
                child: Provider<Database>(
                    create: (_)=>FirestoreDatabase(uid: user.uid),
                    child:SideNavigator(admin:user.uid)
                  //Dashboard(admin:user.uid,),
                )
            );}
        }
        return CircularProgressIndicator();
      },
    );
  }
}