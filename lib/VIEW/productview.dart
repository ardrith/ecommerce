import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../CONTROLLER/productdetail.dart';

class AddProductPage extends StatelessWidget {
  AddProductPage({Key? key}) : super(key: key);

  final AddProductController controller = Get.put(AddProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Details',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.product.value.data == null) {
          return const Center(child: Text("No data found"));
        } else {
          final product = controller.product.value.data!.product!;
          final relatedProducts = controller.product.value.data!.related;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    product.name ?? 'Product Name',
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: DecorationImage(
                      image: NetworkImage(product.image ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      const TabBar(
                        labelColor: Colors.red,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(text: "Customize"),
                          Tab(text: "About"),
                        ],
                      ),
                      SizedBox(
                        height: 200,
                        child: TabBarView(
                          children: [
                            ListView.builder(
                              itemCount: product.cuttingTypes?.length ?? 0,
                              itemBuilder: (context, index) {
                                final cuttingType =
                                    product.cuttingTypes![index];
                                return ListTile(
                                    leading: product.image != null
                                        ? Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.network(
                                              product.image!,
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : const Icon(Icons.image, size: 50),
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(cuttingType.type ??
                                            'Type not available'),
                                      ],
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Net:${cuttingType.netWeight ?? 'N/A'}",
                                          style: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          "\u20B9${cuttingType.originalPrice ?? 'N/A'}",
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          "\u20B9${cuttingType.offerPrice ?? 'N/A'}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    trailing: GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 36),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: const Text(
                                          'ADD',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ));
                              },
                            ),
                            ListView.builder(
                              itemCount: relatedProducts?.length ?? 0,
                              itemBuilder: (context, index) {
                                final related = relatedProducts![index];
                                return Card(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: ListTile(
                                      leading: related.productImage != null
                                          ? Image.network(
                                              related.productImage!,
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.cover,
                                            )
                                          : const Icon(Icons.image, size: 50),
                                      title: Text(
                                          related.productName ?? 'No Name'),
                                      subtitle: Text(
                                          "Price: ${related.originalPrice ?? 'N/A'}"),
                                      trailing: GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 16),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: const Text(
                                            'Add',
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      )),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Related Products',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 120,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: relatedProducts?.length ?? 0,
                              itemBuilder: (context, index) {
                                final related = relatedProducts![index];
                                return Container(
                                  width: 100,
                                  margin: const EdgeInsets.only(right: 8.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    color: Colors.grey.shade200,
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: related.productImage != null
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                child: Image.network(
                                                  related.productImage!,
                                                  fit: BoxFit.cover,
                                                  width: double.infinity,
                                                ),
                                              )
                                            : const Icon(Icons.image, size: 50),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          related.originalPrice != null
                                              ? "Price: ₹${related.originalPrice}"
                                              : 'N/A',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
