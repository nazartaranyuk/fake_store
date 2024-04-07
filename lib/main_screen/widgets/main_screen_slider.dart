import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MainSlider extends StatelessWidget {
  const MainSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(items: [
      Container(
        width: 320,
        decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(15)),
        child: Icon(Icons.abc),
      ),
      Container(
        width: 320,
        decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(15)),
        child: Icon(Icons.safety_check),
      ),
      Container(
        width: 320,
        decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(15)),
        child: Icon(Icons.swap_vert),
      ),
    ], options: CarouselOptions(height: 300));
  }
}
