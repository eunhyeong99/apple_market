// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  id: (json['id'] as num).toInt(),
  imgUrl: json['imgUrl'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  seller: json['seller'] as String,
  price: (json['price'] as num).toInt(),
  address: json['address'] as String,
  good: (json['good'] as num).toInt(),
  chatCnt: (json['chatCnt'] as num).toInt(),
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'id': instance.id,
  'imgUrl': instance.imgUrl,
  'name': instance.name,
  'description': instance.description,
  'seller': instance.seller,
  'price': instance.price,
  'address': instance.address,
  'good': instance.good,
  'chatCnt': instance.chatCnt,
};
