import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dating/utils/displaygender.dart';
import 'package:dating/utils/selectedValuesController.dart';

class GenderSelection extends StatelessWidget {
  final GenderSelectionController _genderSelectionController =
      Get.put(GenderSelectionController());

  void _setSelectedGender(String gender) {
    _genderSelectionController.setSelectedGender(gender);
  }

  void _navigateToDisplayGender(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DisplayGender(selectedGender: _genderSelectionController.selectedGender.value),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFB9245), Color(0xFFF54E6B)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Select Your Gender',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    elevation: 5,
                    shape: CircleBorder(),
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        _setSelectedGender('Male');
                        _navigateToDisplayGender(context);
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: CircleAvatar(
                        backgroundColor: Color(0xFF007AFF),
                        radius: 60,
                        child: Text(
                          'Male',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Material(
                    elevation: 5, 
                    shape: CircleBorder(),
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        // Handle Female selection
                        _setSelectedGender('Female');
                        _navigateToDisplayGender(context);
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: CircleAvatar(
                        backgroundColor: Color(0xFFFF2D55),
                        radius: 60,
                        child: Text(
                          'Female',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
