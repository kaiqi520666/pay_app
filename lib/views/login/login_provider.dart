import 'package:get/get.dart';
import '../../base/http_base.dart';

class LoginProvider extends HttpBase {
  Future<Response> login(String username, String password) async {
    var response = await post('/sign/login', {
      'username': username,
      'password': password,
    });
    return response;
  }
}
