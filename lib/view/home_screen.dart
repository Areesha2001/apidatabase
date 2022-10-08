import 'package:apidatabase/controller/controller_class.dart';
import 'package:flutter/material.dart';
import 'package:apidatabase/model/post_data.dart';
import 'package:apidatabase/database/database_helper.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DataBaseHelper dt = new DataBaseHelper();
  List<Post>? posts;
  var isLoaded = false;
  @override
  void initState() {
    Provider.of<controllersData>(context, listen: false).checkDb();
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    var myprovider = Provider.of<controllersData>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Post"),
        actions: [ElevatedButton(onPressed: () {
        }, child: Text('Check Database'))],
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
            itemCount: myprovider.postlist.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      child: CircleAvatar(),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[300],
                      ),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            myprovider.postlist[index].title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            myprovider.postlist[index].body,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
