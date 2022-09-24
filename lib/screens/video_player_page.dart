import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import '../global.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({Key? key}) : super(key: key);

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  @override
  void dispose() {
    super.dispose();

    for (var e in Global.chewieController) {
      e.pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Player"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExpansionPanelList.radio(
              expansionCallback: (i, __) {
                Global.chewieController[i].pause();
              },
              children: Global.videoPath.map((e) {
                return ExpansionPanelRadio(
                  canTapOnHeader: true,
                  value: e,
                  headerBuilder: (context, isExpanded) {
                    return ListTile(
                      title: Text(
                        e["title"],
                        style: const TextStyle(color: Colors.black),
                      ),
                    );
                  },
                  body: Container(
                    height: 250,
                    alignment: Alignment.center,
                    child: AspectRatio(
                      aspectRatio: Global
                          .controller[Global.videoPath.indexOf(e)]
                          .value
                          .aspectRatio,
                      child: Chewie(
                        controller: Global
                            .chewieController[Global.videoPath.indexOf(e)],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
