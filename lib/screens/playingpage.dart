import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/audio_controller.dart';

class AudioPlayerScreen extends StatelessWidget {
  final AudioController audioController = Get.put(AudioController());

  final String _currentUrl="audio/test.mp3";
  final String _imgUrl="assets/image/ram1.jpg";
  final String _imageUrl="assets/image/ram2.jpg";

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Listen Bajan',),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          // ClipRRect(
          //   child: Image.asset(
          //     _imageUrl,
          //     fit: BoxFit.fill,
          //     width: width,
          //     height: height,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width/1.2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              _imgUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Obx(
                            () => Text(
                          '${audioController.playbackTime.value.toInt()} / ${audioController.totalDuration.value.toInt()} seconds',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Obx(() => Slider(
                        value: audioController.playbackTime.value,
                        max: audioController.totalDuration.value,
                        onChanged: (value) {
                          audioController.playbackTime.value=value;
                        },
                        onChangeStart: (value){
                          if(audioController.isPlaying.value) {
                            audioController.playPause(_currentUrl);
                          }
                        },
                        onChangeEnd: (value) {
                          audioController.seek(value);
                          audioController.playPause(_currentUrl);
                        },
                      )),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.skip_previous),
                            onPressed: () {
                              // Implement backward logic
                            },
                          ),
                          IconButton(
                            icon: Obx(() {
                              return Icon(
                                audioController.isPlaying.value
                                    ? Icons.pause
                                    : Icons.play_arrow,
                              );
                            }),
                            onPressed: () {
                              audioController.playPause(_currentUrl);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.skip_next,),
                            onPressed: () {
                              // Implement forward logic
                            },
                          ),
                        ],
                      ),
                    ],
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
