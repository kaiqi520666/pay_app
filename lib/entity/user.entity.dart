import 'package:pay_app/entity/wallet_type.entity.dart';

class UserEntity {
  int? id;
  DateTime? createTime;
  DateTime? updateTime;
  String? username;
  String? role;
  double? amount;
  String? loginIp;
  String? interfaceIp;
  String? secretKey;
  String? walletAddress;
  String? token;
  bool? enabled;
  WalletTypeEntity? walletType;

  UserEntity(
      {this.id,
      this.createTime,
      this.updateTime,
      this.username,
      this.role,
      this.amount,
      this.loginIp,
      this.interfaceIp,
      this.secretKey,
      this.walletAddress,
      this.enabled,
      this.walletType,
      this.token});

  UserEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createTime = json['create_time'] != null
        ? DateTime.parse(json['create_time']).toLocal()
        : null;
    updateTime = json['update_time'] != null
        ? DateTime.parse(json['update_time']).toLocal()
        : null;
    username = json['username'];
    role = json['role'];
    amount = json['amount'] != null ? double.parse(json['amount']) : null;
    loginIp = json['login_ip'];
    interfaceIp = json['interface_ip'];
    secretKey = json['secret_key'];
    walletAddress = json['wallet_address'];
    enabled = json['enabled'];
    token = json['token'];
    walletType = json['wallet_type'] != null
        ? WalletTypeEntity.fromJson(json['wallet_type'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['create_time'] = createTime;
    data['update_time'] = updateTime;
    data['username'] = username;
    data['role'] = role;
    data['amount'] = amount;
    data['login_ip'] = loginIp;
    data['interface_ip'] = interfaceIp;
    data['secret_key'] = secretKey;
    data['wallet_address'] = walletAddress;
    data['enabled'] = enabled;
    data['token'] = token;
    if (walletType != null) {
      data['wallet_type'] = walletType!.toJson();
    }
    return data;
  }
}
