import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/ProductPageController.dart';

class ProductPage extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());
  ProductPage({super.key});

  String removeHtmlTags(String htmlText) {
    return htmlText.replaceAll(RegExp(r'<[^>]*>'), '').trim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.arrow_back_ios, size: 20),
            onPressed: () {},
          ),
        ),
        title: Obx(() {
          if (controller.isLoading.value ||
              controller.product.value?.data == null) {
            return const Text(
              "Product Details",
              style: TextStyle(color: Colors.black),
            );
          }
          return Text(
            controller.product.value!.data?.name ?? "",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            overflow: TextOverflow.ellipsis,
          );
        }),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _appBarIcon(Icons.favorite_border, () {}),
              _appBarIcon(Icons.ios_share, () {}),
              _appBarIcon(Icons.shopping_bag_outlined, () {}),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        final product = controller.product.value;
        if (product == null) {
          return const Center(child: Text("No product found"));
        }

        final imagesList = controller.eyeImages;

        return LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Product Image
                      AspectRatio(
                        aspectRatio: 1,
                        child: PageView.builder(
                          controller: controller.pageController,
                          itemCount: imagesList.length,
                          onPageChanged: controller.changeImage,
                          itemBuilder: (context, index) {
                            return Image.network(
                              imagesList[index],
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Container(
                                color: Colors.grey.shade200,
                                child: const Icon(
                                  Icons.image,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      /// Dots Indicator
                      if (imagesList.isNotEmpty)
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              imagesList.length,
                              (index) => AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 3,
                                  vertical: 10,
                                ),
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      index ==
                                          controller.selectedImageIndex.value
                                      ? Colors.black
                                      : const Color(0xFFD9CBA6),
                                ),
                              ),
                            ),
                          ),
                        ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Name & Price
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    product.data?.brandName?.toUpperCase() ??
                                        '',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  "${(double.tryParse(product.data?.finalPrice?.toString() ?? '0') ?? 0).toStringAsFixed(2)} KWD",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),

                            /// Brand & SKU
                            Text(
                              product.data?.name ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 3),

                            Text(
                              "SKU: ${product.data?.sku ?? ''}",
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 16),

                            /// Color Selector
                            const Text(
                              "Color:",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 8),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(imagesList.length, (
                                  index,
                                ) {
                                  return GestureDetector(
                                    onTap: () {
                                      controller.selectedImageIndex.value =
                                          index;
                                      controller.pageController.jumpToPage(
                                        index,
                                      );
                                    },
                                    child: Obx(() {
                                      bool isSelected =
                                          index ==
                                          controller.selectedImageIndex.value;
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          right: 8,
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.all(
                                            isSelected ? 2 : 0,
                                          ),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: isSelected
                                                ? Border.all(
                                                    color: Colors.black,
                                                    width: 2,
                                                  )
                                                : null,
                                          ),
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                              imagesList[index],
                                            ),
                                            radius: 25,
                                          ),
                                        ),
                                      );
                                    }),
                                  );
                                }),
                              ),
                            ),
                            const SizedBox(height: 16),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        style: DefaultTextStyle.of(
                                          context,
                                        ).style,
                                        children: const <TextSpan>[
                                          TextSpan(
                                            text:
                                                "or 4 interest-free payments of ",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "0.88 KWD ",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "Learn More",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.blue,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Card(
                                    color: Colors.green, // Green background
                                    elevation: 2, // Card shadow
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      child: Text(
                                        "tabby",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.black, // Black text
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),

                            /// Quantity Selector - Updated with proper alignment
                            const Text(
                              "Quantity",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                _qtyButton("-", () {
                                  if (controller.quantity.value > 1) {
                                    controller.quantity.value--;
                                  }
                                }, alignment: Alignment.center),
                                SizedBox(
                                  width: 40,
                                  child: Obx(
                                    () => Text(
                                      controller.quantity.value.toString(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                                _qtyButton("+", () {
                                  controller.quantity.value++;
                                }, alignment: Alignment.center),
                              ],
                            ),

                            const SizedBox(height: 16),

                            /// Product Information
                            const Text(
                              "PRODUCT INFORMATION",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 100.0),
                              child: Text(
                                removeHtmlTags(product.data?.description ?? ''),
                                style: const TextStyle(
                                  fontSize: 14,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                /// Sticky Bottom Buttons
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SafeArea(
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Add to bag",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Colors.black),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Share",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }),
    );
  }

  Widget _qtyButton(
    String text,
    VoidCallback onTap, {
    AlignmentGeometry alignment = Alignment.center,
  }) {
    bool isMinus = text == "-";
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: isMinus ? Colors.grey : Colors.black,
          border: Border.all(color: Colors.grey.shade400),
        ),
        alignment: alignment,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white, // White text for plus button
          ),
        ),
      ),
    );
  }

  Widget _appBarIcon(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: Icon(icon, size: 24, color: Colors.black),
      ),
    );
  }
}
