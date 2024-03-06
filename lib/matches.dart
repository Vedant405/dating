import 'package:flutter/material.dart';
import 'package:dating/search.dart';
import 'package:dating/profile.dart';
import 'package:get/get.dart';
import 'package:dating/utils/gradient.dart';

class Matches extends StatefulWidget {
  @override
  _MatchesState createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  int _selectedIndex = 0;

  void _showRequestedPersonDetails(Map<String, String> person) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Requested Person Details'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Name: ${person['name']}'),
                Text('Gender: ${person['gender']}'),
                Text('Hobby: ${person['hobby']}'),
                Text('Club: ${person['club']}'),
                Text('Organization: ${person['organization']}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Matches',
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
          child: Text("No matches yet...", style: TextStyle(fontSize: 20),),
          
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
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              color: _selectedIndex == 1 ? Color(0xFFF54E6B) : Colors.grey, 
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
                Get.to(Searchh(), transition: Transition.rightToLeft);
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              color: _selectedIndex == 2 ? Color(0xFFF54E6B) : Colors.grey,
              onPressed: () {
                setState(() {
                  _selectedIndex = 2;
                });
                Get.to(Profile(), transition: Transition.rightToLeft);
              },
            ),
          ],
        ),
      ),
    );
  }
}
