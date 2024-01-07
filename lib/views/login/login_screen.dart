import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampletest/controller/login_controller.dart';
import 'package:sampletest/views/homepage/homepage.dart';
import 'package:sampletest/views/signup/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController()); //login controller...

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to Login Page',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Fill the details to login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                onChanged: controller.updateEmail,
                decoration: const InputDecoration(
                  hintText: 'abc123@gmail.com',
                  labelText: 'Email',
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  errorBorder: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                onChanged: controller.updatePassword,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: '*********',
                  labelText: 'Password',
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  errorBorder: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(),
                  onPressed: () async {
                    bool loggedIn = await controller.checkLogin();
                    if (loggedIn) {
                      Get.offAll(() => const Homepage());

                      Get.snackbar(
                        'Success',
                        'Login Successful',
                        snackPosition: SnackPosition.TOP,
                        duration: const Duration(seconds: 2),
                      );

                      print('Login successful!');
                    } else {
                      Get.snackbar(
                        'Failed',
                        'Login failed!',
                        snackPosition: SnackPosition.TOP,
                        duration: const Duration(seconds: 2),
                      );
                      print('Login failed!');
                    }
                  },
                  child: const Text('Login'),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: TextButton(
                  onPressed: () {
                    Get.to(() => const SignUpScreen());
                  },
                  child: const Text('Click Hear for Signup'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
