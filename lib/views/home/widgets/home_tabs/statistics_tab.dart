import 'package:money_mangement/exports.dart';

class StatisticsTab extends GetView<HomeController> {
  const StatisticsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Column(
        children: [
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: Card(
              margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              elevation: 2,
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 16),
                    child: IncomeExpenseCharts(
                      title: 'Income Analysis',
                      condition: 'Income',
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 16),
                    child: IncomeExpenseCharts(
                      title: 'Expens Analysis',
                      condition: 'Expense',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
