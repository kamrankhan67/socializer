import 'package:flutter/material.dart';
import 'package:socializer/features/home/presentation/components/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        
        centerTitle: true,
        title: Text("Home Page"),
        
      ),
      body: Container(),
    );
  }
}
