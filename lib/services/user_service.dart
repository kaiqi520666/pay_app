import 'package:get/get.dart';
import '../entity/user.entity.dart';

import '../utils/app_util.dart';

class UserService extends GetxService {
  UserEntity? user;
  Future<UserService> init() async {
    var json = AppUtil.getJson('user');
    if (json != null) {
      user = UserEntity(token: json['token']);
    }
    return this;
  }
}
