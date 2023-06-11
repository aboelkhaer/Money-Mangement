import 'package:money_mangement/exports.dart';

class ProfilePicWithFrame extends StatelessWidget {
  final double radius;
  final String picture;
  const ProfilePicWithFrame({
    Key? key,
    required this.radius,
    required this.picture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white24,
      radius: radius + 7,
      child: ProfilePic(radius: radius, picture: picture),
    );
  }
}
