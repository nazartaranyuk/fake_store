import 'package:carousel_slider/carousel_slider.dart';
import 'package:fake_store/main_screen/network/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MainSlider extends StatelessWidget {
  MainSlider({super.key, required this.products});

  List<Product>? products;

  @override
  Widget build(BuildContext context) {
    var carouselController = CarouselController();
    return CarouselSlider(
      items: products
          ?.map(
            (product) => Stack(
              children: [
                ClipRRect(
                  child: Image.network(product.images.first),
                ),
                Positioned(
                  right: 93,
                  bottom: 33,
                  child: Container(
                    width: 51,
                    height: 51,
                    decoration: const BoxDecoration(color: Colors.black),
                    child: IconButton(
                      onPressed: () {
                        carouselController.previousPage();
                      },
                      icon: SvgPicture.asset("assets/ic_white_left_arrow.svg"),
                    ),
                  ),
                ),
                Positioned(
                  right: 33,
                  bottom: 33,
                  child: Container(
                    width: 51,
                    height: 51,
                    decoration: const BoxDecoration(color: Colors.black),
                    child: IconButton(
                      onPressed: () {
                        carouselController.nextPage();
                      },
                      icon: SvgPicture.asset("assets/ic_white_right_arrow.svg"),
                    ),
                  ),
                ),
                Positioned(
                  width: 150,
                  right: 23,
                  bottom: 100,
                  child: Text(
                    product.title,
                    style: GoogleFonts.playfairDisplay(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
          .toList(),
      options: CarouselOptions(height: 300),
      carouselController: carouselController,
    );
  }
}
