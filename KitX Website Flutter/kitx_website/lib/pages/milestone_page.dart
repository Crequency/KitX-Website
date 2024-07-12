import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

    return Center(
      child: Timeline.tileBuilder(
        padding: EdgeInsets.symmetric(vertical: 20),
        physics: BouncingScrollPhysics(),
        builder: TimelineTileBuilder.fromStyle(
          contentsAlign: ContentsAlign.alternating,
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
              const SizedBox(width: 10),
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
                crossAxisAlignment: index % 2 == 0 ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: index % 2 == 0 ? MainAxisAlignment.start : MainAxisAlignment.end,
                    children: index % 2 == 0 ? head : head.reversed.toList(),
                  ),
                  Text(
                    milestone.event,
                    style: context.textTheme.bodyLarge,
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
