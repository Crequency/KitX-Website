import 'package:get/get.dart';

/// Translation Data
class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': {
          'Public_Docs': '文档',
          'Home_Page': '主页',
          'Plugins_Page': '插件市场',
          'Download_Tested': '在 %content% 上通过测试',
          'Download_Supported': '支持 %content%',
          'Download_NoTest': '尚未测试',
          'Download_ApplyTo': '适用于 %content%',
          'Bits_32': '32 位',
          'Bits_64': '64 位',
          'CPU_Bits_32': '32 位处理器',
          'CPU_Bits_64': '64 位处理器',
          'CPU_x86': 'x86 架构处理器',
          'CPU_x86_64': 'x86 架构 64 位处理器',
          'CPU_ARM': 'arm 架构处理器',
          'CPU_ARM64': 'arm 架构 64 位处理器',
          'CPU_Intel': 'Intel 芯片',
          'CPU_Apple': 'Apple 芯片',
          'With_Runtime': '包含 %runtime% 运行时',
          'MultiArchSupport': '包含多个架构支持',
        },
        'en_US': {
          'Public_Docs': 'Docs',
          'Home_Page': 'Home Page',
          'Plugins_Page': 'Plugins Market',
          'Download_Tested': 'Tested on %content%',
          'Download_Supported': '%content% supported',
          'Download_NoTest': 'No test yet',
          'Download_ApplyTo': 'Apply to %content%',
          'Bits_32': '32 bits',
          'Bits_64': '64 bits',
          'CPU_Bits_32': '32 bits CPU',
          'CPU_Bits_64': '64 bits CPU',
          'CPU_x86': 'x86 CPU',
          'CPU_x86_64': 'x86 CPU 64 bits',
          'CPU_ARM': 'arm CPU',
          'CPU_ARM64': 'arm CPU 64 bits',
          'CPU_Intel': 'Intel CPU',
          'CPU_Apple': 'Apple CPU',
          'With_Runtime': 'with %runtime% runtime',
          'MultiArchSupport': 'Support multi architectures',
        }
      };
}
