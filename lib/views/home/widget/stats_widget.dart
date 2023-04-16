import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pay_app/views/home/home_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class StatsWidget extends StatelessWidget {
  final HomeController controller;
  const StatsWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: controller.statsRefreshController,
      onRefresh: controller.onStatsRefresh,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: SvgPicture.asset(
                          'assets/svg/day.svg',
                          width: 25,
                        ),
                        title: const Text('日期'),
                        subtitle: Obx(() => Text(controller.day.toString())),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          showDatePicker(
                                  context: context,
                                  initialDate:
                                      DateTime.parse(controller.day.value),
                                  firstDate: DateTime(2015, 8),
                                  lastDate: DateTime(2101))
                              .then((value) {
                            if (value != null) {
                              controller.day.value =
                                  DateFormat('yyyy-MM-dd').format(value);
                              controller.findStats();
                            }
                          });
                        },
                      ),
                      ListTile(
                        leading: SvgPicture.asset(
                          'assets/svg/order_count.svg',
                          width: 25,
                        ),
                        title: const Text('订单数量'),
                        trailing:
                            Obx(() => Text(controller.orderCount.toString())),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(
                          'assets/svg/order_amount.svg',
                          width: 25,
                        ),
                        title: const Text('订单金额'),
                        trailing:
                            Obx(() => Text(controller.orderAmount.toString())),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            child: Obx(
              () => Padding(
                padding: const EdgeInsets.only(right: 10),
                child: RotatedBox(
                  quarterTurns: 1,
                  child: BarChart(
                    buildData(),
                    swapAnimationDuration:
                        const Duration(milliseconds: 150), // Optional
                    swapAnimationCurve: Curves.linear, // Optional
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BarChartData buildData() {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: const EdgeInsets.all(0),
          tooltipMargin: -30,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            return BarTooltipItem(
              rod.toY.toString(),
              const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            );
          },
        ),
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 45,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(controller.orders24h.length, (i) {
        return makeGroupData(
          i,
          controller.orders24h[i].amount!,
        );
      }),
      gridData: FlGridData(show: false),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color? barColor,
    double width = 10,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: Colors.green,
          width: width,
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    //将value转换为字符串，0.0转换为00，23.0转换为23
    final text = value.toInt().toString().padLeft(2, '0');
    Widget widget = Text(text, style: style);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: widget,
    );
  }
}
