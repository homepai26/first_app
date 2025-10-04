import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Assignment5 extends StatefulWidget {
  const Assignment5({super.key});

  @override
  State<Assignment5> createState() => _Assignment5State();
}

class _Assignment5State extends State<Assignment5> {
  Future<void> fetchData() async {
    try {
      var response = await http.get(
        Uri.parse('http://localhost:8001/products'),
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Success!'),
            backgroundColor: Colors.green,
          ),
        );

        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('AlertDialog Title'),
            content: const Text('AlertDialog description'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print(e);
    }
  }

  

  Future<void> updateProduct({dynamic idUpdate = 4}) async {
    try {
      var response = await http.put(
        Uri.parse("http://localhost:8001/products/$idUpdate"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": "iPhone 5 plus",
          "description": "Apple smartphone",
          "price": 34900.00,
        }),
      );
      if (response.statusCode == 200) {
        //code somthing...
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteProduct({dynamic idDelete = 4}) async {
    try {
      var response = await http.delete(
        Uri.parse("http://localhost:8001/products/$idDelete"),
      );
      if (response.statusCode == 200) {
        //code somthing...
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Delete successfully!"), backgroundColor: Colors.green));
      } else {
        throw Exception("Failed to delete products");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API Example")),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                fetchData();
              },
              child: Text("Get"),
            ),
            ElevatedButton(
              onPressed: () {
                //createProduct();
              },
              child: Text("Post"),
            ),
            ElevatedButton(
              onPressed: () {
                updateProduct();
              },
              child: Text("Put"),
            ),
            ElevatedButton(
              onPressed: () {
                deleteProduct();
              },
              child: Text("Delete"),
            ),
          ],
        ),
      ),
    );
  }
}
