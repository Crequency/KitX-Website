import 'package:flutter/material.dart';
import 'package:kitx_website/shared/plugin_info.dart';

class PluginCard extends StatelessWidget {
  const PluginCard({
    required this.info,
  });

  final PluginInfo info;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: const SizedBox(
        width: 200,
        height: 300,
      ),
    );
  }
}
