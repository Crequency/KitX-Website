import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kitx_website/pages/controls/drawer.dart';
import 'package:kitx_website/pages/controls/home_page_actions.dart';
import 'package:kitx_website/utils/global.dart';

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
    themeButtonInLightMode.value = !context.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text("KitX Website"),
        actions: getActions(context),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Container(
          width: 1200,
          margin: EdgeInsets.all(30),
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              margin: EdgeInsets.all(30),
              child: ListView(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(top: 25),
                    width: 192,
                    height: 192,
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.elliptical(15, 15)),
                      splashColor: context.iconColor?.withOpacity(0.3),
                      onTap: () {},
                      child: const Image(
                        alignment: Alignment.center,
                        image: AssetImage("assets/KitX-Icon-1920x-margin-2x.png"),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        const Text(
                          "KitX",
                          style: TextStyle(
                            fontSize: 50,
                          ),
                        ),
                        Obx(
                          () => Text(Global.versionString.value),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Divider(),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () { },
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
