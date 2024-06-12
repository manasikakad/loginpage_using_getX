import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade50,
        leading: Icon(Icons.arrow_back_ios_new),
        title: const Text(
          "Home Page",
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
        ),
      ),
      body: Center(
        child: Text("Home Page"),
      ),
    );
  }
}
