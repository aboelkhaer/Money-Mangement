import 'package:money_mangement/exports.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.onboarding1,
      height: SizeConfig.setHeight(context, 0.4),
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
