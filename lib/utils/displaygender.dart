import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dating/matches.dart';
import 'package:dating/utils/selectedValuesController.dart';

class DisplayGender extends StatelessWidget {
  final String selectedGender;

  DisplayGender({required this.selectedGender});

  final GenderSelectionController _genderSelectionController =
      Get.put(GenderSelectionController());

  List<String> _hobbies = [
    'Reading',
    'Traveling',
    'Cooking',
    'Sports',
    'Gardening',
    'Painting',
    'Dancing',
    'Music',
    'Photography',
    'Writing',
  ];

  List<String> _clubs = [
    'Book Club',
    'Chess Club',
    'Running Club',
    'Art Club',
    'Cooking Club',
    'Gardening Club',
    'Dance Club',
    'Music Club',
    'Photography Club',
    'Writing Club',
  ];

  List<String> _organizations = [
    'Red Cross',
    'UNICEF',
    'Greenpeace',
    'Amnesty International',
    'Habitat for Humanity',
    'World Wildlife Fund',
    'American Cancer Society',
    'Doctors Without Borders',
    'Feeding America',
    'The Nature Conservancy',
  ];

  @override
  Widget build(BuildContext context) {
    Color backgroundColor =
        selectedGender == 'Male' ? Color(0xFF007AFF) : Color(0xFFFF2D55);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DropdownButtonFormField<String>(
                  value: _genderSelectionController.selectedHobby.value.isNotEmpty
                      ? _genderSelectionController.selectedHobby.value
                      : null, 
                  hint: Text('Select Hobby'),
                  items: _hobbies.map((String hobby) {
                    return DropdownMenuItem<String>(
                      value: hobby,
                      child: Text(hobby),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    _genderSelectionController.setSelectedHobby(value!);
                  },
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: _genderSelectionController.selectedClub.value.isNotEmpty
                      ? _genderSelectionController.selectedClub.value
                      : null, 
                  hint: Text('Select Club'),
                  items: _clubs.map((String club) {
                    return DropdownMenuItem<String>(
                      value: club,
                      child: Text(club),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    _genderSelectionController.setSelectedClub(value!);
                  },
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: _genderSelectionController.selectedOrganization.value.isNotEmpty
                      ? _genderSelectionController.selectedOrganization.value
                      : null,
                  hint: Text('Select Organization'),
                  items: _organizations.map((String organization) {
                    return DropdownMenuItem<String>(
                      value: organization,
                      child: Text(organization),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    _genderSelectionController.setSelectedOrganization(value!);
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    print('Selected Hobby: ${_genderSelectionController.selectedHobby.value}');
                    print('Selected Club: ${_genderSelectionController.selectedClub.value}');
                    print('Selected Organization: ${_genderSelectionController.selectedOrganization.value}');

                    Get.to(() => Matches());
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
