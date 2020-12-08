import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class bookings extends StatelessWidget {
  final String doc;

  const bookings({Key key, this.doc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Row(
                  children: [
                    Text("Image"),
                    Spacer(),
                    Text("Name"),
                    Spacer(),
                    Text("Booking ID"),
                    Spacer(),
                    Text("Cod Order"),
                    Spacer(),
                    Text("Online Order"),
                    Spacer(),
                    Text(("Time strap"))
                  ],
                ),
              ),
              SizedBox(height: 20,),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('$doc').orderBy("timestrap").snapshots(),
                  builder: (context, snapshot) {

                    if(snapshot.hasData){
                      final servicess = snapshot.data.docs.reversed;
                      List<Widget> servicessWidgets=[];
                      for(var mess in servicess){
                        final messegecontent=mess.data()['client'];
                        final payment=mess.data()['payment'];
                        final cod=mess.data()['cod'];
                        final online=mess.data()['online'];
                        final state=mess.data()['state'];
                        final timestrap=mess.data()['timestrap'];
                        final panditpic=mess.data()['panditpic'];
                        final uid= mess.data()['bookingId'];
                        final image=mess.data()['pic'];
                        final phone =mess.data()['number'];
                        final cancel=mess.data()['cancel'];
                        final messagewidget=users(cancel,messegecontent,uid,image,context,phone,payment,cod,online,state,timestrap,panditpic);
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
            ],
          ),
        ),
      ),
    );
  }
  Widget users(bool cancel,String name, int uid,String image,BuildContext context,String phone,bool age,bool cod,bool online,String email,Timestamp timestrap,String panditpic){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>UserDetail(doc:doc,name: name,phone: phone,image: image,uid: uid,email: email,panditpic: panditpic,)));
      },
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Container(

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: cancel?Colors.red:Colors.green,
          ),
          child: Row(children: [
            InkWell(
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
            Spacer(),
            Text("$name"),
            Spacer(),
            Text("$uid"),
            Spacer(),
            cod?Icon(Icons.done):Icon(Icons.close),
            Spacer(),
            online?Icon(Icons.done):Icon(Icons.close),
            Spacer(),
            Text("${timestrap.toDate()}")
          ],),
        ),
      ),


    );
  }
}
class UserDetail extends StatelessWidget{
  final String name;
  final int uid;
  final String image;
  final String phone;
  final double age;
  final String email;
  final String panditpic;
  final String doc;
  final int bookid;

  const UserDetail({Key key,this.doc,this.bookid,this.panditpic,this.age,this.email, this.name, this.uid, this.image, this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top:80.0),
            child: Column(children: [
              Row(
                children: [
                  Container(
                    height: 160,width: 160,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image:DecorationImage(image: NetworkImage(image),fit: BoxFit.fill)
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 160,width: 160,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image:DecorationImage(image: NetworkImage(panditpic??""),fit: BoxFit.fill)
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance.doc("${doc}/${uid}").snapshots(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      final servicess = snapshot.data;
                      return Column(
                        children: [
                          Text("Booking Id :${servicess.data()['bookingId']}"??"not provided"),
                          Text("Name :${servicess.data()['client']}"??"not provided"),
                          Text("Amount Paid: ${servicess.data()['AmountPaid']}"??"not provided"),
                          Text("Location : ${servicess.data()['Location']}"??"not provided"),
                          Divider(color: Colors.grey,),
                          Text("Benefit: ${servicess.data()['benefit']}"),
                          Text("Company Benefit: ${servicess.data()['companybenefit']}"),
                          Text("Pandit Benefit: ${servicess.data()['panditbenefit']}"),
                          Text("Benefit: ${servicess.data()['benefit']}"),
                          Text("Transaction: ${servicess.data()['transaction']}"),
                          Divider(color: Colors.grey,),
                          Text("Service : ${servicess.data()['service']}"),
                          Text("Service Charge: ${servicess.data()['price']}"),
                          Text("Samagri Charge: ${servicess.data()['samagri_price']}"),
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
