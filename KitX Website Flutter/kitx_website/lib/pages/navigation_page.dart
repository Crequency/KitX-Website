import 'dart:html';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitx_website/pages/controls/drawer.dart';
import 'package:kitx_website/pages/controls/navigation_page_actions.dart';
import 'package:kitx_website/pages/home_page.dart';
import 'package:kitx_website/pages/milestone_page.dart';
import 'package:kitx_website/pages/plugins_page.dart';
import 'package:kitx_website/pages/settings_page.dart';
import 'package:kitx_website/utils/global.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  double _buttonsPadding = 10;
  var _pageController = PageController(initialPage: 0);

  void checkWindowWidth() {
    var width = window.innerWidth;
    if (width != null) {
      if (width <= 500 && showTextOfLinkButton.value) {
        showTextOfLinkButton.value = false;
      } else if (width > 500 && !showTextOfLinkButton.value) {
        showTextOfLinkButton.value = true;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    app.navPageController = _pageController;

    window.onResize.listen((event) => checkWindowWidth());

    checkWindowWidth();
  }

  @override
  Widget build(BuildContext context) {
    themeButtonInLightMode.value = !context.isDarkMode;
    return Scaffold(
      body: Row(
        children: <Widget>[
          MediaQuery.of(context).size.width > MediaQuery.of(context).size.height
              ? Obx(
                  () => NavigationRail(
                    selectedIndex: app.navigationIndex.value,
                    groupAlignment: -1.0,
                    onDestinationSelected: (index) => app.navPageTo(index),
                    useIndicator: true,
                    labelType: NavigationRailLabelType.all,
                    // leading: FloatingActionButton(
                    //   elevation: 0,
                    //   onPressed: () {},
                    //   child: const Icon(Icons.search),
                    // ),
                    minWidth: 90,
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
                        icon: const Icon(Icons.timeline),
                        selectedIcon: const Icon(Icons.timeline_outlined),
                        label: Text('Milestones_Page'.tr),
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
                )
              : const SizedBox(),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                Scaffold(
                  appBar: AppBar(
                    title: Obx(
                      () => Text(
                        showTextOfLinkButton.value ? 'KitX Website' : 'KitX',
                        overflow: showTextOfLinkButton.value ? TextOverflow.fade : TextOverflow.ellipsis,
                      ),
                    ),
                    actions: getActions(context),
                    leading: Builder(
                      builder: (BuildContext context) {
                        return IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: Scaffold.of(context).openDrawer,
                          //   tooltip: '',
                        );
                      },
                    ),
                    forceMaterialTransparency: true,
                  ),
                  drawer: AppDrawer(),
                  drawerEnableOpenDragGesture: true,
                  drawerEdgeDragWidth: (window.innerWidth ?? 300) / 2 + 50,
                  body: PageView(
                    children: const [
                      const ClipRect(child: const HomePage()),
                      const ClipRect(child: const PluginsPage()),
                      const ClipRect(child: const MilestonesPage()),
                      const ClipRect(child: const SettingsPage()),
                    ],
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
