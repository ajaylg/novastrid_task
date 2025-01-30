import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/dashboard_model.dart';

class DashboardRepository {
  Future<DashboardModel> fetchUser() async {
    var url = Uri.parse("https://dummyjson.com/users");
    var response = await http.get(url);
    return DashboardModel.fromJson(json.decode(response.body));
  }
}
