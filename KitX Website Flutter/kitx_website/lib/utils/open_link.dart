import 'dart:js' as js;

import 'package:kitx_website/utils/global.dart';

var links = [
  ['GitHubRepo_KitX', 'https://github.com/Crequency/KitX'],
  ['GitHubRepo_KitX_Releases', 'https://github.com/Crequency/KitX/releases'],
  ['GitHubRepo_KitX-Mobile', 'https://github.com/Crequency/KitX-Mobile'],
  ['GitHubRepo_KitX-Mobile_Releases', 'https://github.com/Crequency/KitX-Mobile/releases'],
  ['GitHubRepo_KitX-Website', 'https://github.com/Crequency/KitX-Website'],
  ['Docs_KitX', 'https://kitx.docs.catrol.cn/'],
  ['Home_Page', 'https://kitx.apps.catrol.cn/'],
  ['F-Droid-KitX-Mobile', 'https://f-droid.org/packages/com.crequency.kitx.mobile/']
];

void openLink(String key, {bool delay = true}) {
  if (delay) {
    app.delay(
      () => js.context.callMethod('open', [links.firstWhere((element) => element[0] == key)[1]]),
      200,
    );
  } else {
    js.context.callMethod('open', [links.firstWhere((element) => element[0] == key)[1]]);
  }
}
