// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:new_app/components/my_button.dart';
import 'package:new_app/components/my_textfield.dart';
// import 'package:new_app/components/square_tile.dart';
import 'package:new_app/pages/dashboard_page.dart';
import 'package:new_app/pages/login_phone_number.dart';
import 'package:new_app/pages/register_page.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => DashboardPage()),
    );
  }

  // void registerUser() async{
  //   if(emailController)
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              // logo
              const Icon(
                Icons.home,
                size: 100,
              ),

              SizedBox(height: 50),

              // welcome back
              Text(
                'Welcome back!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 26,
                ),
              ),

              SizedBox(height: 25),

              // username textfield
              MyTextField(
                controller: usernameController,
                hintText: 'Username/email',
                obsecureText: false,
                obscureText: false,
              ),

              SizedBox(height: 10),

              // password
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obsecureText: true,
                obscureText: true,
              ),

              SizedBox(height: 10),

              // forgot password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Spacer(), // This widget will take up any available space

                    SizedBox(
                        width: 16), // Adjust the width as needed for spacing

                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 15,
                      ),
                      // onTap: (){               //navigate to forgot_password page
                      //   Navigator.push(
                      //     context,MaterialPageRoute(builder: (context) => ForgotPassword()),
                      //   ),
                      // }
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15),

              // sign in button
              MyButton(
                onTap: () {
                  signUserIn(context);
                },
              ),

              SizedBox(height: 15),
              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              // SizedBox(height: 15),

              // google + facebook sign in button
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: const [
              //     // google button
              //     SquareTile(imagePath: "images/google.png"),
              //     SizedBox(width: 15),

              //     // facebook button
              //     SquareTile(imagePath: "images/fb.png"),
              //   ],
              // ),

             
              // SizedBox(height: 20),

              // Not a member register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(width: 4),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        // navigate to register page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
                      },
                      child: Text(
                        'Register now',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              // login with phone number
              Center(
                child: TextButton(
                  onPressed: () {
                    // Phone number login function
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginPhoneNumber()),
                    );
                  },
                  child: Text(
                    'Login with phone number',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
