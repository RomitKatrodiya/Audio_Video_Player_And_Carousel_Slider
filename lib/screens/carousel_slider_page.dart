import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselSliderPage extends StatefulWidget {
  const CarouselSliderPage({Key? key}) : super(key: key);

  @override
  State<CarouselSliderPage> createState() => _CarouselSliderPageState();
}

class _CarouselSliderPageState extends State<CarouselSliderPage> {
  int photoIndex = 0;
  bool autoPlay = false;

  List images = [
    "https://adminassets.devops.arabiaweather.com/sites/default/files/field/image/mountains.jpg",
    "https://i.pinimg.com/originals/24/8d/f5/248df520ef2048d0614c73f90b9de4ab.jpg",
    "https://www.wallpaperup.com/uploads/wallpapers/2017/06/16/1092450/5d1c77bc2dd6e90d46844050ef9cd03e-700.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKrc_Bm0yfPwvLpx6f9cxPaE7QAWG6P43A4m0ckU-eJdPrH2FI5xcXGmXmTocARfsghAk&usqp=CAU",
    "https://images.unsplash.com/photo-1510459473672-32f52bea735b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8bW91bnRhaW4lMjB0b3B8ZW58MHx8MHx8&w=1000&q=80",
    "https://thumbs.dreamstime.com/b/morning-mountain-mist-16583760.jpg",
    "https://www.wallpapertip.com/wmimgs/81-815873_waterfalls-hd-wallpapers-ban-gioc-waterfall.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Carousel Slider"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            autoPlay = !autoPlay;
          });
        },
        elevation: 0,
        child: Icon((autoPlay) ? Icons.pause : Icons.play_arrow),
      ),
      body: Container(
        color: Colors.blueAccent.withOpacity(0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: autoPlay,
                initialPage: photoIndex,
                clipBehavior: Clip.hardEdge,
                onPageChanged: (i, _) {
                  setState(() {
                    photoIndex = i;
                  });
                },
                height: MediaQuery.of(context).size.height * 0.61,
                viewportFraction: 0.8,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              items: images.map((e) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color(0xff00B0FF).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: NetworkImage(e),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            AnimatedSmoothIndicator(
              activeIndex: photoIndex,
              count: images.length,
              effect: const WormEffect(),
            )
          ],
        ),
      ),
    );
  }
}
