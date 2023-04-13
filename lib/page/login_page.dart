import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/register_page.dart';
import 'package:tugas_pbm_pertemuan_6/page/home_page.dart';

class LoginPage extends StatelessWidget {
  final String username1;
  final String password1;
  LoginPage({required this.username1, required this.password1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO : bikin tampilan login
      body: Login(
        username: username1,
        password: password1,
      ),
    );
  }
}

class Login extends StatefulWidget {
  final String username;
  final String password;
  Login({required this.username, required this.password});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // _handleLogin() {
  //   final String username2 = _usernameController.text;
  //   final String password2 = _passwordController.text;
  //   if (username2 != null && password2 != null) {
  //     if (username2 == username && password2 == password) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } else {
  //     return false;
  //   }
  // }
  bool _loginSuccessful = false;
  void _login() {
    String username2 = _usernameController.text;
    String password2 = _passwordController.text;

    // Validate the username and password
    if (username2 == username && password2 == password) {
      _loginSuccessful = true;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(username2: username2),
        ),
      );
    } else {
      _loginSuccessful = false;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('password atau username anda salah!'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
              child: Text(
                'LOGIN',
                style: TextStyle(fontSize: 32.0),
              ),
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                hintText: 'Masukkan username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Masukkan password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _login,
              child: Text('login'),
            ),
          ],
        ),
      ),
    );
  }
}
