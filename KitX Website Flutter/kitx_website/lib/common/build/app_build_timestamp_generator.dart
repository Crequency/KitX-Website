import 'dart:io';

import 'package:build/build.dart';

Builder appBuildTimestampGenerator(BuilderOptions options) => AppBuildTimestampGeneratorBuilder();

class AppBuildTimestampGeneratorBuilder implements Builder {
  @override
  final buildExtensions = {
    '.dart': ['.my_gen.dart']
  };

  @override
  Future<void> build(BuildStep _) async {
    final outputFile = File('lib/common/build/app_build_timestamp.g.dart');
    await outputFile.writeAsString('''
// Generated file on build.

/// Timestamp that records last build of the app. Can be shown in the app.
const int lastAppBuildTimestamp = ${DateTime.now().millisecondsSinceEpoch};
''');
  }
}
