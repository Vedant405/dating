import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dating/profile.dart';
import 'package:dating/utils/gradient.dart';
import 'package:dating/utils/selectedValuesController.dart';
import 'package:dating/matches.dart';

class Searchh extends StatefulWidget {
  @override
  _SearchhState createState() => _SearchhState();
}

class _SearchhState extends State<Searchh> {
  final GenderSelectionController _genderSelectionController =
      Get.put(GenderSelectionController());

  int _selectedIndex = 1;

  List<String?> _hobbies = [
    null,
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

  List<String?> _clubs = [
    null,
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

  List<String?> _organizations = [
    null,
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

  List<Map<String, String>> _randomPeople = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF0A192F),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: GradientHelper.backgroundGradient,
        ),
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DropdownButtonFormField<String?>(
                value: _genderSelectionController.selectedHobby.value.isNotEmpty
                    ? _genderSelectionController.selectedHobby.value
                    : null,
                hint: Text('Select Hobby'),
                items: _hobbies.map((String? hobby) {
                  return DropdownMenuItem<String?>(
                    value: hobby,
                    child: Text(hobby ?? 'All'),
                  );
                }).toList(),
                onChanged: (String? value) {
                  _genderSelectionController.setSelectedHobby(value!);
                  _updateRandomPeople();
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String?>(
                value: _genderSelectionController.selectedClub.value.isNotEmpty
                    ? _genderSelectionController.selectedClub.value
                    : null,
                hint: Text('Select Club'),
                items: _clubs.map((String? club) {
                  return DropdownMenuItem<String?>(
                    value: club,
                    child: Text(club ?? 'All'),
                  );
                }).toList(),
                onChanged: (String? value) {
                  _genderSelectionController.setSelectedClub(value!);
                  _updateRandomPeople();
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String?>(
                value: _genderSelectionController.selectedOrganization.value.isNotEmpty
                    ? _genderSelectionController.selectedOrganization.value
                    : null,
                hint: Text('Select Organization'),
                items: _organizations.map((String? organization) {
                  return DropdownMenuItem<String?>(
                    value: organization,
                    child: Text(organization ?? 'All'),
                  );
                }).toList(),
                onChanged: (String? value) {
                  _genderSelectionController.setSelectedOrganization(value!);
                  _updateRandomPeople();
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _updateRandomPeople();
                },
                child: Text('Search Matches'),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount: _randomPeople.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Color.fromARGB(52, 0, 0, 0),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          title: Text(
                            _randomPeople[index]['name'] ?? '',
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hobby: ${_randomPeople[index]['hobby'] ?? 'Not specified'}',
                                style: TextStyle(color: Color.fromARGB(255, 198, 198, 198)),
                              ),
                              Text(
                                'Club: ${_randomPeople[index]['club'] ?? 'Not specified'}',
                                style: TextStyle(color: Color.fromARGB(255, 198, 198, 198)),
                              ),
                              Text(
                                'Organization: ${_randomPeople[index]['organization'] ?? 'Not specified'}',
                                style: TextStyle(color: Color.fromARGB(255, 198, 198, 198)),
                              ),
                            ],
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                            },
                            child: Text('Request'),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
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
                Get.to(() => Matches(), transition: Transition.leftToRight);
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              color: _selectedIndex == 1 ? Color(0xFFF54E6B) : Colors.grey,
              onPressed: () {
                // Handle Search button press
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              color: _selectedIndex == 2 ? Color(0xFFF54E6B) : Colors.grey,
              onPressed: () {
                setState(() {
                  _selectedIndex = 2;
                });
                Get.to(() => Profile(), transition: Transition.rightToLeft);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _updateRandomPeople() {
    _randomPeople = _generateRandomPeople();
    setState(() {});
  }

  List<Map<String, String>> _generateRandomPeople() {
  List<Map<String, String>> result = [];

    List<Map<String, String>> randomPeople = [
      {
    'name': 'John Doe',
    'gender': 'Male',
    'hobby': 'Reading',
    'club': 'Book Club',
    'organization': 'Red Cross',
  },
  {
    'name': 'Jane Smith',
    'gender': 'Female',
    'hobby': 'Reading',
    'club': 'Book Club',
    'organization': 'Red Cross',
  },
  {
    'name': 'Alex Johnson',
    'gender': 'Male',
    'hobby': 'Traveling',
    'club': 'Running Club',
    'organization': 'UNICEF',
  },
  {
    'name': 'Emily Brown',
    'gender': 'Female',
    'hobby': 'Cooking',
    'club': 'Cooking Club',
    'organization': 'Greenpeace',
  },
  {
    'name': 'Michael Wilson',
    'gender': 'Male',
    'hobby': 'Sports',
    'club': 'Running Club',
    'organization': 'Amnesty International',
  },
  {
    'name': 'Olivia Garcia',
    'gender': 'Female',
    'hobby': 'Painting',
    'club': 'Art Club',
    'organization': 'Habitat for Humanity',
  },
  {
    'name': 'William Martinez',
    'gender': 'Male',
    'hobby': 'Dancing',
    'club': 'Dance Club',
    'organization': 'World Wildlife Fund',
  },
  {
    'name': 'Sophia Anderson',
    'gender': 'Female',
    'hobby': 'Music',
    'club': 'Music Club',
    'organization': 'American Cancer Society',
  },
  {
    'name': 'Ethan Thomas',
    'gender': 'Male',
    'hobby': 'Photography',
    'club': 'Photography Club',
    'organization': 'Doctors Without Borders',
  },
  {
    'name': 'Isabella Perez',
    'gender': 'Female',
    'hobby': 'Writing',
    'club': 'Writing Club',
    'organization': 'Feeding America',
  },
  {
    'name': 'James Lee',
    'gender': 'Male',
    'hobby': 'Reading',
    'club': 'Book Club',
    'organization': 'Red Cross',
  },
  {
    'name': 'Ava Gonzalez',
    'gender': 'Female',
    'hobby': 'Traveling',
    'club': 'Running Club',
    'organization': 'UNICEF',
  },
  {
    'name': 'Benjamin Rodriguez',
    'gender': 'Male',
    'hobby': 'Cooking',
    'club': 'Cooking Club',
    'organization': 'Greenpeace',
  },
  {
    'name': 'Charlotte Wilson',
    'gender': 'Female',
    'hobby': 'Sports',
    'club': 'Running Club',
    'organization': 'Amnesty International',
  },
  {
    'name': 'Daniel Martinez',
    'gender': 'Male',
    'hobby': 'Painting',
    'club': 'Art Club',
    'organization': 'Habitat for Humanity',
  },
  {
    'name': 'Emma Brown',
    'gender': 'Female',
    'hobby': 'Dancing',
    'club': 'Dance Club',
    'organization': 'World Wildlife Fund',
  },
  {
    'name': 'Gabriel Johnson',
    'gender': 'Male',
    'hobby': 'Music',
    'club': 'Music Club',
    'organization': 'American Cancer Society',
  },
  {
    'name': 'Hannah Garcia',
    'gender': 'Female',
    'hobby': 'Photography',
    'club': 'Photography Club',
    'organization': 'Doctors Without Borders',
  },
  {
    'name': 'Ian Thomas',
    'gender': 'Male',
    'hobby': 'Writing',
    'club': 'Writing Club',
    'organization': 'Feeding America',
  },
  {
    'name': 'Julia Perez',
    'gender': 'Female',
    'hobby': 'Reading',
    'club': 'Book Club',
    'organization': 'Red Cross',
  },
  {
    'name': 'Kevin Lee',
    'gender': 'Male',
    'hobby': 'Traveling',
    'club': 'Running Club',
    'organization': 'UNICEF',
  },
  {
    'name': 'Lily Gonzalez',
    'gender': 'Female',
    'hobby': 'Cooking',
    'club': 'Cooking Club',
    'organization': 'Greenpeace',
  },
  {
    'name': 'Mason Wilson',
    'gender': 'Male',
    'hobby': 'Sports',
    'club': 'Running Club',
    'organization': 'Amnesty International',
  },
  {
    'name': 'Nora Martinez',
    'gender': 'Female',
    'hobby': 'Painting',
    'club': 'Art Club',
    'organization': 'Habitat for Humanity',
  },
  {
    'name': 'Oliver Brown',
    'gender': 'Male',
    'hobby': 'Dancing',
    'club': 'Dance Club',
    'organization': 'World Wildlife Fund',
  },
  {
    'name': 'Penelope Johnson',
    'gender': 'Female',
    'hobby': 'Music',
    'club': 'Music Club',
    'organization': 'American Cancer Society',
  },
  {
    'name': 'Quinn Garcia',
    'gender': 'Male',
    'hobby': 'Photography',
    'club': 'Photography Club',
    'organization': 'Doctors Without Borders',
  },
  {
    'name': 'Rachel Thomas',
    'gender': 'Female',
    'hobby': 'Writing',
    'club': 'Writing Club',
    'organization': 'Feeding America',
  },
  {
    'name': 'Samuel Perez',
    'gender': 'Male',
    'hobby': 'Reading',
    'club': 'Book Club',
    'organization': 'Red Cross',
  },
  {
    'name': 'Taylor Lee',
    'gender': 'Female',
    'hobby': 'Traveling',
    'club': 'Running Club',
    'organization': 'UNICEF',
  },
  {
    'name': 'Ulysses Gonzalez',
    'gender': 'Male',
    'hobby': 'Cooking',
    'club': 'Cooking Club',
    'organization': 'Greenpeace',
  },
  {
    'name': 'Victoria Wilson',
    'gender': 'Female',
    'hobby': 'Sports',
    'club': 'Running Club',
    'organization': 'Amnesty International',
  },
];


    for (var person in randomPeople) {
      bool addPerson = true;

      if (_genderSelectionController.selectedGender.value.isNotEmpty &&
          person['gender'] != _genderSelectionController.selectedGender.value) {
        addPerson = false;
      }

      if (_genderSelectionController.selectedHobby.value != null &&
          _genderSelectionController.selectedHobby.value.isNotEmpty &&
          person['hobby'] != _genderSelectionController.selectedHobby.value) {
        addPerson = false;
      }

      if (_genderSelectionController.selectedClub.value != null &&
          _genderSelectionController.selectedClub.value.isNotEmpty &&
          person['club'] != _genderSelectionController.selectedClub.value) {
        addPerson = false;
      }

      if (_genderSelectionController.selectedOrganization.value != null &&
          _genderSelectionController.selectedOrganization.value.isNotEmpty &&
          person['organization'] !=
              _genderSelectionController.selectedOrganization.value) {
        addPerson = false;
      }

      if (addPerson) {
        result.add(person);
      }
    }

    return result;
  }
}