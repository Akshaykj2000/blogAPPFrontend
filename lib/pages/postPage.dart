import 'package:blog_app_front_end/services/postService.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class postPage extends StatefulWidget {
  const postPage({super.key});

  @override
  State<postPage> createState() => _postPageState();
}

class _postPageState extends State<postPage> {
TextEditingController post =new TextEditingController();

  void SendPostApi() async{
    SharedPreferences prefer =await SharedPreferences.getInstance();
    String userId =prefer.getString("userId")??"";
  print("postis"+post.text);

    final response =await PostApiService().addPost(
      userId,post.text );

    if(response["status"] =="success"){
      print("Posted Sucessfully.....");
    }
    else{
      print("Failed Posting");
    }

  }
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
          padding: EdgeInsets.all(30),
          child: Column(
            children: [

              TextField(
                controller: post,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Type Someting ...",
                  labelText: "Type Someting ...",

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
                    onPressed: SendPostApi, child: Text("SEND")),
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
                      Navigator.pop(context);
                    }, child: Text("Back to menu")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
