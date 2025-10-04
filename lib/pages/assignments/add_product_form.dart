import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddProductForm extends StatefulWidget {
  const AddProductForm({super.key});

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController productNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  Future<void> createProduct(
    String name,
    String description,
    double price,
  ) async {
    try {
      var response = await http.post(
        Uri.parse("http://localhost:8001/products"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": name,
          "description": description,
          "price": price,
        }),
      );
      if (response.statusCode == 201) {
        //code somthing...
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Add successfully!"), backgroundColor: Colors.green));
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Product")),
      body: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            spacing: 20,
            children: [
              TextFormField(
                controller: productNameController,
                decoration: InputDecoration(labelText: "Product Name"),
                validator: (value) =>
                    (value!.isNotEmpty) ? null : "Product Name is empty",
              ),

              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: "Description"),
                validator: (value) =>
                    (value!.isNotEmpty) ? null : "Description is empty",
              ),

              TextFormField(
                controller: priceController,
                decoration: InputDecoration(labelText: "Price"),
                validator: (value) {
                  RegExp regExp = RegExp(r'[a-zA-Z]');
                  if (value!.isEmpty) {
                    return "Price is empty";
                  } else if (regExp.hasMatch(value)) {
                    return "Value in Price field is not a number";
                  } else if (double.parse(value!) <= 0) {
                    return "Price is not in range 1,2,...";
                  } else {
                    return null;
                  }
                },
              ),

              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    createProduct(
                      productNameController.text,
                      descriptionController.text,
                      double.parse(priceController.text),
                    );
                  }
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
