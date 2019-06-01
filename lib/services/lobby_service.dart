import 'package:kicker_app/utils/network_util.dart';
import '../utils/globals_utils.dart' as globals;

abstract class BaseLobbyService {
  Future<List<String>> getOnlineUsers();

  Future<List<String>> addOnlineUser(String user);
}

class LobbyService extends BaseLobbyService {
  var baseUrl = globals.BASE_URL_KICKER_SEVER_APP_API;

  NetworkUtil _networkUtil = new NetworkUtil();

  Future<List<String>> getOnlineUsers() async {
    String url = '$baseUrl/lobby';
    print('Http GET Request: $url');
    return _networkUtil.get(url).then((dynamic response) {
      final List<String> userList = [];
      response.forEach((value) => userList.add(value));
      return userList;
    });
  }

  Future<List<String>> addOnlineUser(String user) async {
    String url = '$baseUrl/lobby/addOnlineUser';
    print('Http POST Request: $url');
    return _networkUtil.post(url, {'user': user}).then((dynamic response) {
      final List<String> userList = [];
      response.forEach((value) => userList.add(value));
      return userList;
    });
  }
}
