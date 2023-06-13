import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:money_mangement/exports.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.grey[100],
        floatingActionButton: FloatingActionButton(
          onPressed: () => controller.modalBottomSheetMenu(context, null),
          backgroundColor: AppColors.skipButton,
          child: const Icon(
            Icons.add,
            size: 35,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          backgroundColor: AppColors.skipButton,
          icons: const [
            Icons.home,
            Icons.settings,
          ],
          activeIndex: controller.bottomNavIndex.value,
          inactiveColor: Colors.white,
          iconSize: 30,
          activeColor: Colors.amber,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          onTap: (index) {
            controller.bottomNavIndex.value = index;
          },
        ),
        body: controller.bottomNavIndex.value == 0
            ? Stack(
                children: [
                  const BackgroundImage(),
                  SizedBox(height: SizeConfig.setHeight(context, 0.2)),
                  const HeaderRow(),
                  Column(
                    children: <Widget>[
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.white30,
                              width: 1,
                            ),
                          ),
                        ),
                        margin: EdgeInsets.only(
                            top: SizeConfig.setHeight(context, 0.2), left: 20),
                        child: TabBar(
                          controller: controller.tabController,
                          isScrollable: true,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorWeight: 1.5,
                          labelPadding:
                              const EdgeInsets.only(right: 20, left: 20),
                          indicatorColor: Colors.white,
                          tabs: const [
                            Tab(
                                child: Text('Overview',
                                    style: TextStyle(fontSize: 17))),
                            Tab(
                                child: Text('Transactions',
                                    style: TextStyle(fontSize: 17))),
                            Tab(
                                child: Text('Statistics',
                                    style: TextStyle(fontSize: 17))),
                            Tab(
                                child: Text('analysis',
                                    style: TextStyle(fontSize: 17))),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: controller.tabController,
                          children: const [
                            OverviewTab(),
                            TransactionsScreen(),
                            StatisticsTab(),
                            Icon(Icons.music_video),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : const SettingScreen(),
      ),
    );
  }
}
