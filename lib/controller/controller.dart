import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/service/service.dart';
import 'package:get/state_manager.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProductController extends GetxController {
  var productList = List<Product>.empty().obs;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

// fetch Api
  void fetchProducts() async {
    var product = await Services.fetchProducts();
    if (product != null) {
      productList.value = product;
    }
  }

//  refresh
  void onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
    Services.limit = 4;
    fetchProducts();
  }

// load more pagination
  void onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    Services.limit += 2;
    fetchProducts();
    refreshController.loadComplete();
  }
}
