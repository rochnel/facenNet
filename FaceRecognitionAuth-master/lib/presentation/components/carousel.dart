import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Slide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlayCurve: Curves.linear,
            viewportFraction: 1,
            enlargeFactor: 1,
            enlargeCenterPage: true,
            height: size.height * 0.3,
            autoPlay: true,
            autoPlayAnimationDuration: Duration(milliseconds: 500),
            enableInfiniteScroll: true,
          ),
          items: [
            "assets/images/evenement.jpg",
            "assets/images/evenement.jpg",
            "assets/images/evenement.jpg",
            "assets/images/evenement.jpg",
            "assets/images/evenement.jpg"
          ].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.28,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            image: AssetImage(i),
                            fit: BoxFit.cover,
                          ))),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}

class EventSlide extends StatelessWidget {
  final List images;
  const EventSlide(this.images);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlayCurve: Curves.linear,
            enlargeCenterPage: true,
            height: size.height * 0.3,
            autoPlay: true,
            autoPlayAnimationDuration: Duration(milliseconds: 500),
            enableInfiniteScroll: true,
          ),
          items: images.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.28,
                  child: Image(image: AssetImage(i)),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
