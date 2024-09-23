import 'package:demo_app/models/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  List<Product> productData = [];

  List<Product> cartItem = List<Product>.empty().obs;

  addtoCart(Product item) {
    print("calling addToCart");
    cartItem.add(item);
  }

  double get totalPrice => cartItem.fold(0, (sum, item) => sum + item.price);
  int get count => cartItem.length;

  @override
  void onInit() {
    super.onInit();
    fatchProductData();
  }

  fatchProductData() async {
    await Future.delayed(Duration(seconds: 5));

    List<Product> serverResponse = [
      Product(
        id: 1,
        price: 150,
        productDescription: 'Corbett House Merchantdise',
        productImage: 'assets/images/clothes.webp',
        productName:
            'Get Fata Purana \n Branded Kadpe used by Fake people \n before selling',
        favorite: false,
      ),
      Product(
        id: 2,
        price: 400000,
        productDescription: 'Get Sasta and Do what you want ',
        productImage: 'assets/images/nasa.jpg',
        productName:
            'Sasta Nasa \n The Only Sasta Nasha thats \n send you to real nasa',
        favorite: false,
      ),
      Product(
        id: 3,
        price: 4000,
        productDescription: 'IITM Pass Doing',
        productImage: 'assets/images/iitm.jpg',
        productName:
            'If you are failed in any subject. \n Buy this pass and get pass , \n Powered by Scam Company',
        favorite: false,
      ),
      Product(
        id: 4,
        price: 108,
        productDescription: 'Corbett House Bakwas kro certifitake',
        productImage: 'assets/images/corbet.jpeg',
        productName:
            'Corbet House Social Group \n Become Group me bakwas kro member \n  at Just 108 Rupay per month. \n Subscription Renew Every Month',
        favorite: false,
      ),
      Product(
        id: 4,
        price: 108,
        productDescription: 'Placement from IITM',
        productImage: 'assets/images/PLACE.jpeg',
        productName: 'Buy AutoRiksha by taking loan \n from iitm as placement',
        favorite: false,
      ),
    ];

    productData.assignAll(serverResponse);
    print(productData);
    update();
  }

  adddToFavorites(id) {
    var index = productData.indexWhere((element) => element.id == id);
    productData[index].favorite = !productData[index].favorite;
    update();
  }
}
