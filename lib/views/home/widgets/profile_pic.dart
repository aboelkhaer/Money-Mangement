import 'package:money_mangement/exports.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
    required this.radius,
    required this.picture,
  }) : super(key: key);

  final double radius;
  final String picture;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white12,
      radius: radius,
      child: ClipOval(
        child: FadeInImage(
          placeholder: const AssetImage(AppImages.photoClr),
          placeholderFit: BoxFit.cover,
          image: NetworkImage(
            picture,
          ),
        ),
      ),
    );
  }
}
