import 'package:flutter/material.dart';

class FdroidIconButton extends StatelessWidget {
  final double size;

  final bool wrapInkWell;
  final bool wrapChip;

  const FdroidIconButton({Key? key, this.size = 30, this.wrapInkWell = false, this.wrapChip = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var image = Padding(
      padding: EdgeInsets.all(2),
      child: Image(
        width: size,
        height: size,
        alignment: Alignment.center,
        image: const AssetImage('assets/ThirdParty/fdroid-logo.png'),
        fit: BoxFit.fitWidth,
      ),
    );

    if (wrapInkWell) {
      return InkWell(
        radius: 25,
        onTap: () {},
        child: image,
      );
    } else if (wrapChip) {
      return Chip(label: image);
    } else {
      return image;
    }
  }
}
