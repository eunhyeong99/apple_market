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
  bool _showFab = false;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 200 && !_showFab) {
        setState(() => _showFab = true);
      } else if (_scrollController.offset <= 200 && _showFab) {
        setState(() => _showFab = false);
      }
    });
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
                });
              }
            },
            child: ProductCard(product: product),
          );
        },
      ),
      floatingActionButton: AnimatedOpacity(
        opacity: _showFab ? 1.0 : 0.0, // fade 효과 적용
        duration: Duration(milliseconds: 300),
        child: _showFab
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
      ),
    );
  }
}
