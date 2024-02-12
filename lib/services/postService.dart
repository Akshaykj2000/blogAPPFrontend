import "dart:convert";

import "package:http/http.dart" as http;
class PostApiService{
  Future<dynamic>  addPost(String userId,String post)async{
    var client =http.Client();
    var url =Uri.parse("http://172.16.184.198:3001/post/add");
    var response =await client.post(url,
        headers: <String,String>{
        "Content-Type" :"application/json ; charset=UTF-8"
        },
        body: jsonEncode(
            <String,String>{
              "userId": userId,
              "post": post,
            }
        )
    );

    if(response.statusCode ==200){
      return jsonDecode(response.body);
    }
    else{
      throw Exception("Fail to send data");
    }

  }

  }
