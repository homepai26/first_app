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

  // set or clear value, get
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  bool? _isAccept = false;

  String? selectGender;

  String marriedStatus = "Single";

  bool isReceiveNews = false;

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
              controller: _nameController,
              decoration: const InputDecoration(labelText: "First Name"),
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
              controller: _lastNameController,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your last name";
                }
                return null;
              },
            ),

            DropdownButtonFormField(
              value: selectGender,
              decoration: InputDecoration(labelText: "Gender"),
              // array of DropdownMenuItem with value = item and text
              items: ['Male', 'Female', 'Other']
                  .map(
                    (String item) =>
                        DropdownMenuItem(value: item, child: Text(item)),
                  )
                  .toList(),
              onChanged: (String? value) {
                setState(() {
                  selectGender = value;
                });
              },
              validator: (String? value) {
                if (value == null) {
                  return "Please select an option.";
                }
                return null;
              },
            ),

            // apple prefer on switch
            Column(
              children: [
                RadioListTile(
                  value: "Single",
                  title: Text("Single"),
                  groupValue: marriedStatus,
                  onChanged: (String? value) {
                    setState(() {
                      marriedStatus = value.toString();
                    });
                  },
                ),

                RadioListTile(
                  value: "Married",
                  title: Text("Married"),
                  groupValue: marriedStatus,
                  onChanged: (String? value) {
                    setState(() {
                      marriedStatus = value.toString();
                    });
                  },
                ),

                RadioListTile(
                  value: "Separated",
                  title: Text("Seprated"),
                  groupValue: marriedStatus,
                  onChanged: (String? value) {
                    setState(() {
                      marriedStatus = value.toString();
                    });
                  },
                ),
              ],
            ),

            SwitchListTile(
              value: isReceiveNews,
              title: Text("Enable Receive News"),
              onChanged: (value) {
                setState(() {
                  isReceiveNews = value;
                });
              },
            ),

            CheckboxListTile(
              title: Text("Accept Term & Conditions"),
              checkColor: Colors.blue,
              value: _isAccept,
              onChanged: (bool? value) {
                setState(() {
                  _isAccept = value;
                });
              },
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 15,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _nameController.clear();
                    _lastNameController.clear();
                  },
                  child: Text("Clear"),
                ),

                ElevatedButton(
                  onPressed: () {
                    _nameController.text = "Dev";
                    _lastNameController.text = "Ops";
                  },
                  child: Text("Auto input"),
                ),

                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // one type of inputing
                      print("Name: ${_nameController.text}");
                      print("LastName: ${_lastNameController.text}");
                      print("submit form");
                    }
                  },
                  child: Text("Submit"),
                ),
              ],
            ),

            SizedBox(height: 20),

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
