import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('搜索选项'),
      ),
      body: Column(
        children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.dvr),
                  title: TextField(
                    controller:
                        controller.order["orderId"] as TextEditingController,
                    decoration: const InputDecoration(
                      hintText: '请输入订单号',
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.list_alt),
                  title: TextField(
                    controller:
                        controller.order["outOrderId"] as TextEditingController,
                    decoration: const InputDecoration(
                      hintText: '请输入商户单号',
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.timer),
                  title: TextField(
                    controller:
                        controller.order["startTime"] as TextEditingController,
                    decoration: const InputDecoration(
                      hintText: '开始时间',
                      enabled: false,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_drop_down),
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2015, 8),
                            lastDate: DateTime(2101))
                        .then((value) {
                      if (value != null) {
                        (controller.order["startTime"] as TextEditingController)
                            .text = DateFormat('yyyy-MM-dd').format(value);
                      }
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.alarm),
                  title: TextField(
                    controller:
                        controller.order["endTime"] as TextEditingController,
                    decoration: const InputDecoration(
                      hintText: '结束时间',
                      enabled: false,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_drop_down),
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2015, 8),
                            lastDate: DateTime(2101))
                        .then((value) {
                      if (value != null) {
                        (controller.order["endTime"] as TextEditingController)
                            .text = DateFormat('yyyy-MM-dd').format(value);
                      }
                    });
                  },
                ),
                //下拉框，可以选择状态，0：全部，1：待支付，2：支付成功，3：支付失败
                ListTile(
                  leading: const Icon(Icons.ads_click),
                  title: Obx(() => DropdownButton<int>(
                        isExpanded: true,
                        value: (controller.order['status'] as Rx<int>).value,
                        items: const [
                          DropdownMenuItem(value: 0, child: Text('全部')),
                          DropdownMenuItem(value: 1, child: Text('待支付')),
                          DropdownMenuItem(value: 2, child: Text('支付成功')),
                          DropdownMenuItem(value: 3, child: Text('支付失败')),
                        ],
                        onChanged: (value) {
                          (controller.order['status'] as Rx<int>).value =
                              value!;
                        },
                      )),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
                onPressed: controller.onOrderSearch,
                icon: const Icon(Icons.search),
                label: const Text('搜索')),
          ),
        ],
      ),
    );
  }
}
