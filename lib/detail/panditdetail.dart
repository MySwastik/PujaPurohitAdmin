import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PanditList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('Avaliable_pundit').snapshots(),
              builder: (context, snapshot) {

                if(snapshot.hasData){
                  final servicess = snapshot.data.docs;
                  List<Widget> servicessWidgets=[];
                  for(var mess in servicess){
                    final messegecontent=mess.data()['firstName'];
                    final swastik=mess.data()['swastik'];
                    final state=mess.data()['state'];

                    final uid= mess.data()['uid'];
                    final image=mess.data()['profilePicUrl'];
                    final phone =mess.data()['number'];
                    final messagewidget=users(messegecontent,uid,image,context,phone,swastik,state);
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
  Widget users(String name, String uid,String image,BuildContext context,String phone,double age,String email){
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
      trailing: Text("Swastik : ${age}"),
    );
  }
}
class UserDetail extends StatelessWidget{
  final String name;
  final String uid;
  final String image;
  final String phone;
  final double age;
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
              Text("Swastik: ${age}"),
              Text("Unique id : ${uid}"),
              Text("Contact: ${phone}"),
              Text("state: ${email}"),
              StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance.doc("punditUsers/${uid}/user_profile/user_bank_details").snapshots(),
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    final servicess = snapshot.data;
                    return Column(
                      children: [
                        Text("Bank Name :${servicess.data()['bankName']}"??"not provided"),
                        Text("Ifsc code :${servicess.data()['IFSC']}"??"not provided"),
                        Text("Account Number: ${servicess.data()['accountNumber']}"??"not provided"),
                        Text("Name on bank : ${servicess.data()['name']}"??"not provided")
                      ],
                    );
                  }
                  return CircularProgressIndicator();
                }
              )
            ],),
          ),
        )
    );
  }

}
