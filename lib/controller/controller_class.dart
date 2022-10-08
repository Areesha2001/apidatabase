import 'package:apidatabase/database/database_helper.dart';
import 'package:apidatabase/services/api_calling.dart';
import 'package:flutter/material.dart';
import 'package:apidatabase/model/post_data.dart';
import 'dart:core';

class controllersData extends ChangeNotifier{
   List<Post> postlist =[];
   List<Services> services =[];
  var datalist;
  Services src = new Services();
  List<Post> get user => postlist;
  DataBaseHelper dbase = DataBaseHelper();
  Post? post;


  checkDb() async {
    var isDataAvailable = await dbase.documentPresentCheck();
    print('Hey I checked data $isDataAvailable');
    if (isDataAvailable) {
      var getData = getAllData();
      print(' data get from database $getData');
      return getAllData();
    }
    else {
      await Services.getPosts().then((value) async {
        for (var element in value!)
        {
          print('Element is $element');
           post = Post.fromMap(element);
        }
        return await DataBaseHelper().add_Data(post!);
      });
    }
  }

  Future addUser(Post post) async{
    await DataBaseHelper().add_Data(post);
    print('adding data in db');
    notifyListeners();
  }

   Future getAllData() async{
    var data = await DataBaseHelper().get_Data();
    for (var element1 in data)
     {
     postlist.add(Post.fromMap(element1));
     }
    print('Getting data ${postlist.length}');
    notifyListeners();
    return postlist;
  }
}
