import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scan_it/data/models/product_model.dart';
import 'package:scan_it/widgets/network_image_loader.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductModel product = Get.arguments;

    final data = product.rawData;

    return Scaffold(
      appBar: AppBar(title: Text(product.name)),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [

          // Image
          if (product.imageUrl.isNotEmpty)
            Center(
              child: NetworkImageWithLoader(
                imageUrl: product.imageUrl,
                height: 200,
              ),
            ),

          const SizedBox(height: 16),

          _section("Basic Info", {
            "Name": product.name,
            "Brand": product.brand,
            "Quantity": product.quantity,
            "Barcode": data['code'],
          }),

          _section("Ingredients", {
            "Text": data['ingredients_text'],
            "Allergens": data['allergens'],
            "Traces": data['traces'],
          }),

          _section("Categories & Labels", {
            "Categories": data['categories'],
            "Labels": data['labels'],
            "Packaging": data['packaging'],
          }),

          _section("Nutrition (100g)", {
            "Calories": "${product.energyKcal} kcal",
            "Sugar": "${product.sugar} g",
            "Protein": "${product.protein} g",
            "Fat": "${product.fat} g",
            "Salt": "${product.salt} g",
          }),

          _section("Manufacturing", {
            "Countries": data['countries'],
            "Origins": data['origins'],
            "Stores": data['stores'],
            "Manufacturing Places": data['manufacturing_places'],
          }),

          _section("Other Info", {
            "Nova Group": data['nova_group'],
            "Eco Score": data['ecoscore_grade'],
            "Nutri Score": data['nutriscore_grade'],
            "Additives": data['additives_tags']?.join(', '),
          }),
        ],
      ),
    );
  }

  /// Dynamic section builder
  Widget _section(String title, Map<String, dynamic> items) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),

      child: Padding(
        padding: const EdgeInsets.all(12),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),

            const Divider(),

            ...items.entries.map((e) {
              final value = e.value;

              if (value == null ||
                  value.toString().isEmpty ||
                  value == "null") {
                return const SizedBox();
              }

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        "${e.key}:",
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),

                    Expanded(flex: 5, child: Text(value.toString())),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
