import 'package:money_mangement/exports.dart';

class OverviewCardBody extends StatelessWidget {
  final bool isIncome;
  final String title;
  final String footerTitle;
  final String percent;
  final String money;
  const OverviewCardBody({
    super.key,
    required this.isIncome,
    required this.title,
    required this.footerTitle,
    required this.money,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 18),
                ),
                Icon(
                  isIncome ? Icons.radar_outlined : Icons.access_alarm,
                  color: isIncome ? Colors.blue : Colors.red.shade800,
                  size: 30,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 28),
              child: Text(
                money.toString(),
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: isIncome ? Colors.green : Colors.red,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            isIncome
                ? const Icon(
                    Icons.arrow_circle_up,
                    color: Colors.green,
                  )
                : const Icon(
                    Icons.arrow_circle_down,
                    color: Colors.red,
                  ),
            const SizedBox(width: 4),
            Text(
              isIncome ? '+$percent%' : '-$percent%',
              style: TextStyle(
                color: isIncome ? Colors.green : Colors.red.shade800,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              footerTitle,
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
      ],
    );
  }
}
