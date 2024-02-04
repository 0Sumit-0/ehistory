import 'package:ehistory/util/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/timeline_controller.dart';
import '../model/timeline.dart';


class HomeScreen extends StatelessWidget {
  final TimelineController timelineController = Get.put(TimelineController());

  @override
  Widget build(BuildContext context) {
    double width =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timeline App'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Obx(
                  () => SizedBox(
                    width: width/1.5,
                    child: LinearProgressIndicator(
                value: (timelineController.currentIndex.value + 1) /
                      mytimeline.length,
                color: Colors.blue,
              ),
                  ),
            ),
            Expanded(
              child: PageView.builder(
                controller: timelineController.pageController,
                itemCount: mytimeline.length,
                itemBuilder: (context, index) {
                  var event = mytimeline[index];
                  return TimelineCard(event: event);
                },
                onPageChanged: (index) {
                  timelineController.currentIndex.value = index;
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}


class TimelineCard extends StatelessWidget {
  final TimelineModel event;

  const TimelineCard({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(event.description),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      event.url,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

