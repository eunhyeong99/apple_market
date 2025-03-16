import 'package:apple_market_app/core/storage/product_storage.dart';
import 'package:apple_market_app/domain/model/product.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatefulWidget {
  final Product product;

  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late bool likeBtn;
  late int likeCount;
  final ProductStorage _productStorage = ProductStorage();

  @override
  void initState() {
    super.initState();
    likeBtn = false;
    likeCount = widget.product.good;

    _loadLikeState();
  }

  void _loadLikeState() async {
    final productData = await _productStorage.getLikeState(widget.product.id);
    if (productData != null) {
      setState(() {
        likeCount = productData['good'];
        likeBtn = productData['isLiked'] ?? false;
      });
    }
  }

  void toggleLike() async {
    setState(() {
      likeBtn = !likeBtn;
      likeCount = likeBtn ? likeCount + 1 : likeCount - 1;
    });

    await _productStorage.updateLikeState(widget.product.id, likeCount, likeBtn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상품 상세'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
              context,
              widget.product.copyWith(good: likeCount, isLiked: likeBtn),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 정렬 수정
          children: [
            Image.asset(
              'asset/image/${widget.product.imgUrl}.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 250,
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.orange.shade500,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.seller,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.product.address,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "39.3℃",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("매너온도", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(thickness: 2),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.product.description,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.shade300)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: toggleLike, // ✅ 좋아요 클릭 이벤트 추가
              child: Row(
                children: [
                  Icon(
                    likeBtn ? Icons.favorite : Icons.favorite_border,
                    color: likeBtn ? Colors.red : Colors.grey,
                  ),
                  SizedBox(width: 4),
                  Text("$likeCount"),
                ],
              ),
            ),
            Text(
              "${NumberFormat('#,###').format(widget.product.price)}원",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[800],
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: Text(
                "채팅하기",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
