import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 400,
              height: 600,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  //space
                  SizedBox(height: 25),

                  ClipOval(
                    child: Image.asset(
                      'my_pic.jpeg',
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),

                  //space
                  SizedBox(height: 10),

                  Text(
                    'วฤทธิ์ สาลี',
                    style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                  ),

                  Text('660710099', style: TextStyle(fontSize: 20)),

                  Text(
                    'Computer Science',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 20),
                  ),

                  Expanded(child: SizedBox(), flex: 3),

                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                      'ศึกษาอยู่ที่มหาวิทยาลัยศิลปากร วิทยาเขตสนามจันทร์ ขณะนี้กำลังศึกษา Mobile Development ช่วงนี้ฝนตกบ่อยตอนกลับบ้านเลยไม่ชอบฝนเท่าไหร่',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                      softWrap: true,
                      //textWidthBasis: TextWidthBasis.longestLine,
                    ),
                  ),

                  SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          launchUrl(Uri.parse('https://github.com/homepai26'));
                        },
                        child: Image.network(
                          'https://github.githubassets.com/assets/GitHub-Mark-ea2971cee799.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          launchUrl(Uri.parse('email://saree_w@silpakorn.edu'));
                        },
                        child: Icon(Icons.email, size: 50),
                      ),
                    ],
                  ),
                  Expanded(child: SizedBox(), flex: 7),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
