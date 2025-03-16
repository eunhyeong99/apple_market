import 'package:apple_market_app/data/data_source/product_data.dart';
import 'package:apple_market_app/data/repository/product_repository_impl.dart';
import 'package:apple_market_app/domain/repository/product_repository.dart';
import 'package:apple_market_app/domain/usecase/get_products_use_case.dart';
import 'package:get_it/get_it.dart';

import '../storage/product_storage.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerLazySingleton<ProductStorage>(() => ProductStorage());
  getIt.registerLazySingleton<ProductData>(() => ProductData());
  getIt.registerLazySingleton<ProductRepository>(
        () => ProductRepositoryImpl(productData: getIt<ProductData>()),
  );
  getIt.registerLazySingleton<GetProductsUseCase>(
        () => GetProductsUseCase(productRepository: getIt<ProductRepository>()),
  );
}
