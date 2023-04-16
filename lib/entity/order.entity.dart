import 'package:pay_app/entity/channel.entity.dart';
import 'package:pay_app/entity/user.entity.dart';

class OrderEntity {
  int? id;
  DateTime? createTime;
  DateTime? updateTime;
  String? orderId;
  String? outOrderId;
  double? amount;
  int? status;
  double? settleAmount;
  double? rate;
  String? extra;
  String? notifyUrl;
  UserEntity? user;
  ChannelEntity? channel;

  OrderEntity(
      {this.id,
      this.createTime,
      this.updateTime,
      this.orderId,
      this.outOrderId,
      this.amount,
      this.status,
      this.settleAmount,
      this.rate,
      this.extra,
      this.notifyUrl,
      this.user,
      this.channel});

  OrderEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createTime = DateTime.parse(json['create_time']).toLocal();
    updateTime = DateTime.parse(json['update_time']).toLocal();
    orderId = json['order_id'];
    outOrderId = json['out_order_id'];
    amount = double.parse(json['amount']);
    status = json['status'];
    settleAmount = double.parse(json['settle_amount']);
    rate = double.parse(json['rate']);
    extra = json['extra'];
    notifyUrl = json['notify_url'];
    user = json['user'] != null ? UserEntity.fromJson(json['user']) : null;
    channel = json['channel'] != null
        ? ChannelEntity.fromJson(json['channel'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['create_time'] = createTime;
    data['update_time'] = updateTime;
    data['order_id'] = orderId;
    data['out_order_id'] = outOrderId;
    data['amount'] = amount;
    data['status'] = status;
    data['settle_amount'] = settleAmount;
    data['rate'] = rate;
    data['extra'] = extra;
    data['notify_url'] = notifyUrl;
    return data;
  }
}

class Order24hEntity {
  int? id;
  double? amount;
  Order24hEntity({this.id, this.amount});
}

class QueryOrderEntity {
  String? orderId;
  String? outOrderId;
  String? startTime;
  String? endTime;
  int? status;
}
