import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TabBox",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
    );
  }
}