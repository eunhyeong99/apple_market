import 'dart:convert';

import 'package:apple_market_app/core/storage/product_storage.dart';
import 'package:apple_market_app/domain/model/product.dart';

class ProductData {
  final _mockProductData = {
    'products': [
      {
        "id": 1,
        "imgUrl": "sample1",
        "name": "산진 한달된 선풍기 팝니다",
        "description": "이사가서 필요가 없어졌어요 급하게 내놓습니다",
        "seller": "대현동",
        "price": 1000,
        "address": "서울 서대문구 창천동",
        "good": 13,
        "chatCnt": 25,
        "isLiked": false,
      },
      {
        "id": 2,
        "imgUrl": "sample2",
        "name": "김치냉장고",
        "description": "이사로 인해 내놔요",
        "seller": "안마담",
        "price": 20000,
        "address": "인천 계양구 귤현동",
        "good": 8,
        "chatCnt": 28,
        "isLiked": false,
      },
      {
        "id": 3,
        "imgUrl": "sample3",
        "name": "샤넬 카드지갑",
        "description": "고퀄지갑이구요\n사용감이 있어서 싸게 내어둡니다",
        "seller": "코코유",
        "price": 10000,
        "address": "수성구 범어동",
        "good": 23,
        "chatCnt": 5,
        "isLiked": false,
      },
      {
        "id": 4,
        "imgUrl": "sample4",
        "name": "금고",
        "description": "금고\n떼서 가져가야함\n대우월드마크센텀\n미국이주관계로 싸게 팝니다",
        "seller": "Nicole",
        "price": 10000,
        "address": "해운대구 우제2동",
        "good": 14,
        "chatCnt": 17,
        "isLiked": false,
      },
      {
        "id": 5,
        "imgUrl": "sample5",
        "name": "갤럭시Z플립3 팝니다",
        "description":
            "갤럭시 Z플립3 그린 팝니다\n항시 케이스 씌워서 썻고 필름 한장챙겨드립니다\n화면에 살짝 스크래치난거 말고 크게 이상은없습니다!",
        "seller": "절명",
        "price": 150000,
        "address": "연제구 연산제8동",
        "good": 22,
        "chatCnt": 9,
        "isLiked": false,
      },
      {
        "id": 6,
        "imgUrl": "sample6",
        "name": "프라다 복조리백",
        "description": "까임 오염없고 상태 깨끗합니다\n정품여부모름",
        "seller": "미니멀하게",
        "price": 50000,
        "address": "수원시 영통구 원천동",
        "good": 25,
        "chatCnt": 16,
        "isLiked": false,
      },
      {
        "id": 7,
        "imgUrl": "sample7",
        "name": "울산 동해오션뷰 60평 복층 펜트하우스 1일 숙박권 펜션 힐링 숙소 별장",
        "description":
            "울산 동해바다뷰 60평 복층 펜트하우스 1일 숙박권\n(에어컨이 없기에 낮은 가격으로 변경했으며 8월 초 가장 더운날 다녀가신 분 경우 시원했다고 잘 지내다 가셨습니다)\n"
            "1. 인원: 6명 기준입니다. 1인 10,000원 추가요금\n"
            "2. 장소: 북구 블루마시티, 32-33층\n"
            "3. 취사도구, 침구류, 세면도구, 드라이기 2개, 선풍기 4대 구비\n"
            "4. 예약방법: 예약금 50,000원 하시면 저희는 명함을 드리며 입실 오전 잔금 입금하시면 동.호수를 알려드리며 고객님은 예약자분 신분증 앞면 주민번호 뒷자리 가리시거나 지우시고 문자로 보내주시면 저희는 카드키를 우편함에 놓아 둡니다.\n"
            "5. 33층 옥상 야외 테라스 있음, 가스버너 있음\n"
            "6. 고기 굽기 가능\n"
            "7. 입실 오후 3시, 오전 11시 퇴실, 정리, 정돈 , 밸브 잠금 부탁드립니다.\n"
            "8. 층간소음 주의 부탁드립니다.\n"
            "9. 방3개, 화장실3개, 비데 3개\n"
            "10. 저희 집안이 쓰는 별장입니다.",
        "seller": "굿리치",
        "price": 150000,
        "address": "남구 옥동",
        "good": 142,
        "chatCnt": 54,
        "isLiked": false,
      },
      {
        "id": 8,
        "imgUrl": "sample8",
        "name": "샤넬 탑핸들 가방",
        "description":
            "샤넬 트랜디 CC 탑핸들 스몰 램스킨 블랙 금장 플랩백!\n"
            "색상: 블랙\n"
            "사이즈: 25.5cm * 17.5cm * 8cm\n"
            "구성: 본품더스트\n"
            "급하게 돈이 필요해서 팝니다 ㅠㅠ",
        "seller": "난쉽",
        "price": 180000,
        "address": "동래구 온천제2동",
        "good": 31,
        "chatCnt": 7,
        "isLiked": false,
      },
      {
        "id": 9,
        "imgUrl": "sample9",
        "name": "4행정 엔진분무기 판매합니다.",
        "description":
            "3년 전에 사서 한 번 사용하고 그대로 둔 상태입니다. 요즘 사용은 안해봤습니다. "
            "그래서 저렴하게 내놓습니다. 중고라 반품은 어렵습니다.",
        "seller": "알뜰한",
        "price": 30000,
        "address": "원주시 명륜2동",
        "good": 7,
        "chatCnt": 28,
        "isLiked": false,
      },
      {
        "id": 10,
        "imgUrl": "sample10",
        "name": "셀린느 버킷 가방",
        "description":
            "22년 신세계 대전 구매입니당\n"
            "셀린느 버킷백\n"
            "구매해서 몇번 사용했어요\n"
            "까짐 스크래치 없습니다.\n"
            "타지역에서 보내는 거라 택배로 진행합니당!",
        "seller": "똑태현",
        "price": 190000,
        "address": "중구 동화동",
        "good": 40,
        "chatCnt": 6,
        "isLiked": false,
      },
    ],
  };

  final ProductStorage _productStorage = ProductStorage();

  Future<List<Map<String, dynamic>>> getProducts() async {
    final storedProducts = await _productStorage.loadProducts();
    if (storedProducts.isEmpty) {
      await _productStorage.saveProducts(_mockProductData['products']!);
    }
    return _productStorage.loadProducts();
  }

  Future<List<Map<String, dynamic>>> loadFromProductStorage() async {
    return await _productStorage.loadProducts();
  }

  Future<void> resetProducts() async {
    await _productStorage.clearProducts(); // 기존 데이터 삭제
    await _productStorage.saveProducts(
      _mockProductData['products']!,
    ); // 새로운 데이터 저장
  }
}
