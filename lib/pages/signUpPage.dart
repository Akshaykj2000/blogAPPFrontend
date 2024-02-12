import 'package:blog_app_front_end/services/userservice.dart';
import 'package:flutter/material.dart';

class signUpPage extends StatefulWidget {
  const signUpPage({super.key});

  @override
  State<signUpPage> createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {

  String name="",age="",mobile="",address="",pincode="",email="",password="";
  TextEditingController  emailObj =new TextEditingController();
  TextEditingController  passwordObj =new TextEditingController();
  TextEditingController  nameObj =new TextEditingController();
  TextEditingController  ageObj =new TextEditingController();
  TextEditingController  mobileObj =new TextEditingController();
  TextEditingController  addressObj =new TextEditingController();
  TextEditingController  pincodeObj =new TextEditingController();

void sendUserdata() async{
  final response = await  userAiService().sendData(nameObj.text, ageObj.text, mobileObj.text, addressObj.text, pincodeObj.text, emailObj.text, passwordObj.text);

  if(response["status"]=="success"){

    print("Successfully added");
  }
  else{
    print("error");
  }
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,title: Text("BLOG",style: TextStyle(
            color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold
        ),),
        ),
        body: Container(
          color: Colors.blue.withOpacity(0.3),
          padding: EdgeInsets.all(30),
          child: ListView(

            children: [
              TextField(
                controller: nameObj,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Name",
                    labelText: "Name",
                    fillColor: Colors.grey[100],
                    filled: true
                ),
              ),
              SizedBox(height: 30,),
              TextField(
                controller: ageObj,
                keyboardType: TextInputType.number,
              //  controller: passwordObj,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter age",
                    labelText: "Age",
                    fillColor: Colors.grey[100],
                    filled: true
                ),
              ),
              SizedBox(height: 30,),
              TextField(
                controller: mobileObj,
                keyboardType: TextInputType.number,
                //  controller: passwordObj,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter mobile",
                    labelText: "Mobile",
                    fillColor: Colors.grey[100],
                    filled: true
                ),
              ),
              SizedBox(height: 30,),
              TextField(
                controller: addressObj,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter address",
                    labelText: "address",
                    fillColor: Colors.grey[100],
                    filled: true
                ),
              ),
              SizedBox(height: 30,),
              TextField(
                controller: pincodeObj,
                keyboardType: TextInputType.number,
                //  controller: passwordObj,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter pincode",
                    labelText: "pincode",
                    fillColor: Colors.grey[100],
                    filled: true
                ),
              ),
              SizedBox(height: 30,),
              TextField(
                  controller: emailObj,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter email",
                    labelText: "Email",
                    fillColor: Colors.grey[100],
                    filled: true
                ),
              ),
              SizedBox(height: 30,),
              TextField(
                  controller:passwordObj,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Password",
                    labelText: "Password",
                      fillColor: Colors.grey[100],
                      filled: true
                ),
              ),
              SizedBox(height: 30,),
              SizedBox(
                  width: 310,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)
                        )
                      ),
                      onPressed: sendUserdata, child: Text("Register"))),
              SizedBox(height: 30,),
              SizedBox(
                width: 310,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)
                        )
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    }, child: Text("Back to login")),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
