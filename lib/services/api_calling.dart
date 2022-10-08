
import 'package:http/http.dart' as http;
import 'dart:convert';


class Services{

  static Future getPosts() async
  {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(uri);
    if (response.statusCode == 200)
    {
      var data = jsonDecode(response.body);
      return data;
    }
  }
}

