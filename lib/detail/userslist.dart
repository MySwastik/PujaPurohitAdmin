import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Userslist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (context, snapshot) {

              if(snapshot.hasData){
                final servicess = snapshot.data.docs;
                List<Widget> servicessWidgets=[];
                for(var mess in servicess){
                  final messegecontent=mess.data()['name'];
                  final age=mess.data()['age'];
                  final email=mess.data()['email'];
                  final time= mess.data()['uid'];
                  final image=mess.data()['photoUrl'];
                  final phone =mess.data()['phone'];
                  final messagewidget=users(messegecontent,time,image,context,phone,age,email);
                  servicessWidgets.add(messagewidget);
                }
                return ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: servicessWidgets
                );
              }
              return CircularProgressIndicator();
            }
          ),
        ),
      ),
    );
  }
  Widget users(String name, String uid,String image,BuildContext context,String phone,int age,String email){
    return ListTile(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>UserDetail(name: name,phone: phone,image: image,uid: uid,age: age,email: email,)));
      },
      selectedTileColor: Colors.blueAccent,
      focusColor: Colors.blueAccent,
      leading: InkWell(
        onTap: (){
          showDialog(context: context,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(image),fit: BoxFit.fill)
                ),
              )
          );
        },
        child: Container(
          height: 50,width: 50,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: NetworkImage(image),fit: BoxFit.fill)
          ),
        ),
      ),
      title: Text("$name"),
      subtitle: Text("$uid"),
      trailing: Text("Contact : ${phone}"),
    );
  }
}
class UserDetail extends StatelessWidget{
  final String name;
  final String uid;
  final String image;
  final String phone;
  final int age;
  final String email;

  const UserDetail({Key key,this.age,this.email, this.name, this.uid, this.image, this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Center(
       child: Padding(
         padding: const EdgeInsets.only(top:80.0),
         child: Column(children: [
           Container(
             height: 160,width: 160,
             decoration: BoxDecoration(
               shape: BoxShape.rectangle,
              image:DecorationImage(image: NetworkImage(image),fit: BoxFit.fill)
             ),
           ),
           SizedBox(height: 10,),
           Text("Name: ${name}"),
           Text("Age: ${age}"),
           Text("Unique id : ${uid}"),
           Text("Contact: ${phone}"),
           Text("Email: ${email}")
         ],),
       ),
     )
   );
  }

}
