import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FacebookLoginButton extends StatelessWidget {
  final Function() onPressed;

  const FacebookLoginButton({super.key, required this.onPressed});
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        // primary: Colors.blue, // Set the button color
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/facebook_icon.svg', // Replace with the correct path to your Facebook SVG icon
            height: 24, // Adjust the height as needed
            width: 24, // Adjust the width as needed
          ),
          const SizedBox(width: 10), // Adjust spacing as needed
          const Text(
            'Login with Facebook',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
