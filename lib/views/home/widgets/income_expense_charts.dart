import 'package:money_mangement/exports.dart';

class IncomeExpenseCharts extends GetView<HomeController> {
  final String title;
  final String condition;

  const IncomeExpenseCharts(
      {super.key, required this.title, required this.condition});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: condition == 'Income' ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
        AspectRatio(
          aspectRatio: 2,
          child: LineChart(
            LineChartData(
              minX: 1,
              maxX: 7,
              minY: 0,
              titlesData: FlTitlesData(
                show: true,
                topTitles: AxisTitles(
                    sideTitles: SideTitles(
                        reservedSize: 20,
                        showTitles: true,
                        getTitlesWidget: (value, meta) => Container())),
                rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                        reservedSize: 20,
                        showTitles: true,
                        getTitlesWidget: (value, meta) => Container())),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    getTitlesWidget: (value, meta) => Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: Text(
                        controller.monthdata(value),
                        // value.toString(),
                      ),
                    ),
                    showTitles: true,
                    reservedSize: 20,
                    interval: 1,
                  ),
                ),
              ),
              backgroundColor: const Color(0xff37434d),
              gridData: FlGridData(
                  show: true,
                  getDrawingVerticalLine: (value) {
                    return FlLine(
                      color: const Color(0xff37434d),
                      strokeWidth: 1,
                    );
                  }),
              borderData: FlBorderData(
                border: Border.all(color: const Color(0xff37434d), width: 1),
              ),
              lineBarsData: [
                LineChartBarData(
                    spots: controller.allTransactions
                        .where((item) => item.transactionType == condition)
                        .map((transaction) => FlSpot(
                            transaction.date!.toDate().month.toDouble(),
                            double.parse(transaction.money!)))
                        .toList(),
                    isCurved: true,
                    dotData: FlDotData(
                      show: true,
                    ),
                    curveSmoothness: 0.8,
                    gradient: const LinearGradient(
                      colors: AppColors.gradientColors,
                    ),
                    barWidth: 5,
                    belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: AppColors.gradientColors
                              .map((e) => e.withOpacity(0.3))
                              .toList(),
                        ))),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
