import 'package:flutter/material.dart';
import 'dart:convert';

class UsersList extends StatefulWidget {
  UsersList({Key? key}) : super(key: key);

  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  late List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contributors'),
      ),
      body: Center(
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('user/contributors.json'),
            builder: (context, snapshot) {
              var newData = json.decode(snapshot.data.toString());

              return ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Text(newData[index]['name'],
                              style: TextStyle(
                                  fontSize: 20,
                                  decoration: TextDecoration.underline)),
                          Text(newData[index]['username'],
                              style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: newData == null ? 0 : newData.length,
              );
            }),
      ),
    );
  }
}
