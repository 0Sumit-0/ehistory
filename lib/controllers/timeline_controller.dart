import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/timeline.dart';

class TimelineController extends GetxController {
  // var timelineList = <TimelineModel>[
  //   TimelineModel(title: 'Event 1', description: 'Description 1'),
  //   TimelineModel(title: 'Event 2', description: 'Description 2'),
  // ].obs;

  late PageController pageController;
  RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: currentIndex.value);
    pageController.addListener(() {
      currentIndex.value = pageController.page?.round() ?? 0;
    });
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
