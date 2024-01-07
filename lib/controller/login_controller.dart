import 'package:get/get.dart';
import 'package:sampletest/services/auth_services.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  var email = ''.obs;
  var password = ''.obs;

  void updateEmail(String value) => email.value = value;
  void updatePassword(String value) => password.value = value;

  Future<bool> checkLogin() async {
    print('line 15');
    try {
      bool isLoggedIn = await AuthService.login(email.value, password.value);
      if (isLoggedIn) {
        return true; 
      } else {
        return false; 
      }
    } catch (e) {
      print('Error: $e');
      return false; 
    }
  }
}
