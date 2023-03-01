import 'package:url_launcher/url_launcher_string.dart';

import 'package:kitx_website/utils/global.dart';

var links = [
  ['GitHubRepo_KitX', 'https://github.com/Crequency/KitX'],
  ['GitHubRepo_KitX-Mobile', 'https://github.com/Crequency/KitX-Mobile'],
  ['GitHubRepo_KitX-Website', 'https://github.com/Crequency/KitX-Website'],
  ['Docs_KitX', 'https://docs.catrol.cn/apps/kitx/']
];

void openLink(String key) {
  Global.delay(() => launchUrlString(links.firstWhere((element) => element[0] == key)[1]), 200);
}
