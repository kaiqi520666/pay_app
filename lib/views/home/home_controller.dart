import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pay_app/config/app_config.dart';
import 'package:pay_app/entity/order.entity.dart';
import 'package:pay_app/utils/app_util.dart';
import 'package:pay_app/views/home/home_provider.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../entity/user.entity.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;
  var homeProvider = Get.find<HomeProvider>();
  var orders = <OrderEntity>[];
  var myOrders = <OrderEntity>[].obs;
  var orders24h = <Order24hEntity>[].obs;
  var orderCount = 0.obs;
  final RefreshController refreshController = RefreshController();
  final RefreshController statsRefreshController = RefreshController();
  final RefreshController myRefreshController = RefreshController();
  var myOrderHasData = false;
  var myLoading = false.obs;
  var day = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;
//订单总金额
  var orderAmount = 0.0.obs;
  var pageController = PageController();
  var myOrdersOffset = 0;
  var user = UserEntity().obs;
  var queryOrder = QueryOrderEntity();
  var orderLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    findStats();
    findOrders();
    findUser();
  }

  Future<void> findStats() async {
    orders.clear();
    orders24h.clear();
    orderCount.value = 0;
    orderAmount.value = 0.0;
    //tomorrow
    var endTime = DateFormat('yyyy-MM-dd')
        .format(DateTime.parse(day.value).add(const Duration(days: 1)));
    var response = await homeProvider.getStats(day.value, endTime);
    if (response.body['code'] == 200) {
      response.body['records'][0].forEach((v) {
        orders.add(OrderEntity.fromJson(v));
      });
    }
    //遍历24小时，将orders按小时合计amount，加入到order24h,格式为id：0到23,amount(为某一个时间段内的订单总金额)
    for (var i = 0; i < 24; i++) {
      var order24h = Order24hEntity(id: i, amount: 0.0);
      for (var element in orders) {
        if (int.parse(DateFormat('HH').format(element.createTime!)) == i) {
          order24h.amount = order24h.amount! + element.amount!;
        }
      }
      orders24h.add(order24h);
    }
    //计算订单总数
    orderCount.value = orders.length;
    //计算订单总金额
    for (var element in orders) {
      orderAmount.value = orderAmount.value + element.amount!;
    }
  }

  Future<void> findOrders() async {
    var response = await homeProvider.getOrders(myOrdersOffset, queryOrder);
    if (response.body['code'] == 200) {
      response.body['records'][0].forEach((v) {
        myOrders.add(OrderEntity.fromJson(v));
      });
      myOrderHasData = response.body['records'][0].length > 0;
    }
  }

  Future<void> onMyOrdersRefresh() async {
    myOrders.clear();
    myOrdersOffset = 0;
    orderLoading.value = true;
    await findOrders();
    orderLoading.value = false;
    refreshController.refreshCompleted();
    if (myOrderHasData) {
      refreshController.loadComplete();
    } else {
      refreshController.loadNoData();
    }
  }

  Future<void> onMyOrdersLoading() async {
    myOrdersOffset += AppConfig.limit;
    await findOrders();
    if (myOrderHasData) {
      refreshController.loadComplete();
    } else {
      refreshController.loadNoData();
    }
  }

  Future<void> findUser() async {
    var response = await homeProvider.getUser();
    if (response.body['code'] == 200) {
      user.value = UserEntity.fromJson(response.body['records']);
    }
  }

  Future<void> onMyRefresh() async {
    await findUser();
    myRefreshController.refreshCompleted();
  }

  Future<void> onStatsRefresh() async {
    await findStats();
    statsRefreshController.refreshCompleted();
  }

  void logout() {
    AppUtil.remove('user');
    Get.offNamed('/login');
  }

  void toSearch() {
    Get.toNamed('/search', arguments: currentIndex.value, parameters: {
      'id': currentIndex.value.toString(),
    })!
        .then((value) async {
      if (value != null) {
        queryOrder = value as QueryOrderEntity;
        myOrders.clear();
        myOrdersOffset = 0;
        orderLoading.value = true;
        await findOrders();
        orderLoading.value = false;
      }
    });
  }
}
