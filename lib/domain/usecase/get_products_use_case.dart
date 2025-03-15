import 'package:apple_market_app/domain/repository/product_repository.dart';

import '../model/product.dart';

class GetProductsUseCase {
  final ProductRepository _productRepository;

  GetProductsUseCase({required ProductRepository productRepository})
    : _productRepository = productRepository;

  Future<List<Product>> execute() async{
    return await _productRepository.getProducts();
  }
}
