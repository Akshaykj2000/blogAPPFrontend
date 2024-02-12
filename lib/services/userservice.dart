import 'dart:convert';

import 'package:http/http.dart' as http;

class userAiService{

  Future<dynamic> loginApi(String email, String password) async
  {
    var client =http.Client();
    var url=Uri.parse("http://172.16.184.198:3001/blog/signin");
    var response =await client.post(url,
    headers: <String,String>{
      "Content-Type" :"application/json ; charset=UTF-8"
    },
    body: jsonEncode(<String,String>{
           "EMAILID": email,
           "password": password,
    })
    );

    if(response.statusCode ==200){
      return jsonDecode(response.body);
    }
    else{
      throw Exception("Fail to send data");
    }

  }

  Future<dynamic> sendData(
  String name,
  String age,
  String mobile,
  String address,
  String pincode,
  String emailid,
  String password) async{
    
    var client = http.Client();
    var url =Uri.parse("http://172.16.184.198:3001/blog/signup");
    var response=await client.post(url,
    headers: <String,String>{
      "Content-Type" : "application/json; charset=UTF-8"
    },
      body:jsonEncode(<String,String>{
        "NAME": name,
        "AGE": age,
        "MOBILE": mobile,
        "ADDRESS": address,
        "PINCODE": pincode,
        "EMAILID": emailid,
        "password": password,
      })
    );
  if(response.statusCode ==200){
    return jsonDecode(response.body);
  }
  else{
    throw Exception("Fail to send data");
  }
  }
}