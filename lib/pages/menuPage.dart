import 'package:blog_app_front_end/pages/postPage.dart';
import 'package:flutter/material.dart';

class menuPage extends StatefulWidget {
  const menuPage({super.key});

  @override
  State<menuPage> createState() => _menuPageState();
}

class _menuPageState extends State<menuPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,title: Text("BLOG",style: TextStyle(
            color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold
        ),),
        ),
        body: Container(
          child: Column(
            children: [

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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>postPage()));
                    }, child: Text("Create post")),
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
                    onPressed: (){

                    }, child: Text("View Post")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
