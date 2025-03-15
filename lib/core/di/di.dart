import 'package:apple_market_app/data/data_source/product_data.dart';
import 'package:apple_market_app/data/repository/product_repository_impl.dart';
import 'package:apple_market_app/domain/repository/product_repository.dart';
import 'package:apple_market_app/domain/usecase/get_products_use_case.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<ProductData>(ProductData());
  getIt.registerSingleton<ProductRepository>(
    ProductRepositoryImpl(productData: getIt()),
  );

  getIt.registerFactory(()=>GetProductsUseCase(productRepository: getIt()));
}
