import 'package:demo_app/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  final productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 173, 0),
        centerTitle: true,
        title: Text(
          "Corbett House, IITM NO.2 House",
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart),
                label: GetX<ProductController>(
                  builder: (controller) => Text(
                    productController.count.toString(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<ProductController>(
              builder: (controller) {
                return ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(5),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          elevation: 5,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 120,
                                width: double.infinity,
                                child: Image.asset(
                                  productController
                                      .productData[index].productImage,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      productController
                                          .productData[index].productName,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        productController.adddToFavorites(
                                            productController
                                                .productData[index].id);
                                      },
                                      icon: Icon(
                                        productController
                                                .productData[index].favorite
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Price : ${productController.productData[index].price} ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        productController.addtoCart(
                                            productController
                                                .productData[index]);
                                      },
                                      child: Text(
                                        'Jhola me Dalo',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Color.fromARGB(
                                                255, 228, 228, 5)),
                                      ),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) => Color.fromARGB(
                                                      182, 0, 0, 0))),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: productController.productData.length);
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GetX<ProductController>(
            builder: (controller) => Text(
              "Total Amount : ${productController.totalPrice}",
              style: TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
          Text(
            "Customer Bhagwaan Hote hai ,\n Aur mera itna aukaat nhi ki bhagwan ko udhaar du ",
            style: TextStyle(
                fontSize: 17, color: Color.fromARGB(255, 76, 236, 18)),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
