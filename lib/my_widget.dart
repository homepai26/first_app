import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> listProduct = ['Apple', 'Samsung', 'Oppo', 'Blackberry'];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('ListView')),
      body: ListView.separated(
        itemCount: listProduct.length,
        separatorBuilder: (context, index) {
          //return Divider();
          return Container(height: 5, width: double.infinity, color: Colors.amber, margin: EdgeInsets.symmetric(horizontal: 20),);
        },
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text('$index'),
            title: Text(listProduct[index]),
            trailing: Icon(Icons.edit),
            subtitle: Text('jsifjoejfie...'),

            // height: 400,
            // width: double.infinity,
            // color: Colors.red,
            // child: Text('Item ${listProduct[index]}'),
          );
        },
      ),
    );
  }
}
