import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String position;
  final String email;
  final String phoneNumber;
  final Image image;
  const ProfileCard({
    super.key,
    required this.name,
    required this.position,
    required this.email,
    required this.phoneNumber,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(100, 0, 100, 0),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white70,
        boxShadow: [
          BoxShadow(color: Colors.grey.withAlpha(127), offset: Offset(4, 8)),
        ],
        borderRadius: BorderRadius.circular(100),
      ),
      child: Column(
        children: [
          ClipOval(child: image),
          SizedBox(height: 10,),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Text(position, style: TextStyle(color: Colors.grey)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5,
            children: [
              Icon(Icons.email, color: Colors.blue),
              Text(email),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5,
            children: [
              Icon(Icons.phone, color: Colors.green),
              Text(phoneNumber),
            ],
          ),
        ],
      ),
    );
  }
}
