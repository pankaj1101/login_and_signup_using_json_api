import 'package:http/http.dart' as http;

class AuthService {
  // Login...
  static Future<bool> login(String email, String password) async {
    const apiUrl = 'login_api_link';

    final response = await http.post(Uri.parse(apiUrl), body: {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  // Signup...
  static Future<bool> registerUser({
    required String fullName,
    required String email,
    required String mobile,
    required String password,
    required String panNumber,
  }) async {
    try {
      const apiUrl = 'signup_api_link';

      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          "name": fullName,
          "email": email,
          "mobile": mobile,
          "password": password,
          "pan_number": panNumber,
          "state_id": "1",
          "type": "1"
        },
      );

      if (response.statusCode == 200) {
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
