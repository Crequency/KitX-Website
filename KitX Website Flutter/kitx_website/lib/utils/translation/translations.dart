import 'package:get/get.dart';
import 'package:kitx_website/utils/translation/en_us.dart';
import 'package:kitx_website/utils/translation/zh_cn.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': zh_CN,
        'en_US': en_US,
      };
}
