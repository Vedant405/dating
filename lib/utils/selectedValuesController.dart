import 'package:get/get.dart';

class GenderSelectionController extends GetxController {
  var selectedGender = RxString('');
  var selectedHobby = RxString('');
  var selectedClub = RxString('');
  var selectedOrganization = RxString('');

  void setSelectedGender(String gender) {
    selectedGender.value = gender;
  }

  void setSelectedHobby(String hobby) {
    selectedHobby.value = hobby;
  }

  void setSelectedClub(String club) {
    selectedClub.value = club;
  }

  void setSelectedOrganization(String organization) {
    selectedOrganization.value = organization;
  }
}
