import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wordpress_auth/app/modules/home/providers/current_user_provider.dart';
import 'package:wordpress_auth/app/modules/home/providers/update_user_provider.dart';

class HomeController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final localStorage = GetStorage();
  var isLoading = false.obs;
  var userID = 0.obs;
  var username = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getUserDetails(localStorage.read('token'));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getUserDetails(String token) async {
    try{
      isLoading.value = true;
      update();
      await CurrentUserProvider().getCurrentUser(token).then((value){
        userID.value = value!.id;
        username.value = value.name;
        update();
      });
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
      update();
    }
  }

  updateUser(String token, int id, String firstName, String lastName) async {
    try{
      isLoading.value = true;
      update();
      await UpdateUserProvider().updateCurrentUser(token, userID.value, firstName, lastName).then((value){
        firstNameController.text = value!.firstName;
        lastNameController.text = value.lastName;
        Fluttertoast.showToast(
          msg: "Your profile has been updated!",
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          fontSize: 14.0,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
        );
      });
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
      update();
    }
  }
}
