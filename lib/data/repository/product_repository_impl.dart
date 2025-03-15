import 'package:apple_market_app/data/data_source/product_data.dart';
import 'package:apple_market_app/domain/model/product.dart';
import 'package:apple_market_app/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductData _productData;

  ProductRepositoryImpl({required ProductData productData})
    : _productData = productData;

  @override
  Future<Product?> getProduct(int id) async {
    final result = await getProducts();
    return result.where((e) => e.id == id).firstOrNull;
  }

  @override
  Future<List<Product>> getProducts() async {
    final products = await _productData.getProducts();
    final result = products.map((e) => Product.fromJson(e)).toList();
    return result;
  }
}
