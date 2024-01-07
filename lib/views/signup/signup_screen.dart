import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampletest/controller/signup_controller.dart';
import 'package:sampletest/views/homepage/homepage.dart';
import 'package:sampletest/views/login/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              const Text(
                'Welcome To Signup Page',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Enter the details to Signup',
              ),
              const SizedBox(height: 20),
              TextFormField(
                onChanged: controller.updateFullName,
                decoration: const InputDecoration(
                  hintText: 'Pankaj Ram',
                  labelText: 'Full Name',
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  errorBorder: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
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
                onChanged: controller.updateMobile,
                decoration: const InputDecoration(
                  hintText: '123456789',
                  labelText: 'Mobile',
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  errorBorder: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                onChanged: controller.updatePassword,
                decoration: const InputDecoration(
                  hintText: '********',
                  labelText: 'Password',
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  errorBorder: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                onChanged: controller.updatePanNumber,
                decoration: const InputDecoration(
                  hintText: 'BCkP3452M',
                  labelText: 'Pan Number',
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  errorBorder: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  bool registered = await controller.register();
                  if (registered) {
                    Get.snackbar(
                      'Success',
                      'Registration successful!',
                      snackPosition: SnackPosition.TOP,
                      duration: const Duration(seconds: 2),
                    );
                    Get.offAll(() => const Homepage());
                    print('Registration successful!');
                  } else {
                    Get.snackbar(
                      'Failed',
                      'Registration failed!',
                      snackPosition: SnackPosition.TOP,
                      duration: const Duration(seconds: 2),
                    );
                    print('Registration failed!');
                  }
                },
                child: const Text('Signup'),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Get.to(() => const LoginScreen());
                },
                child: const Text('Click Hear for Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
