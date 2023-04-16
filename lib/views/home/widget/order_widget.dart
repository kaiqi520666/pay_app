import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pay_app/components/empty_widget.dart';
import 'package:pay_app/components/loading_widget.dart';
import 'package:pay_app/views/home/home_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class OrderWidget extends StatelessWidget {
  final HomeController controller;
  const OrderWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.orderLoading.value
          ? const LoadingWidget()
          : SmartRefresher(
              controller: controller.refreshController,
              enablePullDown: true,
              enablePullUp: true,
              onRefresh: controller.onMyOrdersRefresh,
              onLoading: controller.onMyOrdersLoading,
              child: controller.myOrders.isEmpty
                  ? const EmptyWidget()
                  : ListView.builder(
                      itemCount: controller.myOrders.length,
                      itemBuilder: (context, index) {
                        var order = controller.myOrders[index];
                        return Card(
                            child: Column(children: [
                          ListTile(
                            leading: const Icon(Icons.dvr),
                            title: const Text('平台单号'),
                            trailing: Text(order.orderId!),
                            onTap: () {
                              Clipboard.setData(
                                  ClipboardData(text: order.orderId!));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${order.orderId}已复制到剪贴板'),
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                ),
                              );
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.list_alt),
                            title: const Text('商户单号'),
                            trailing: Text(order.outOrderId!),
                            onTap: () {
                              Clipboard.setData(
                                  ClipboardData(text: order.outOrderId!));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${order.outOrderId}已复制到剪贴板'),
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                ),
                              );
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.timer),
                            title: const Text('下单时间'),
                            trailing: Text(DateFormat('yy-MM-dd HH:mm:ss')
                                .format(order.createTime!)),
                          ),
                          ListTile(
                            leading: const Icon(Icons.currency_yen),
                            title: const Text('下单金额'),
                            trailing: Text(order.amount!.toString()),
                          ),
                          ListTile(
                            leading: const Icon(Icons.currency_exchange),
                            title: const Text('费率'),
                            trailing: Text(order.rate!.toString()),
                          ),
                          ListTile(
                            leading: const Icon(Icons.shopping_cart),
                            title: const Text('结算金额'),
                            trailing: Text(order.settleAmount!.toString()),
                          ),
                          ListTile(
                            leading: const Icon(Icons.view_cozy_outlined),
                            title: const Text('通道'),
                            trailing: Text(order.channel!.name!),
                          ),
                          order.status == 1
                              ? const Chip(
                                  avatar: CircularProgressIndicator(
                                    strokeWidth: 1,
                                  ),
                                  label: Text('待支付'),
                                )
                              : const Chip(
                                  avatar: Icon(
                                    Icons.file_download_done,
                                  ),
                                  label: Text(
                                    '支付成功',
                                  ),
                                ),
                          const SizedBox(
                            height: 10,
                          )
                        ]));
                      }),
            ),
    );
  }
}
