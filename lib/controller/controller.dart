import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/service/service.dart';
import 'package:get/state_manager.dart';

class ProductController extends GetxController {
  var productList = List<Product>.empty().obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    var product = await Services.fetchProducts();
    if (product != null) {
      productList.value = product;
    }
  }
}
