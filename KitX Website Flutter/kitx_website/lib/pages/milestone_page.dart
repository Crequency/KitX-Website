import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitx_website/data/milestones.dart';
import 'package:timelines/timelines.dart';

class MilestonesPage extends StatefulWidget {
  const MilestonesPage({super.key});

  @override
  _MilestonesPageState createState() => _MilestonesPageState();
}

class _MilestonesPageState extends State<MilestonesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var milestones = getMilestones(Get.locale!);

    var isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Center(
      child: Timeline.tileBuilder(
        padding: EdgeInsets.symmetric(vertical: 20),
        theme: TimelineThemeData.fallback().copyWith(color: context.iconColor, nodePosition: isLandscape ? null : 0.1),
        physics: BouncingScrollPhysics(),
        builder: TimelineTileBuilder.fromStyle(
          contentsAlign: isLandscape ? ContentsAlign.alternating : ContentsAlign.basic,
          indicatorStyle: IndicatorStyle.outlined,
          contentsBuilder: (context, index) {
            var milestone = milestones[index];
            var date = milestone.dateTime;
            var dateString = '${date.year}.${date.month}.${date.day}';

            var head = [
              Flexible(
                child: Tooltip(
                  message: milestone.title,
                  child: Text(
                    milestone.title,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.headlineSmall,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.5),
                  border: Border.all(color: Colors.blueGrey, width: 1),
                ),
                child: Text(
                  dateString,
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ),
            ];

            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: isLandscape ? (index % 2 == 0 ? CrossAxisAlignment.start : CrossAxisAlignment.end) : CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: isLandscape ? (index % 2 == 0 ? MainAxisAlignment.start : MainAxisAlignment.end) : MainAxisAlignment.start,
                      children: isLandscape ? (index % 2 == 0 ? head : head.reversed.toList()) : head,
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        milestone.event,
                        style: context.textTheme.bodyLarge,
                        textAlign: isLandscape ? (index % 2 == 0 ? TextAlign.left : TextAlign.right) : TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: milestones.length,
        ),
      ),
    );
  }
}
