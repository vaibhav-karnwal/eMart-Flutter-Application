import 'package:http/http.dart' as http;
import 'package:emart/models/product.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>> fetchProducts() async {
    var response = await client.get( Uri.parse(
        'https://shopping-product-api.herokuapp.com/product'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      return null;
    }
  }
}
