import 'dart:developer';

import 'package:money_mangement/exports.dart';

class HeaderRow extends GetView<HomeController> {
  const HeaderRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(controller.authController.userProfile!.photoURL.toString());
    return Positioned(
      top: SizeConfig.setHeight(context, 0.1),
      right: 0,
      left: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white24,
                  radius: 30,
                  child: CircleAvatar(
                    backgroundColor: Colors.white54,
                    radius: 23,
                    child: ClipOval(
                      child: FadeInImage(
                        placeholder: const AssetImage(AppImages.photoClr),
                        placeholderFit: BoxFit.cover,
                        image: NetworkImage(
                          controller.authController.userProfile!.photoURL!,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: SizeConfig.setWidth(context, 0.02)),
                Text(
                  'Welcome back,\n${controller.authController.displayName}',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white24,
                  radius: 25,
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                SizedBox(width: SizeConfig.setWidth(context, 0.02)),
                const CircleAvatar(
                  backgroundColor: Colors.white24,
                  radius: 25,
                  child: Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
