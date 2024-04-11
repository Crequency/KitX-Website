import 'package:flutter/material.dart';

var tileRadius = ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10.0));

Widget listTileItem({
  bool? enabled,
  String? title,
  String? subTitle,
  ShapeBorder? shape,
  Widget? leading,
  Widget? trailing,
  void Function()? onTap,
}) {
  return ListTile(
    enabled: enabled ?? true,
    title: Text(title!),
    subtitle: Text(subTitle!),
    shape: shape ?? tileRadius,
    leading: leading,
    trailing: trailing,
    onTap: onTap,
  );
}

Widget standardPlatformItem({
  bool? enabled,
  String? title,
  String? subTitle,
  Widget? leading,
  void Function()? onTap,
}) {
  return listTileItem(
    enabled: enabled ?? true,
    title: title,
    subTitle: subTitle,
    shape: tileRadius,
    leading: leading,
    trailing: const Icon(Icons.keyboard_arrow_right),
    onTap: onTap,
  );
}

Widget standardDownloadItem({
  bool? enabled,
  String? title,
  String? subTitle,
  Widget? trailing,
  void Function()? onTap,
}) {
  return listTileItem(
    enabled: enabled ?? true,
    title: title,
    subTitle: subTitle,
    shape: tileRadius,
    leading: null,
    trailing: trailing ?? const Icon(Icons.download),
    onTap: onTap,
  );
}
