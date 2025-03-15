import 'package:apple_market_app/core/di/di.dart';
import 'package:apple_market_app/domain/usecase/get_products_use_case.dart';
import 'package:apple_market_app/presentation/main/screen/main_screen.dart';
import 'package:flutter/material.dart';

import '../../../domain/model/product.dart';


class MainRoot extends StatefulWidget {
  const MainRoot({super.key});

  @override
  State<MainRoot> createState() => _MainRootState();
}

class _MainRootState extends State<MainRoot> {
  var isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: FutureBuilder<List<Product>>(
        future: getIt<GetProductsUseCase>().execute(), // 비동기 호출
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("데이터를 불러오는 중 오류 발생"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("상품이 없습니다."));
          }

          final products = snapshot.data!;

          return MainScreen(products: products);
        },
      ),
    );
  }

  AppBar appBar(){
    return AppBar(
      backgroundColor: Colors.deepPurple[50],
      title: Text('르탄동'),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: isClicked ? Text('르탄동 알람을 활성화 했습니다!') :  Text('르탄동 알람을 비활성화 했습니다!'),
                  duration: Duration(seconds: 1),
                ),
              );
              setState(() {
                isClicked == false ? isClicked = true : isClicked = false;
              });
            },
            child: Icon(
              isClicked ? Icons.notifications_outlined : Icons.notifications,
            ),
          ),
        ),
      ],
    );
  }

}

