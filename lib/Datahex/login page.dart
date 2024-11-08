import 'dart:convert';
import 'package:datahex/Datahex/user model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'api posting.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> login() async {
    setState(() {
      _isLoading = true;
    });

    String email = emailController.text;
    String password = passwordController.text;

    try {
      Use userData = await loginUser(email, password);
      if (userData.success) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login succesfull  ${userData.user.fullName}")));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(userData: userData),
          ),
        );
      } else {
        _showError(userData.message);
      }
    } catch (error) {
      print("Error during login: $error");  // Debugging print
      _showError('Login failed');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.tealAccent,
            child: SafeArea(
              child: SizedBox(
                height: 300,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Image.asset("assets/Young Man with Phone copy 1.png"),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ListView(
                children:[ Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 30, top: 50),
                        child: Text("Sign in", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400)),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text("Please enter the details\nbelow to continue"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: "Email ID",
                            prefixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: const Icon(Icons.lock_outline),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 20,right: 20),
                        child: SizedBox(
                          width: 400,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.tealAccent),
                            onPressed: login,
                            child: _isLoading
                                ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            )
                                : const Text("Signin", style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 30, ),
                        child: Text("Don't have an account?")),

                      Padding(
                        padding: const EdgeInsets.only(left: 190,),
                        child:

                          TextButton(
                            onPressed: () {},
                            child: const Text("Signup", style: TextStyle(color: Colors.blue)),
                          ),

                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Use userData;

  HomeScreen({required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, ${userData.user.fullName}'),
      ),
      body: Center(
        child: Text('Hello, ${userData.user.userDisplayName}!'),
      ),
    );
  }
}
