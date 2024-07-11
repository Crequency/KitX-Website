import 'package:flutter/material.dart';
import 'package:kitx_website/pages/controls/download_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            width: 500,
            margin: EdgeInsets.all(30),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                margin: EdgeInsets.all(30),
                child: getDownloadList(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
