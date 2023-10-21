import 'dart:convert';
import 'dart:convert' as JSON;
import 'package:http/http.dart'as http;


class ApiService {

  static var baseurl = "https://getdemo.in/city-corner/api/";

  Future callloginApi(Map<String, Object> jsonparam) async {
    final JsonParam = jsonEncode(jsonparam);
    var responseData;
    try {
      print(baseurl + "login");
      http.Response response = await http.post(Uri.parse(baseurl + "login"), body: JsonParam,
          headers: {"Content-Type": "application/json"});
      responseData = JSON.jsonDecode(response.body.toString());
      print("response + $responseData");
      return responseData;
    } catch (E) {
      print("Error" + E.toString());
    }
  }


}