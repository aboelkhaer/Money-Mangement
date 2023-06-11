import 'package:money_mangement/exports.dart';

class TransactionsScreen extends GetView<HomeController> {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: controller.allTransactions.length,
        shrinkWrap: true,
        padding: const EdgeInsets.only(bottom: 20, top: 20),
        itemBuilder: (context, index) {
          var transaction = controller.allTransactions[index];

          return GestureDetector(
            onTap: () {
              Get.snackbar(
                'Attention!',
                'Long press to delete transaction.',
                snackPosition: SnackPosition.BOTTOM,
              );
            },
            onLongPress: () {
              controller.deleteTransaction(transaction.id!);
            },
            child: SizedBox(
              width: double.infinity,
              child: Card(
                margin: const EdgeInsets.only(bottom: 10, left: 16, right: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.getTimeDifferenceFromNow(
                                transaction.date!.toDate()),
                            // transaction.date!.toDate().day.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                transaction.money!,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 5),
                              transaction.transactionType == 'Expense'
                                  ? const Icon(Icons.arrow_downward,
                                      color: Colors.red)
                                  : const Icon(Icons.arrow_upward,
                                      color: Colors.green),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                  'Category: ${transaction.transactionCategory}')
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: transaction.transactionType! == 'Expense'
                                    ? Colors.red
                                    : Colors.green,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              transaction.transactionType!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
