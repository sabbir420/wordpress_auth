import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wordpress_auth/app/modules/signup/providers/signup_provider.dart';

class SignupController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var hidePassword = true.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  passwordHide() {
    hidePassword.value = !hidePassword.value;
    update();
  }

  signUp(String name, String email, String password) async {
    try{
      isLoading.value = true;
      update();
      await SignupProvider().signUp(name, email, password).then((value){
        if( value!.code == 200 ){
          Fluttertoast.showToast(
            msg: value.message.toString(),
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.black,
            fontSize: 14.0,
            textColor: Colors.white,
            toastLength: Toast.LENGTH_LONG,
          );
        }
      });
    } catch (e){
      print(e);
    } finally{
      isLoading.value = false;
      update();
      Get.toNamed('/signin');
    }
  }
}
