import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiExampleListview extends StatefulWidget {
  const ApiExampleListview({super.key});

  @override
  State<ApiExampleListview> createState() => _ApiExampleListviewState();
}

class _ApiExampleListviewState extends State<ApiExampleListview> {
  List<UserEmployee> listEmployee = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllUsers();
  }

  void fetchAllUsers() async {
    try {
      var response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users'),
      );
      if (response.statusCode == 200) {
        List jsonList = jsonDecode(response.body);
        setState(() {
          listEmployee = jsonList
              .map((item) => UserEmployee.fromJson(item))
              .toList();
        });
      } else {
        print('Failed to fetch data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APIExampleList"),
        actions: [
          ElevatedButton(
            onPressed: () {
              fetchAllUsers();
            },
            child: Icon(Icons.refresh),
          ),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text("${listEmployee[index].id}"),
            title: Text("${listEmployee[index].name}"),
            subtitle: Text("Phone: ${listEmployee[index].phone}"),
            trailing: Text("${listEmployee[index].email}"),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: listEmployee.length,
      ),
    );
  }
}

//model classes
class UserEmployee {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  // Constructor
  UserEmployee(this.id, this.name, this.username, this.email, this.phone);
  // แปลง JSON เป็น Object
  UserEmployee.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'],
      username = json['username'],
      email = json['email'],
      phone = json['phone'];
}
