import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitx_website/pages/docs_page.dart';
import 'package:kitx_website/pages/home_page.dart';
import 'package:kitx_website/utils/global.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  double _buttonsPadding = 10;
  var _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Obx(
            () => NavigationRail(
              selectedIndex: Global.navigationIndex.value,
              groupAlignment: -1.0,
              onDestinationSelected: (int index) {
                var delta = (index - Global.navigationIndex.value).abs();
                Global.navigationIndex.value = index;
                _pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 150 + delta * 200),
                  curve: Curves.easeInOutCubic,
                );
              },
              useIndicator: true,
              labelType: NavigationRailLabelType.all,
              leading: FloatingActionButton(
                elevation: 0,
                onPressed: () {},
                child: const Icon(Icons.search),
              ),
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: const Icon(Icons.home),
                  selectedIcon: const Icon(Icons.home_outlined),
                  label: Text('Home_Page'.tr),
                  padding: EdgeInsets.symmetric(vertical: _buttonsPadding),
                ),
                NavigationRailDestination(
                  icon: const Icon(CommunityMaterialIcons.cube),
                  selectedIcon: const Icon(CommunityMaterialIcons.cube_outline),
                  label: Text('Plugins_Page'.tr),
                  padding: EdgeInsets.symmetric(vertical: _buttonsPadding),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.account_balance),
                  selectedIcon: const Icon(Icons.account_balance_outlined),
                  label: Text('Public_Docs'.tr),
                  padding: EdgeInsets.symmetric(vertical: _buttonsPadding),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.settings),
                  selectedIcon: const Icon(Icons.settings_outlined),
                  label: Text('Settings_Page'.tr),
                  padding: EdgeInsets.symmetric(vertical: _buttonsPadding),
                ),
              ],
            ),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: PageView(
              children: [
                ClipRect(child: const HomePage()),
                ClipRect(
                    child: Center(
                  child: const Text('Under developing ...'),
                )),
                ClipRect(child: DocsPage()),
                ClipRect(
                    child: Center(
                  child: const Text('Under developing ...'),
                )),
              ],
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
            ),
          ),
        ],
      ),
    );
  }
}
