// import 'package:permission_handler/permission_handler.dart';

import 'exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Permission.notification.isDenied.then((value) {
  //   if (value) {
  //     Permission.notification.request();
  //   }
  // });
  NotificationService().initNotification();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return GetMaterialApp(
      title: 'iMoney',
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.routes,
    );
  }
}
