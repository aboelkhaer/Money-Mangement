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
          ),
          const OverViewCard(
            isTotalBalance: false,
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
