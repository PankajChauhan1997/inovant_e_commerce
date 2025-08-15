import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Model/ProductModel.dart';
import 'package:flutter/material.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var product = Rxn<ProductModel>();
  var selectedImageIndex = 0.obs;
  late PageController pageController;
  var quantity = 1.obs;
  var isDescriptionExpanded = false.obs; // <-- Add this

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    fetchProduct();
  }

  List<String> get eyeImages {
    final options = product.value?.data?.configurableOption;
    if (options != null && options.isNotEmpty) {
      return options.first.attributes
              ?.map(
                (attr) => (attr.images?.isNotEmpty ?? false)
                    ? attr.images!.first
                    : "",
              )
              .where((url) => url.isNotEmpty)
              .toList() ??
          [];
    }
    return [];
  }

  void toggleDescription() {
    isDescriptionExpanded.value = !isDescriptionExpanded.value;
  }

  Future<void> fetchProduct() async {
    try {
      isLoading(true);
      const url =
          "https://klinq.com/rest/V1/productdetails/6701/253620?lang=en&store=KWD";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // final productModel = ProductModel.fromJson(json.decode(response.body));
        // product.value = productModel.data;
        product.value = productModelFromJson(response.body);
      }
    } catch (e) {
      print("Error fetching product: $e");
    } finally {
      isLoading(false);
    }
  }

  void changeImage(int index) {
    selectedImageIndex.value = index;
  }
}
