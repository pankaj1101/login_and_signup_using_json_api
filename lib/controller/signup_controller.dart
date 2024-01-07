import 'package:get/get.dart';
import 'package:sampletest/services/auth_services.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  
  var fullName = ''.obs;
  var email = ''.obs;
  var mobile = ''.obs;
  var password = ''.obs;
  var panNumber = ''.obs;

  void updateFullName(String value) => fullName.value = value;
  void updateEmail(String value) => email.value = value;
  void updateMobile(String value) => mobile.value = value;
  void updatePassword(String value) => password.value = value;
  void updatePanNumber(String value) => panNumber.value = value;

  Future<bool> register() async {
    try {
      bool isRegistered = await AuthService.registerUser(
        fullName: fullName.value,
        email: email.value,
        mobile: mobile.value,
        password: password.value,
        panNumber: panNumber.value,
      );

      return isRegistered;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}
