// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields

import 'package:authentications/page/login.dart';
import 'package:authentications/page/register.dart';
import 'package:flutter/material.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  int currentIndex = 0;
  List _children = [
    RegisterPage(),
    LoginPage(),
  ];
  void _onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        toolbarHeight: 150,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              gradient: LinearGradient(
                  colors: [Colors.indigo.shade800, Colors.indigo.shade500],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        bottom: TabBar(
          onTap: _onTap,
          controller: controller,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
          indicator: UnderlineTabIndicator(),
          labelStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          tabs: [
            Tab(text: "Sign Up"),
            Tab(text: "Sign In"),
          ],
        ),
      ),
      body: _children[currentIndex],
    );
  }
}
