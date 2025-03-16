import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProductStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final String _storageKey = "product_data";


  Future<void> saveProducts(List<Map<String, dynamic>> products) async {
    String jsonData = jsonEncode(products);  // JSON 문자열 변환
    await _storage.write(key: _storageKey, value: jsonData);
  }


  Future<List<Map<String, dynamic>>> loadProducts() async {
    String? jsonData = await _storage.read(key: _storageKey);
    if (jsonData == null) {
      return [];
    }
    final result = List<Map<String, dynamic>>.from(jsonDecode(jsonData));
    return result;
  }

  Future<void> clearProducts() async {
    await _storage.delete(key: _storageKey);
  }

  Future<void> updateLikeState(int productId, int likeCount, bool isLiked) async {
    List<Map<String, dynamic>> products = await loadProducts();
    for (var product in products) {
      if (product['id'] == productId) {
        product['good'] = likeCount;
        product['isLiked'] = isLiked;
        break;
      }
    }
    await saveProducts(products);
  }
  Future<Map<String, dynamic>?> getLikeState(int productId) async {
    List<Map<String, dynamic>> products = await loadProducts();
    for (var product in products) {
      if (product['id'] == productId) {
        return product;
      }
    }
    return null;
  }


}