import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wordpress_auth/app/modules/signin/providers/signin_provider.dart';

class SigninController extends GetxController {
  //final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final localStorage = GetStorage();
  var isLoading = false.obs;
  var hidePassword = true.obs;

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

  signIn(String name, String password) async {
    try{
      isLoading.value = true;
      update();
      await SigninProvider().signIn(name, password).then((value){
        if( value.token != null ){
          localStorage.write('token', value.token);
          Get.toNamed('/home');
        } else {
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
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
      update();
    }
  }
}
