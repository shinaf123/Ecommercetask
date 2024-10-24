import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:new_mechinetask/model/product_model.dart';

class ApiService {
  static const String baseUrl = 'https://fake-store-api.mock.beeceptor.com/api/products';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      log(jsonResponse.toString());
      return jsonResponse.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
