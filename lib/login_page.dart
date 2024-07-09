import 'package:flutter/material.dart';
import 'profile_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 150,
            child: Image.asset(
              'assets/images/threadslogo.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Login with your Instagram Account',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 300,
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Nama Pengguna, Telepon, atau Email',
                border: OutlineInputBorder(),
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 300,
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Kata Sandi',
                border: OutlineInputBorder(),
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 300,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                String username = usernameController.text;
                print('Username: $username');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(username: username),
                  ),
                );
              },
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
            ),
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {},
            child: Text(
              'Lupa Kata Sandi?',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 10),
          Divider(
            color: Colors.white,
          ),
          SizedBox(height: 10),
          Container(
            width: 300,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/insta.jpg',
                  height: 30,
                  width: 30,
                ),
                SizedBox(width: 10),
                Text(
                  'Lanjutkan dengan Instagram',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
