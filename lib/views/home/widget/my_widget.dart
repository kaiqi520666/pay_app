import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../home_controller.dart';

class MyWidget extends StatelessWidget {
  final HomeController controller;
  const MyWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    var svgSize = 30.0;
    return Obx(() => SmartRefresher(
          controller: controller.myRefreshController,
          onRefresh: controller.onMyRefresh,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/user.svg',
                              width: 60,
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.user.value.username!,
                                  style: const TextStyle(fontSize: 30),
                                ),
                                Text(
                                  '商户ID：${controller.user.value.id!.toString()}',
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: controller.logout,
                          icon: SvgPicture.asset(
                            'assets/svg/logout.svg',
                            width: 45,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                  child: Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: SvgPicture.asset(
                        'assets/svg/amount.svg',
                        width: svgSize,
                      ),
                      title: const Text('我的余额'),
                      trailing: Text(controller.user.value.amount!.toString()),
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        'assets/svg/secret_key.svg',
                        width: svgSize,
                      ),
                      title: const Text('密钥'),
                      trailing: Text(controller.user.value.secretKey!),
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        'assets/svg/wallet_type.svg',
                        width: svgSize,
                      ),
                      title: const Text('钱包协议'),
                      trailing: Text(controller.user.value.walletType!.name!),
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        'assets/svg/wallet_address.svg',
                        width: svgSize,
                      ),
                      title: const Text('钱包地址'),
                      trailing: Text(controller.user.value.walletAddress!),
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        'assets/svg/login_ip.svg',
                        width: svgSize,
                      ),
                      title: const Text('登录IP'),
                      trailing: Text(controller.user.value.loginIp!),
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        'assets/svg/interface_ip.svg',
                        width: svgSize,
                      ),
                      title: const Text('接口IP'),
                      trailing: Text(controller.user.value.interfaceIp!),
                    ),
                  ],
                ),
              )),
              SliverToBoxAdapter(
                child: Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: SvgPicture.asset(
                          'assets/svg/pay.svg',
                          width: svgSize,
                        ),
                        title: const Text('我要充值'),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(
                          'assets/svg/withdraw.svg',
                          width: svgSize,
                        ),
                        title: const Text('我要提现'),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
