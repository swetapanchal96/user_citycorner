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

  Future callYourCartListApi(Map<String, Object> jsonparam,String token) async {
    final JsonParam = jsonEncode(jsonparam);
    var Dataresponse;
    try {
      print(baseurl + "my_cart");
      http.Response response = await http.post(
          Uri.parse(baseurl + "my_cart"),body: JsonParam,
          headers:{'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          });

      Dataresponse = JSON.jsonDecode(response.body);

      return Dataresponse;

    } catch (E) {
      print("Error" + E.toString());
    }
  }

  Future callOngoing_OrderListApi(Map<String, Object> jsonparam,String token) async {
    final JsonParam = jsonEncode(jsonparam);
    var Dataresponse;
    try {
      print(baseurl + "ongoing_order_for_branch_user");
      http.Response response = await http.post(
          Uri.parse(baseurl + "ongoing_order_for_branch_user"),body: JsonParam,
          headers:{'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          });

      Dataresponse = JSON.jsonDecode(response.body);

      return Dataresponse;

    } catch (E) {
      print("Error" + E.toString());
    }
  }

  Future callPast_OrdersListApi(Map<String, Object> jsonparam,String token) async {
    final JsonParam = jsonEncode(jsonparam);
    var Dataresponse;
    try {
      print(baseurl + "past_order_for_branch_user");
      http.Response response = await http.post(
          Uri.parse(baseurl + "past_order_for_branch_user"),body: JsonParam,
          headers:{'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          });

      Dataresponse = JSON.jsonDecode(response.body);

      return Dataresponse;

    } catch (E) {
      print("Error" + E.toString());
    }
  }

}