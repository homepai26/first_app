import 'package:flutter/material.dart';

class FormExpample1 extends StatefulWidget {
  const FormExpample1({super.key});

  @override
  State<FormExpample1> createState() => _FormExpample1State();
}

class _FormExpample1State extends State<FormExpample1> {
  String firstName = "";
  String lastName = "";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // or final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Expample")),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            // data or passwd
            TextFormField(
              decoration: const InputDecoration(labelText: "First Name"),
              onChanged: (value) {
                print("name: $value");
                setState(() {
                  firstName = value;
                });
              },
              // work with Form, formkey so it can validate
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your first name";
                }
                return null;
              },
            ),

            TextFormField(
              decoration: const InputDecoration(labelText: "Last Name"),
              onChanged: (value) {
                print("lastname: $value");
                setState(() {
                  lastName = value;
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your last name";
                }
              },
            ),

            ElevatedButton(onPressed: () {
              if (formKey.currentState!.validate()) {
                print("submit form");
              }
            }, child: Text("Submit")),

            SizedBox(height: 20,),

            Container(
              color: Colors.green,
              child: Text(
                "Name : $firstName $lastName",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
