import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade50,
        leading: Icon(Icons.arrow_back_ios_new),
        title: const Text(
          "Settings Page",
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
        ),
      ),
      body: Center(
        child: Text("Settings Page"),
      ),
    );
  }
}
