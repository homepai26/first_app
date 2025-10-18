import 'package:first_app/pages/custom/custom_card.dart';
import 'package:first_app/pages/custom/profile_card.dart';
import 'package:flutter/material.dart';

class ProfileCardScaffold extends StatefulWidget {
  const ProfileCardScaffold({super.key});

  @override
  State<ProfileCardScaffold> createState() => _ProfileCardScaffoldState();
}

class _ProfileCardScaffoldState extends State<ProfileCardScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom Widget")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ProfileCard(
              name: "Warit Saree",
              position: "Uni student",
              email: "homepai26@gmail.com",
              phoneNumber: "8249328492",
              image: Image.asset("my_pic.jpeg", width: 150, height: 150, fit: BoxFit.cover,),
            ),
          ],
        ),
      ),
    );
  }
}
