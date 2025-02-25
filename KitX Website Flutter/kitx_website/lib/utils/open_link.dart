import 'package:kitx_website/utils/global.dart';
import 'package:web/web.dart' as web;

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
      () => web.window.open(links.firstWhere((element) => element[0] == key)[1]),
      200,
    );
  } else {
    web.window.open(links.firstWhere((element) => element[0] == key)[1]);
  }
}
