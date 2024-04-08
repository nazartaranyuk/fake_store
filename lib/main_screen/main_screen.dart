import 'package:fake_store/main_screen/network/product.dart';
import 'package:fake_store/main_screen/network/products_service.dart';
import 'package:fake_store/main_screen/widgets/main_screen_slider.dart';
import 'package:fake_store/pdp_screen/pdp_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({super.key});

  @override
  State<MainScreenPage> createState() => MainScreenPageState();
}

class MainScreenPageState extends State<MainScreenPage> {
  List<Product>? products;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    loadAllProducts();
  }

  Future<List<Product>?> loadAllProducts() async {
    var service = ProductsService();
    products = await service.getProducts();
    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return isLoaded && products != null
        ? SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          MainSlider(
                              products:
                                  products),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "Products",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.playfairDisplay(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                          GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            children: products!
                                .map((product) => Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetailsPage(
                                                product: product,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Stack(
                                          children: [
                                            ClipRRect(
                                              child: Image.network(
                                                product.images.first,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Positioned.fill(
                                              bottom: 12,
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    print('Widget 1 clicked!');
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            ProductDetailsPage(
                                                          product: product,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Text("SHOP NOW",
                                                      style: GoogleFonts.workSans(
                                                          textStyle: const TextStyle(
                                                              fontSize: 16,
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                              decorationColor:
                                                                  Colors.black,
                                                              decorationThickness:
                                                                  3))),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
