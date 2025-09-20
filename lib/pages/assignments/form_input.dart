import 'package:flutter/material.dart';

class FormInput extends StatefulWidget {
  const FormInput({super.key});

  @override
  State<FormInput> createState() => _FormInputState();
}

// final exam
class _FormInputState extends State<FormInput> {
  String name = "";
  String email = "";

  String? gender = "Male";

  String? selectedProvice;

  bool? _isAccept = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registion Form")),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(label: Text("Full Name")),
              controller: _fullNameController,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your first name";
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(label: Text("Email")),
              controller: _emailController,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your first name";
                }
                return null;
              },
            ),

            Column(
              children: [
                RadioListTile(
                  value: "Male",
                  groupValue: gender,
                  title: Text("Male"),
                  onChanged: (value) => {
                    setState(() {
                      gender = value;
                    }),
                  },
                ),
                RadioListTile(
                  value: "Female",
                  groupValue: gender,
                  title: Text("Female"),
                  onChanged: (value) => {
                    setState(() {
                      gender = value;
                    }),
                  },
                ),
              ],
            ),

            DropdownButtonFormField(
              value: selectedProvice,
              decoration: InputDecoration(labelText: "Provice"),
              // array of DropdownMenuItem with value = item and text
              items: ['Bangkok', 'Ching Mai', 'Phuket']
                  .map(
                    (String item) =>
                        DropdownMenuItem(value: item, child: Text(item)),
                  )
                  .toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedProvice = value;
                });
              },
              validator: (String? value) {
                if (value == null) {
                  return "Please select an option.";
                }
                return null;
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

            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  print("Sucess form!");
                }
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
