import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    firstNameController.text = "Falak";
    lastNameController.text = "Sabbir";
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
