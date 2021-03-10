import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getX_proj/controllers/cart_controller.dart';

import '../controllers/shopping_controller.dart';

// when we working with getX we dont need statefull widget
// because in statefull widget our state basically lies on the RAM and we dont want that dependency

class ShoppingPage extends StatelessWidget {
  // creating instnace of controller
  // with get.put we are saying that create the controller and put it in the dependency
  // so anyTime the later on in the tree to fetch this data we can use the same controller

  // with this controller make this listview always listen to the data inside controller
  final shoppingController = Get.put(ShoppingController());

  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    print("Main Build Method");
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Card(
                          margin: EdgeInsets.all(12),
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            '${controller.products[index].productName}'),
                                        Text(
                                            '${controller.products[index].productDescription}')
                                      ],
                                    ),
                                    Text("${controller.products[index].price}")
                                  ],
                                ),
                                RaisedButton(
                                  onPressed: () {
                                    cartController
                                        .addToCart(controller.products[index]);
                                  },
                                  color: Colors.blue,
                                  textColor: Colors.white,
                                  child: Text('Add to Cart'),
                                )
                              ],
                            ),
                          ));
                    });
              }),
            ),
            GetX<CartController>(builder: (controller) {
              return Text("Total amount \$ ${controller.totalAmount}");
            }),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: GetX<CartController>(builder: (controller) {
            return Text('${controller.count.toString()}');
          }),
          icon: Icon(Icons.add_shopping_cart)),
    );
  }
}
