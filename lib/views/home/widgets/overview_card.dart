import 'package:money_mangement/exports.dart';

class OverViewCard extends GetView<HomeController> {
  final bool isTotalBalance;
  final String? totalIncomePercent;
  final String? totalExpensePercent;
  const OverViewCard({
    Key? key,
    required this.isTotalBalance,
    this.totalIncomePercent,
    this.totalExpensePercent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: isTotalBalance
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Balance',
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 18),
                        ),
                        const Icon(
                          Icons.attach_money_outlined,
                          color: Colors.blue,
                          size: 30,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 28),
                      child: Obx(
                        () => Text(
                          controller.totalBalance.value.toString(),
                          style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            icon: const Icon(
                              Icons.track_changes,
                            ),
                            onPressed: () {
                              controller.modalBottomSheetMenu(
                                context,
                                'Income',
                              );
                            },
                            label: const Text('Add Income'),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            icon: const Icon(
                              Icons.track_changes,
                            ),
                            onPressed: () {
                              controller.modalBottomSheetMenu(
                                  context, 'Expense');
                            },
                            label: const Text('Add Expense'),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Column(
                  children: [
                    Obx(
                      () => OverviewCardBody(
                        isIncome: true,
                        title: 'Total Income',
                        footerTitle: 'Increase from last weeks',
                        percent: totalIncomePercent!,
                        money: controller.totalIncome.value.toString(),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Divider(thickness: 1),
                    ),
                    Obx(
                      () => OverviewCardBody(
                        isIncome: false,
                        title: 'Total Expense',
                        footerTitle: 'Decrease from last weeks',
                        percent: totalExpensePercent!,
                        money: controller.totalExpense.value.toString(),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
