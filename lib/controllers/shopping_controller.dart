// controllers are based on the fuctionality and not on pages
// our one controller can be shared across two pages or one page has two controllers

import 'package:get/get.dart';

import '../models/product.dart';

class ShoppingController extends GetxController {
  // what we need inside the controller the elements which we want to bind to the Ui.
  // these thing we can bind to our Ui  but what will happen its not going to update
  // as the data updates bcoz to work with getx controller have to make it observable
  // so whenever data changes as soon as our ui shouild get updated
  // to achieve that do ".obs" so anytime our data is going to change is going to update UI as well

  // In getX we can achieve or we can update the Ui  with Three different methods 1.getBuilder
  // 2.getX 3.obx
  var products = List<Product>().obs;

  @override
  void onInit() {
    print("on init method called");
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));

    // this product result whatever came from Api we are going to assign our observable instance

    var serverResponse = [
      Product(
          id: 1,
          price: 30,
          productDescription: 'first',
          productImage: 'one',
          productName: 'first product'),
      Product(
          id: 2,
          price: 40,
          productDescription: 'second',
          productImage: 'Two',
          productName: '2nd product'),
      Product(
          id: 3,
          price: 50,
          productDescription: 'three',
          productImage: '3rd',
          productName: 'Third product'),
      Product(
          id: 4,
          price: 60,
          productDescription: 'four',
          productImage: '4th',
          productName: 'four product'),
    ];

    // so products we are updating value here
    // ignore: deprecated_member_use
    products.value = serverResponse;

    // now in shopping page we will create our instance of controller
    // @see -- views/shopping_page
  }
}
