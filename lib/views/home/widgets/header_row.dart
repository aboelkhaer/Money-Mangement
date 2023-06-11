import 'package:money_mangement/exports.dart';

class HeaderRow extends GetView<HomeController> {
  const HeaderRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                ProfilePicWithFrame(
                  picture: controller.authController.user.value!.photoURL!,
                  radius: 23,
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
                CircleAvatar(
                  backgroundColor: Colors.white24,
                  radius: 25,
                  child: Obx(
                    () => IconButton(
                      onPressed: () {
                        if (controller.isNotification.value == false) {
                          controller.isNotification.value = true;

                          NotificationService().showNotification(
                              title: 'iMoney', body: 'Daily reminder is set.');
                        } else {
                          controller.isNotification.value = false;
                        }
                      },
                      icon: Icon(
                        controller.isNotification.value
                            ? Icons.notifications_active
                            : Icons.notifications_none,
                        //  Icons.notifications_active,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
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
