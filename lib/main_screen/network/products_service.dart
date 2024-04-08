import 'package:fake_store/main_screen/network/product.dart';
import 'package:fake_store/main_screen/network/products_api.dart';

class ProductsService {
  final _api = ProductsApi();
  Future<List<Product>?> getProducts() async {
    return _api.getAllProducts();
  }
}