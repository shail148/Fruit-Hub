import 'package:flutter/material.dart';
import 'package:fruit_hub/component/form_build_level.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController pwdcontroller = TextEditingController();
  final TextEditingController cpwdcontroller = TextEditingController();

  @override
  void dispose() {
    namecontroller.dispose();
    emailcontroller.dispose();
    pwdcontroller.dispose();
    cpwdcontroller.dispose();
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

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) return 'Please confirm your password';
    if (value != pwdcontroller.text) return 'Passwords do not match';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              height: MediaQuery.of(context).size.height / 3,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFFFA451),
              ),
              child: Image.asset(
                'assets/images/welcomeimg.png',
                fit: BoxFit.fitHeight,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormBuildLevel("Enter Name"),
                    TextFormField(
                      controller: namecontroller,
                      validator: (value) =>
                      value == null || value.isEmpty ? 'Please enter your name' : null,
                      decoration: customInputDecoration('Enter Name'),
                    ),
                    FormBuildLevel("Enter Email"),
                    TextFormField(
                      controller: emailcontroller,
                      validator: _validateEmail,
                      decoration: customInputDecoration('Enter Email'),
                    ),
                    FormBuildLevel("Enter Password"),
                    TextFormField(
                      controller: pwdcontroller,
                      obscureText: true,
                      validator: _validatePassword,
                      decoration: customInputDecoration('Enter Password'),
                    ),
                    FormBuildLevel("Enter Confirm Password"),
                    TextFormField(
                      controller: cpwdcontroller,
                      obscureText: true,
                      validator: _validateConfirmPassword,
                      decoration: customInputDecoration('Enter Confirm Password'),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final name = namecontroller.text.trim();
                            final email = emailcontroller.text.trim();
                            final password = pwdcontroller.text.trim();

                            // Proceed to next step (e.g. API call or navigation)
                            print("Name: $name, Email: $email, Password: $password");

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Account created successfully')),
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
                          'Create Account',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        const Text("Already have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login_screen');
                          },
                          child: const Text("Login Now", style: TextStyle(color: Colors.black)),
                        )
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
