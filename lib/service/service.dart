import 'package:http/http.dart' as http;
import 'package:ecommerce/model/product.dart';

class Services {
  // At the beginning, fetch the first 4 product
  static int limit = 4;
  static var client = http.Client();

  static Future<List<Product>> fetchProducts() async {
    var response = await client
        .get(Uri.parse("https://fakestoreapi.com/products?limit=$limit"));
    print(limit);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      return fetchProducts();
    }
  }
}
