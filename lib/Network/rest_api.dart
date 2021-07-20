import 'package:http/http.dart' as http;
import 'package:smart_news/Model/LoginModel.dart';
import 'package:smart_news/Utils/constant.dart';

class CallAPI {

  // กำหนด header ของ api
  _setHeaders() => {
    'Content-Type':'application/json',
    'Accept': 'application/json'
  };

  // กำหนด header สำหรับ Auth
  _setHeadersAuth() => {
    'Content-Type':'application/x-www-form-urlencoded'
  };

  // Login Auth
  Future<bool> loginCustomer(String username, String password) async {

    var response = await http.post(
      Uri.parse(baseAPIURL+'jwt-auth/v1/token'),
      headers: _setHeadersAuth(),
      body: {
        "username": username,
        "password": password
      }
    );

    if(response.statusCode == 200){
      var jsonString = response.body;
      LoginModel loginModel = loginModelFromJson(jsonString);
      
      return loginModel.statusCode == 200 ? true : false;
    }

    return false;
  }

}