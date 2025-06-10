import 'package:flutter/material.dart';

class DownloadVersionChip extends StatelessWidget {
  final String label;
  final EdgeInsetsGeometry padding;
  final AlignmentGeometry alignment;

  const DownloadVersionChip({
    Key? key,
    required this.label,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    this.alignment = Alignment.centerLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: padding,
        child: Chip(
          label: Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
