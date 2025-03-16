import 'package:carousel_slider/carousel_slider.dart';
import 'package:cash_app/data/data.dart';
import 'package:flutter/material.dart';


class PromoBanner extends StatelessWidget {
  const PromoBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: CarouselSlider(
        
        items: promos.map((e) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(e.image),fit: BoxFit.cover),
          ),
        )).toList(),
        options: CarouselOptions(
          scrollPhysics: NeverScrollableScrollPhysics(),
          autoPlayInterval: Duration(seconds: 5),
          viewportFraction: 1.0,
          autoPlay: true,
          reverse: true,
          enableInfiniteScroll: true,
          scrollDirection: Axis.vertical,
        ),
      ),
    );
  }
}