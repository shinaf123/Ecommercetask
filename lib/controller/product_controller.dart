import 'package:get/get.dart';
import 'package:new_mechinetask/model/product_model.dart';
import 'package:new_mechinetask/service/product_service.dart';

class HomeController extends GetxController {
  final ApiService apiService = ApiService();
List<Product>productsss = [];
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }



  void fetchProducts() async {
  try {
    isLoading = true;
    update(); 
    var products = await ApiService().fetchProducts();
    productsss = products;
    print(productsss);  // This will now print meaningful product information
  } catch (e) {
    print('Error fetching products: $e');
  } finally {
    isLoading = false;
    update();  
  }
}

}