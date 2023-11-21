import 'package:http/http.dart' as http;
import '../../Product/Product_model/product_model.dart';

class FetchApiRepo {

  Future<List<ProductsModel>> fetchData() async {
    final response = await http.get(Uri.parse("https://fakestoreapi.com/products/"));

    if (response.statusCode == 200) {
      var data = productsModelFromJson(response.body);
      return data;
    } else {
      throw Exception('Failed to load data from the API');
    }
  }
}
