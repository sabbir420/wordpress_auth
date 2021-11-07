import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wordpress_auth/app/modules/home/model/current_user_model.dart';
import 'package:wordpress_auth/app/utils/api_link.dart';

class CurrentUserProvider extends GetConnect {
  Future<CurrentUserModel?> getCurrentUser(String token) async {
    var url =
    Uri.parse('${ApiLink.API_LINK}wp-json/wp/v2/users/me');

    final response = await http.get(url,
         headers: {"Content-Type": "application/json", "Authorization" : "Bearer $token"});

    if (response.statusCode == 200) {
      String responseString = response.body;
      var jsonData = json.decode(responseString);
      return CurrentUserModel.fromJson(jsonData);
    } else {
      return null;
    }
  }
}
