import 'dart:convert';

import 'package:fake_store/main_screen/network/product.dart';
import 'package:http/http.dart' as http;


class ProductsApi {
  
  Future<List<Product>?> getAllProducts() async {
    var client = http.Client();
    var uri = Uri.parse("https://api.escuelajs.co/api/v1/products");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return productFromJson(const Utf8Decoder().convert(response.bodyBytes));
    }
    return null;
  }
}