import 'package:flutter/material.dart';
import 'package:fruit_hub/component/form_build_level.dart'; // Your custom label & input decoration

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your email';
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) return 'Enter a valid email';
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Please enter a password';
    if (value.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top image section
            Container(
              padding: EdgeInsets.all(8),
              height: MediaQuery.of(context).size.height / 3,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFFFA451),
              ),
              child: Image.asset(
                'assets/images/welcomeimg.png',
                width: 50,
                height: 50,
                fit: BoxFit.fitHeight,
              ),
            ),

            const SizedBox(height: 20),

            // Login Form
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormBuildLevel("Enter Email"),
                    TextFormField(
                      controller: emailcontroller,
                      validator: _validateEmail,
                      decoration: customInputDecoration("Enter Email"),
                    ),

                    FormBuildLevel("Enter Password"),
                    TextFormField(
                      controller: passwordcontroller,
                      validator: _validatePassword,
                      obscureText: true, // 🔒 hides the password
                      decoration: customInputDecoration("Enter Password"),
                    ),

                    const SizedBox(height: 20),

                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Login Successfully"),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFA451),
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Sign up option
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
