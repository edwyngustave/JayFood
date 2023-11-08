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
      appBar: AppBar(
        //Appbar height
        toolbarHeight: 30,
        title: Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text('JayFood', style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
              ),),
        ),),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            
          ]
        ),
      ),
    );
  }
}