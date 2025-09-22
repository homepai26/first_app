import 'dart:convert';
import 'dart:io';

import 'package:first_app/api_example/model/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

User? userData;

void fetchUser() async {
  try {
    var response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      //User user = User.fromJson(data);
      //need to set stage in here
      userData = User.fromJson(data);
      //print('Name: ${user.name}');
    } else {
      print('Failed to fetch data');
    }
  } catch (e) {
    print('Error: $e');
  }
}

class ApiExample extends StatefulWidget {
  const ApiExample({super.key});

  @override
  State<ApiExample> createState() => _ApiExampleState();
}

class _ApiExampleState extends State<ApiExample> {
  @override
  void initState() {
    // TODO: implement initState
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Api Example")),
      body: Center(
        child: Column(
          children: [
            Text("Name: ${userData?.name}"),
            ElevatedButton(onPressed: () {setState(() {
              int i = 0;
              i++;
            });}, child: Text("Update"))
          ],
        )
      )
    );
  }
}
