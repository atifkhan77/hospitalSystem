import 'package:devhawks/credential/admin.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final Uri _url = Uri.parse('https://devhawks.org/');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  void _login(String email, String password, BuildContext context) {
    // Replace with your actual allowed credentials
    final allowedEmail = 'dept.camh@medicalemr.com';
    final allowedPassword = 'childadol';
    print('Email: $email');
    print('Password: $password');

    if (email == allowedEmail && password == allowedPassword) {
      // Successful login, you can navigate to another screen or perform an action
      print('Login successful');
    } else {
      // Invalid credentials, show an error message
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Login Failed'),
          content: const Text('Invalid email or password. Please try again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.25,
                      top: height * 0.2,
                      right: width * 0.25),
                  child: const Text(
                    'Login to your account',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(49, 140, 231, 1),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.09),
                SizedBox(
                  width: width * 0.5,
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.05),
                SizedBox(
                  width: width * 0.5,
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                _login(emailController.text, passwordController.text, context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(232, 230, 51, 1),
                  borderRadius:
                      BorderRadius.circular(15.0), // Adjust the value as needed
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.15,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: height * 0.3,
                    color: Colors.blue,
                    width: width * 1,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '© 2023 Copyright - Developed By',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                            onPressed: _launchUrl,
                            child: const Text(
                              'DewHawks',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
