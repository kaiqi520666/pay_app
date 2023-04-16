import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_app/entity/order.entity.dart';

class SearchController extends GetxController {
  var id = Get.parameters['id'];

  var queryOrder = QueryOrderEntity();
  var order = {
    'orderId': TextEditingController(),
    'outOrderId': TextEditingController(),
    'startTime': TextEditingController(),
    'endTime': TextEditingController(),
    'status': 0.obs,
  };
  void onOrderSearch() {
    queryOrder.orderId = (order['orderId'] as TextEditingController).text;
    queryOrder.outOrderId = (order['outOrderId'] as TextEditingController).text;
    queryOrder.startTime = (order['startTime'] as TextEditingController).text;
    queryOrder.endTime = (order['endTime'] as TextEditingController).text;
    queryOrder.status = (order['status'] as Rx<int>).value;
    Get.back(result: queryOrder);
  }
}
