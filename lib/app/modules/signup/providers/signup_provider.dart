import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:wordpress_auth/app/modules/signup/model/sign_up_error_model.dart';
import 'package:wordpress_auth/app/modules/signup/model/signup_model.dart';
import 'package:wordpress_auth/app/utils/api_link.dart';

class SignupProvider extends GetConnect {
  Future<dynamic> signUp(String username, String email, String password) async {
    var url =
        Uri.parse('${ApiLink.API_LINK}wp-json/wp/v2/users/register');
    Map<String, dynamic> body = {
      "username": username,
      "email": email,
      "password": password,
    };

    final response = await http.post(url,
        body: json.encode(body), headers: {"Content-Type": "application/json"});

    print(response.statusCode);
    var jsonData = json.decode(response.body);
    if (response.statusCode == 200) {
      return SignupModel.fromJson(jsonData);
    } else if (response.statusCode == 406){
      return SignupErrorModel.fromJson(jsonData);
    } else {
      return null;
    }
  }
}
