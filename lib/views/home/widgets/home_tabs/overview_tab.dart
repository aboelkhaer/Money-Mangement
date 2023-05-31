import 'package:money_mangement/exports.dart';

class OverviewTab extends StatelessWidget {
  const OverviewTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Column(
        children: [
          const OverViewCard(
            isTotalBalance: true,
            totalBalance: '2000',
          ),
          const OverViewCard(
            totalBalance: '3000',
            isTotalBalance: false,
            totalIncome: '30000',
            totalExpense: '4000',
            totalExpensePercent: '10.3',
            totalIncomePercent: '22.3',
          ),
          SizedBox(
            height: SizeConfig.setHeight(context, 0.1),
          ),
        ],
      ),
    );
  }
}
