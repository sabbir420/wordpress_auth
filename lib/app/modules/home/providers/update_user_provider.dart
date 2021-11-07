import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:wordpress_auth/app/modules/home/model/update_user_model.dart';
import 'package:wordpress_auth/app/utils/api_link.dart';

class UpdateUserProvider extends GetConnect {
  Future<UpdateUserModel?> updateCurrentUser(String token, int id, String firstName, String lastName) async {
    var url =
    Uri.parse('${ApiLink.API_LINK}wp-json/wp/v2/users/$id');
    Map<String, dynamic> body = {
      "first_name": firstName,
      "last_name": lastName,
    };

    final response = await http.patch(url,
      body: json.encode(body), headers: {"Content-Type": "application/json", "Authorization" : "Bearer $token"});

    if (response.statusCode == 200) {
      String responseString = response.body;
      var jsonData = json.decode(responseString);
      return UpdateUserModel.fromJson(jsonData);
    } else {
      return null;
    }
  }
}
