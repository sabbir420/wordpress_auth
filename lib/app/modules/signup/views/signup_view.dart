import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
      ),
      body: Obx(() => controller.isLoading.value == false
      ? Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: controller.usernameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null) {
                        return "Username is required";
                      } else {
                        return null;
                      }
                    }
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 25.0)),
                  TextFormField(
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null) {
                        return "Email address is required";
                      } else {
                        if (!GetUtils.isEmail(value)){
                          return "Email is not valid";
                        } else {
                          return null;
                        }
                      }
                    }
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 25.0)),
                  TextFormField(
                    controller: controller.passwordController,
                    obscureText: controller.hidePassword.value,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null) {
                        return "Password is required";
                      } else {
                        return null;
                      }
                    }
                  )
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 35.0)),
            Container(
              height: 60,
              child: ElevatedButton(
                onPressed: (){
                  if (controller.formKey.currentState!.validate()) {
                    final name = controller.usernameController.text;
                    final email = controller.emailController.text;
                    final password = controller.passwordController.text;
                    controller.signUp(
                        name,
                        email,
                        password);
                  }
                },
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  )
                ),
                child: const Text("Signup"),
              ),
            )
          ],
        ),
      )
      : Center(
        child: CircularProgressIndicator(),
      ))
    );
  }
}
