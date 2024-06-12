import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _HomePageState();
}

class _HomePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade50,
        leading: Icon(Icons.arrow_back_ios_new),
        title: const Text(
          "Profile Page",
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
        ),
      ),
      body: Center(
        child: Text("Profile Page"),
      ),
    );
  }
}
