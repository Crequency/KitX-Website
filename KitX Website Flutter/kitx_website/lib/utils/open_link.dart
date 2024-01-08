import 'dart:js' as js;

import 'package:kitx_website/utils/global.dart';

var links = [
  ['GitHubRepo_KitX', 'https://github.com/Crequency/KitX'],
  ['GitHubRepo_KitX-Mobile', 'https://github.com/Crequency/KitX-Mobile'],
  ['GitHubRepo_KitX-Website', 'https://github.com/Crequency/KitX-Website'],
  ['Docs_KitX', 'https://kitx.docs.catrol.cn/'],
  ['Home_Page', 'https://kitx.apps.catrol.cn/'],
];

void openLink(String key) {
  Global.delay(
    () => js.context.callMethod('open', [links.firstWhere((element) => element[0] == key)[1]]),
    200,
  );
}
