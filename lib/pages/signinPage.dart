import 'package:blog_app_front_end/pages/menuPage.dart';
import 'package:blog_app_front_end/pages/signUpPage.dart';
import 'package:blog_app_front_end/services/userservice.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class signinPage extends StatefulWidget {
  const signinPage({super.key});

  @override
  State<signinPage> createState() => _signinPageState();
}

class _signinPageState extends State<signinPage> {
  String email="",password="";
  TextEditingController  emailObj =new TextEditingController();
  TextEditingController  passwordObj =new TextEditingController();

  void  SendValue() async{
    final response = await userAiService().loginApi(emailObj.text, passwordObj.text);
    if(response["status"]=="Signed IN "){
      String userId =response["userdata"]["_id"].toString();
      SharedPreferences.setMockInitialValues({});
      SharedPreferences preferences =await SharedPreferences.getInstance();
      preferences.setString("userId", userId);
     print("Successfully login"+userId);
      Navigator.push(context,MaterialPageRoute(builder: (context)=>menuPage()));

    }
    else if(response["status"]=="Invalid user"){
      print("Invalid user");
  }
  else if(response["status"]=="Invalid Password"){
  print("Invalid Password");
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blueAccent,title: Text("BLOG",style: TextStyle(
        color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold
      ),),
      ),
      body: Container(
        color: Colors.blue.withOpacity(0.5),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              controller: passwordObj,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter password",
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
                    onPressed:SendValue, child: Text("LOGIN"))),
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>signUpPage()));
              }, child: Text("New user Signup")),
            ),
          ],
        ),
      ),

    );
  }
}
