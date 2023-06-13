import 'package:money_mangement/exports.dart';

class SettingScreen extends GetView<HomeController> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              ProfilePic(
                radius: 70,
                picture: controller.authController.user.value!.photoURL!,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.authController.user.value!.displayName!,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Total balance: ${controller.totalBalance.value}')
                ],
              )
            ],
          ),
          SizedBox(
            height: SizeConfig.setHeight(context, 0.03),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Dashboard',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    ListTile(
                      title: const Text(
                        'Notification',
                      ),
                      leading: Obx(
                        () => Icon(
                          controller.isNotification.value
                              ? Icons.notifications_active
                              : Icons.notifications_none,
                        ),
                      ),
                      trailing: Obx(
                        () => Switch(
                          value: controller.isNotification.value,
                          onChanged: (value) {
                            // controller.isNotification.value = value;
                            if (controller.isNotification.value == false) {
                              controller.isNotification.value = true;

                              NotificationService().showNotification(
                                  title: 'iMoney',
                                  body: 'Daily reminder is set.');
                            } else {
                              controller.isNotification.value = false;
                            }
                          },
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.toNamed(
                        AppRoutes.goToCategoriesRoute(),
                        arguments: controller.userCategories,
                      ),
                      child: const ListTile(
                        title: Text(
                          'Categories',
                        ),
                        leading: Icon(
                          Icons.category_outlined,
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.setHeight(context, 0.05)),
                    Row(
                      children: [
                        Text(
                          'My Account',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.setHeight(context, 0.02)),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => controller.authController.signOut(),
                          child: const Text(
                            'Log Out',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
