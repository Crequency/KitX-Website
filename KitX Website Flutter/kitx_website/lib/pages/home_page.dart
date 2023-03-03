import 'dart:html';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kitx_website/pages/controls/drawer.dart';
import 'package:kitx_website/pages/controls/home_page_actions.dart';
import 'package:kitx_website/pages/controls/controls_helper.dart';
import 'package:kitx_website/utils/global.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var tilesPadding = 15.0;

  void checkWindowWidth() {
    var width = window.innerWidth;
    if (width != null) {
      if (width <= 500 && showTextOfLinkButton.value)
        showTextOfLinkButton.value = false;
      else if (width > 500 && !showTextOfLinkButton.value) showTextOfLinkButton.value = true;
    }
  }

  @override
  void initState() {
    window.onResize.listen((event) => checkWindowWidth());

    checkWindowWidth();

    super.initState();
  }

  void showItemsDialog(BuildContext context, List<Widget> items) {
    Global.delay(
      () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Container(
            width: MediaQuery.of(context).size.width < 600 ? MediaQuery.of(context).size.width * 0.9 : 600,
            margin: EdgeInsets.all(30),
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: items,
            ),
          ),
        ),
      ),
      100,
    );
  }

  void beginDownload(BuildContext context, String id) {
    Get.back();
    showItemsDialog(
      context,
      [
        const Text('当前尚未发布, 官网下载项暂不可用, 您可前往 GitHub 仓库 Release 页面下载测试版'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    themeButtonInLightMode.value = !context.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            showTextOfLinkButton.value ? 'KitX Website' : 'KitX',
            overflow: showTextOfLinkButton.value ? TextOverflow.fade : TextOverflow.ellipsis,
          ),
        ),
        actions: getActions(context),
      ),
      drawer: AppDrawer(),
      drawerEnableOpenDragGesture: true,
      drawerEdgeDragWidth: (window.innerWidth ?? 300) / 2 + 50,
      body: Center(
        child: Container(
          width: 500,
          margin: EdgeInsets.all(30),
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              margin: EdgeInsets.all(30),
              child: ListView(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(top: 0),
                    width: 192,
                    height: 192,
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.elliptical(15, 15)),
                      splashColor: context.iconColor?.withOpacity(0.3),
                      onTap: () {},
                      child: const Image(
                        width: 192,
                        height: 192,
                        alignment: Alignment.center,
                        image: AssetImage('assets/KitX-Icon-192x-margin-2x.png'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        const Text(
                          'KitX',
                          style: TextStyle(
                            fontSize: 50,
                          ),
                        ),
                        Text('v3.23.04'),
                        // Obx(
                        //   () => Text(Global.versionString.value),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Divider(),
                  SizedBox(height: 30),
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      StandardPlatformItem(
                        title: 'Windows',
                        subTitle: 'Windows 10/11 supported',
                        leading: const Icon(CommunityMaterialIcons.microsoft_windows),
                        onTap: () => showItemsDialog(
                          context,
                          [
                            StandardDownloadItem(
                              title: '适用于 Windows 64 位 (包含 dotnet 6 运行时)',
                              subTitle: 'win-x64-single.pubxml',
                              onTap: () => beginDownload(context, 'win-x64-single.pubxml'),
                            ),
                            SizedBox(height: tilesPadding),
                            StandardDownloadItem(
                              title: '适用于 Windows 32 位 (包含 dotnet 6 运行时)',
                              subTitle: 'win-x86-single.pubxml',
                              onTap: () => beginDownload(context, 'win-x86-single.pubxml'),
                            ),
                          ],
                        ),
                      ),
                      // ListTile(
                      //   title: const Text('Windows'),
                      //   subtitle: const Text('Windows 10/11 supported'),
                      //   shape: tileRadius,
                      //   leading: const Icon(CommunityMaterialIcons.microsoft_windows),
                      //   trailing: const Icon(Icons.keyboard_arrow_right),
                      //   onTap: () => showItemsDialog(
                      //     context,
                      //     [
                      //       // ListTile(
                      //       //   title: const Text('适用于 Windows 64 位 (依赖 dotnet 6 运行时)'),
                      //       //   subtitle: const Text('win-x64-runtime-relied.pubxml'),
                      //       //   shape: tileRadius,
                      //       //   trailing: const Icon(Icons.download),
                      //       //   onTap: () {},
                      //       // ),
                      //       // SizedBox(height: tilesPadding),
                      //       ListTile(
                      //         title: const Text('适用于 Windows 64 位 (包含 dotnet 6 运行时)'),
                      //         subtitle: const Text('win-x64-single.pubxml'),
                      //         shape: tileRadius,
                      //         trailing: const Icon(Icons.download),
                      //         onTap: () {
                      //           beginDownload(context, 'win-x64-single.pubxml');
                      //         },
                      //       ),
                      //       SizedBox(height: tilesPadding),
                      //       ListTile(
                      //         title: const Text('适用于 Windows 32 位 (包含 dotnet 6 运行时)'),
                      //         subtitle: const Text('win-x86-single.pubxml'),
                      //         shape: tileRadius,
                      //         trailing: const Icon(Icons.download),
                      //         onTap: () {
                      //           beginDownload(context, 'win-x86-single.pubxml');
                      //         },
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(height: tilesPadding),
                      StandardPlatformItem(
                        title: 'GNU/Linux',
                        subTitle: 'Tested on Ubuntu 20.04+, Deepin ...',
                        leading: const Icon(CommunityMaterialIcons.linux),
                        onTap: () => showItemsDialog(
                          context,
                          [
                            StandardDownloadItem(
                              title: '适用于 Linux 64 位 (包含 dotnet 6 运行时)',
                              subTitle: 'linux-x64-single.pubxml',
                              onTap: () => beginDownload(context, 'linux-x64-single.pubxml'),
                            ),
                            SizedBox(height: tilesPadding),
                            StandardDownloadItem(
                              title: '适用于 Linux arm 架构处理器 (包含 dotnet 6 运行时)',
                              subTitle: 'linux-arm-single.pubxml',
                              onTap: () => beginDownload(context, 'linux-arm-single.pubxml'),
                            ),
                            SizedBox(height: tilesPadding),
                            StandardDownloadItem(
                              title: '适用于 Linux arm 架构 64 位处理器 (包含 dotnet 6 运行时)',
                              subTitle: 'linux-arm64-single.pubxml',
                              onTap: () => beginDownload(context, 'linux-arm64-single.pubxml'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: tilesPadding),
                      StandardPlatformItem(
                        title: 'MacOS',
                        subTitle: 'Tested on MacOS Monterey',
                        leading: const Icon(CommunityMaterialIcons.apple),
                        onTap: () => showItemsDialog(
                          context,
                          [
                            StandardDownloadItem(
                              title: '适用于 MacOS 64 位 (Apple 芯片) (包含 dotnet 6 运行时)',
                              subTitle: 'osx-arm64-single.pubxml',
                              onTap: () => beginDownload(context, 'osx-arm64-single.pubxml'),
                            ),
                            SizedBox(height: tilesPadding),
                            StandardDownloadItem(
                              title: '适用于 MacOS 64 位 (Intel 芯片) (包含 dotnet 6 运行时)',
                              subTitle: 'osx-x64-single.pubxml',
                              onTap: () => beginDownload(context, 'osx-x64-single.pubxml'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: tilesPadding),
                      StandardPlatformItem(
                        title: 'Android',
                        subTitle: 'Android 5.0+ supported',
                        leading: const Icon(CommunityMaterialIcons.android),
                        onTap: () => showItemsDialog(
                          context,
                          [
                            StandardDownloadItem(
                              title: '适用于 Android (包含多个架构支持)',
                              subTitle: 'kitx-mobile-release.apk',
                              onTap: () => beginDownload(context, 'kitx-mobile-release.apk'),
                            ),
                            SizedBox(height: tilesPadding),
                            StandardDownloadItem(
                              title: '适用于 Android arm 架构 64 位处理器 (ABIv8)',
                              subTitle: 'kitx-mobile-arm64-v8a-release.apk',
                              onTap: () => beginDownload(context, 'kitx-mobile-arm64-v8a-release.apk'),
                            ),
                            SizedBox(height: tilesPadding),
                            StandardDownloadItem(
                              title: '适用于 Android arm 架构处理器 (ABIv7)',
                              subTitle: 'kitx-mobile-armeabi-v7a-release.apk',
                              onTap: () => beginDownload(context, 'kitx-mobile-armeabi-v7a-release.apk'),
                            ),
                            SizedBox(height: tilesPadding),
                            StandardDownloadItem(
                              title: '适用于 Android x86 架构处理器 64 位',
                              subTitle: 'kitx-mobile-x86_64-release.apk',
                              onTap: () => beginDownload(context, 'kitx-mobile-x86_64-release.apk'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: tilesPadding),
                      StandardPlatformItem(
                        enabled: false,
                        title: 'iOS',
                        subTitle: 'No test yet',
                        leading: const Icon(CommunityMaterialIcons.apple_ios),
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () { },
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
