import 'package:flutter/material.dart';
import 'package:dating/search.dart';
import 'package:dating/matches.dart';
import 'package:get/get.dart';
import 'package:dating/utils/gradient.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',
        style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF0A192F),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: GradientHelper.backgroundGradient,
        ),
        child: Center(
          child: Text(
            'Your Content Here',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF0A192F),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite),
              color: _selectedIndex == 0 ? Color(0xFFF54E6B) : Colors.grey,
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
                Get.to(Matches(),
                transition: Transition.leftToRight,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              color: _selectedIndex == 1 ? Color(0xFFF54E6B) : Colors.grey,
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
                Get.to(Searchh(),
                transition: Transition.leftToRight,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              color: _selectedIndex == 2 ? Color(0xFFF54E6B) : Colors.grey,
              onPressed: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}