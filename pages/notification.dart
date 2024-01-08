import 'package:flutter/material.dart';

class MyNotification extends StatelessWidget {
  const MyNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.indigo[400],
      ),
      body: const Center(
        child: Text('Welcome to  Notifications'),
      ),
    );
  }
}
