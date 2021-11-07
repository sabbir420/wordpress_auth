import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wordpress_auth/app/modules/signin/model/signin_model.dart';
import 'package:wordpress_auth/app/modules/signup/model/sign_up_error_model.dart';
import 'package:wordpress_auth/app/utils/api_link.dart';

class SigninProvider extends GetConnect {
  Future<dynamic> signIn(String username, String password) async {
    var url =
        Uri.parse('${ApiLink.API_LINK}wp-json/jwt-auth/v1/token?username=$username&password=$password');

    final response = await http.post(url,
        headers: {"Content-Type": "application/x-www-form-urlencoded"});

    print(response.statusCode);
    var jsonData = json.decode(response.body);
    if (response.statusCode == 200) {
      return SigninModel.fromJson(jsonData);
    } else if (response.statusCode == 403){
      return SignupErrorModel.fromJson(jsonData);
    } else {
      return null;
    }
  }
}
