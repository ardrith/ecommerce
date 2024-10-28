import 'package:ecommerce/MODEL/productdetailM.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  var product = Addproductmodel().obs;
  var isLoading = true.obs;

  final String apiUrl =
      "https://ourworks.co.in/sigofish-backend/public/customer/products/details?product_id=2&store_id=1";
  final String token = "208|PSdgfNi58S1qupatJAGm8xzZYcY5zqjvVypQ6BKx";
  final String imageBaseUrl =
      "https://ourworks.co.in/sigofish-backend/public/storage/";

  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }

  Future<void> fetchProduct() async {
    try {
      isLoading(true);
      final response = await GetConnect().get(
        apiUrl,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200 && response.body != null) {
        product.value = addproductmodelFromJson(response.bodyString!);

  
        if (product.value.data?.product?.image != null) {
          product.value.data!.product!.image =
              imageBaseUrl + product.value.data!.product!.image!;
        }

      
        if (product.value.data?.related != null) {
          for (var relatedProduct in product.value.data!.related!) {
            if (relatedProduct.productImage != null) {
              relatedProduct.productImage =
                  imageBaseUrl + relatedProduct.productImage!;
            }
          }
        }
      } else {
        Get.snackbar("Error", "Failed to load product data");
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e");
    } finally {
      isLoading(false);
    }
  }
}
