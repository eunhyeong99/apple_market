import 'package:apple_market_app/domain/model/product.dart';

abstract interface class ProductRepository{
  Future<List<Product>> getProducts();
  Future<Product?> getProduct(int id);
}