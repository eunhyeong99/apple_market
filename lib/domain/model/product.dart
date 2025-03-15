import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
abstract class Product with _$Product {
  const factory Product({
    required int id,
    required String imgUrl,
    required String name,
    required String description,
    required String seller,
    required int price,
    required String address,
    required int good,
    required int chatCnt,
  }) = _Product;



  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}