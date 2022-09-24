import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class Global {
  static List videoPath = [
    {"title": "SeeView Video", "path": "assets/videos/1.mp4"},
    {"title": "Clouds Video", "path": "assets/videos/2.mp4"},
    {"title": "SunRaise Video", "path": "assets/videos/3.mp4"},
    {"title": "Nature Video", "path": "assets/videos/4.mp4"},
    {"title": "Birds Video", "path": "assets/videos/5.mp4"},
  ];

  static List<VideoPlayerController> controller = [];
  static List<ChewieController> chewieController = [];
}
