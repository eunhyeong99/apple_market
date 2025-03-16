import 'package:apple_market_app/core/storage/product_storage.dart';
import 'package:apple_market_app/data/data_source/product_data.dart';
import 'package:apple_market_app/domain/model/product.dart';
import 'package:apple_market_app/presentation/detail/detail_screen.dart';
import 'package:flutter/material.dart';

import '../components/product_card.dart';

class MainScreen extends StatefulWidget {
  final List<Product> products;

  const MainScreen({super.key, required this.products});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ScrollController _scrollController = ScrollController();
  final ProductStorage _productStorage = ProductStorage();
  final ProductData _productData = ProductData();
  bool _showFab = false;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();

    _productData.resetProducts();

    _scrollController.addListener(() {
      if (_scrollController.offset > 200 && !_showFab) {
        setState(() => _showFab = true);
      } else if (_scrollController.offset <= 200 && _showFab) {
        setState(() => _showFab = false);
      }
    });

    _loadProducts();
  }

  void _loadProducts() async {
    List<Map<String, dynamic>> storedProducts =
        await _productStorage.loadProducts();
    if (storedProducts.isNotEmpty) {
      setState(() {
        widget.products.clear();
        widget.products.addAll(
          storedProducts.map((e) => Product.fromJson(e)).toList(),
        );
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    setState(() => _isPressed = true);
    _scrollController.animateTo(
      0.0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() => _isPressed = false);
    });
  }

  void _deleteProduct(int index) async {
    final deletedProduct = widget.products[index];

    bool? confirmDelete = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("상품 삭제"),
          content: Text("정말 '${deletedProduct.name}'을(를) 삭제하시겠습니까?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text("취소"),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text("확인"),
            ),
          ],
        );
      },
    );
    if (confirmDelete == true) {
      setState(() {
        widget.products.removeAt(index);
      });

      await _productStorage.saveProducts(
        widget.products.map((e) => e.toJson()).toList(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        controller: _scrollController,
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          final product = widget.products[index];
          return GestureDetector(
            onTap: () async {
              final updatedProduct = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => DetailScreen(product: product),
                ),
              );

              if (updatedProduct != null) {
                setState(() {
                  widget.products[index] = updatedProduct;
                  _productStorage.updateLikeState(
                    updatedProduct.id,
                    updatedProduct.good,
                    updatedProduct.isLiked,
                  );
                });
              }
            },
            onLongPress: ()=>_deleteProduct(index),
            child: ProductCard(product: product),
          );
        },
      ),
      floatingActionButton:
          _showFab
              ? FloatingActionButton(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                onPressed: _scrollToTop,
                child: Icon(
                  _isPressed ? Icons.check : Icons.arrow_upward,
                  color: Colors.grey,
                ),
              )
              : SizedBox(),
    );
  }
}
