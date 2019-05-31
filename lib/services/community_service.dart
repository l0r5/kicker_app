import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../utils/globals.dart' as globals;

abstract class BaseCommunityService {
  Future<List<String>> getOnlineUsers();

  Future<http.Response> addOnlineUser();
}

class CommunityService extends BaseCommunityService {
  var baseUrl = globals.BASE_URL_KICKER_SEVER_APP_API;

  Future<List<String>> getOnlineUsers() async {
    print('Http GET Request: $baseUrl/community');
    final response = await http.get('$baseUrl/community');
    final jsonResponse = convert.jsonDecode(response.body);
    print('Response: $jsonResponse');
    final List<String> userList = [];
    jsonResponse.forEach((value) => userList.add(value));
    return userList;
  }

  Future<http.Response> addOnlineUser() async {
    print('Http POST Request: $baseUrl/addOnlineUser');
    var response = await http.post('$baseUrl/addOnlineUser');
    return response;
  }
}
