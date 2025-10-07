import 'dart:convert';

import 'package:first_app/pages/assignments/add_product_form.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductData {
  final int id;
  final String name;
  final String description;
  final double price;

  ProductData(this.id, this.name, this.description, this.price);

  ProductData.formJson(Map<String, dynamic> json)
    : id = json["id"],
      name = json["name"],
      description = json["description"],
      price = json["price"];
}

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  List<ProductData> products = [];

  Future<void> fetchData() async {
    try {
      var response = await http.get(
        Uri.parse('http://localhost:8001/products'),
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);

        setState(() {
          products = jsonList
              .map((element) => ProductData.formJson(element))
              .toList();
        });

        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(
        //     content: Text('Success!'),
        //     backgroundColor: Colors.green,
        //   ),
        // );

        // showDialog<String>(
        //   context: context,
        //   builder: (BuildContext context) => AlertDialog(
        //     title: const Text('AlertDialog Title'),
        //     content: const Text('AlertDialog description'),
        //     actions: <Widget>[
        //       TextButton(
        //         onPressed: () => Navigator.pop(context, 'Cancel'),
        //         child: const Text('Cancel'),
        //       ),
        //       TextButton(
        //         onPressed: () => Navigator.pop(context, 'OK'),
        //         child: const Text('OK'),
        //       ),
        //     ],
        //   ),
        // );
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateProduct(
    int id, {
    String? name,
    String? description,
    double? price,
  }) async {
    try {
      Map<String, dynamic> json = Map();

      json["id"] = id;

      if (name != null) {
        json["name"] = name;
      }

      if (description != null) {
        json["description"] = description;
      }

      if (price != null) {
        json["price"] = price;
      }

      var response = await http.put(
        Uri.parse("http://localhost:8001/products/$id"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(json),
      );

      if (response.statusCode == 200) {
        //code somthing...
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Edit successfully!"),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteProduct({dynamic idDelete}) async {
    try {
      var response = await http.delete(
        Uri.parse("http://localhost:8001/products/$idDelete"),
      );
      if (response.statusCode == 200) {
        //code somthing...
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Delete successfully!"),
            backgroundColor: Colors.green,
          ),
        );
        fetchData();
      } else {
        throw Exception("Failed to delete products");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product")),
      body: ListView.separated(
        itemBuilder: (context, value) {
          GlobalKey<FormState> editingFormKey = GlobalKey();
          TextEditingController productNameController = TextEditingController();
          TextEditingController descriptionController = TextEditingController();
          TextEditingController priceController = TextEditingController();
          return ListTile(
            leading: Text("${value + 1}"),
            title: Text("${products[value].name}"),
            subtitle: Text("${products[value].description}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 15,
              children: [
                Text(
                  "${products[value].price}฿",
                  style: TextStyle(fontSize: 16),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Editing ${products[value].name}"),
                        content: Form(
                          key: editingFormKey,
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              spacing: 20,
                              children: [
                                TextFormField(
                                  controller: productNameController,
                                  decoration: InputDecoration(
                                    labelText: "Product Name",
                                  ),
                                  validator: (value) => (value!.isNotEmpty)
                                      ? null
                                      : "Product Name is empty",
                                ),

                                TextFormField(
                                  controller: descriptionController,
                                  decoration: InputDecoration(
                                    labelText: "Description",
                                  ),
                                  validator: (value) => (value!.isNotEmpty)
                                      ? null
                                      : "Description is empty",
                                ),

                                TextFormField(
                                  controller: priceController,
                                  decoration: InputDecoration(
                                    labelText: "Price",
                                  ),
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
                              ],
                            ),
                          ),
                        ),

                        actions: [
                          TextButton(
                            onPressed: () {
                              if (editingFormKey.currentState!.validate()) {
                                updateProduct(
                                  products[value].id,
                                  name: productNameController.text,
                                  description: descriptionController.text,
                                  price: double.parse(priceController.text),
                                ).then((value) => fetchData());
                                Navigator.pop(context, "OK");
                              }
                            },
                            child: Text("OK"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, "Cancel");
                            },
                            child: Text("Cancel"),
                          ),
                        ],
                        // when completely init form, so fill its default value
                      ),
                    );
                    productNameController.text = products[value].name;
                    descriptionController.text = products[value].description;
                    priceController.text = products[value].price.toString();
                  },
                  child: Text("Edit"),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Are you sure?"),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              deleteProduct(idDelete: products[value].id);
                              Navigator.pop(context);
                            },
                            child: Text("Yes"),
                          ),

                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("No"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text("Delete"),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, value) => Divider(),
        itemCount: products.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProductForm()),
          ).then((value) => fetchData());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
