import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final Map product = Get.arguments;

    // ✅ Get nutriments safely
    final Map nutriments = product['nutriments'] ?? {};

    return Scaffold(
      appBar: AppBar(title: Text(product['product_name'] ?? 'Product')),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: ListView(
          children: [
            // Product Name
            Text(
              product['product_name'] ?? 'No Name',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // Brand
            Text("Brand: ${product['brands'] ?? 'N/A'}"),

            const Divider(),

            // Ingredients
            const Text(
              "Ingredients:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            Text(product['ingredients_text'] ?? 'Not Available'),

            const Divider(),

            // Nutrition
            const Text(
              "Nutrition (per 100g)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 6),

            Text("Calories: ${nutriments['energy-kcal_100g'] ?? 'N/A'} kcal"),
            Text("Sugar: ${nutriments['sugars_100g'] ?? 'N/A'} g"),
            Text("Protein: ${nutriments['proteins_100g'] ?? 'N/A'} g"),
            Text("Fat: ${nutriments['fat_100g'] ?? 'N/A'} g"),
          ],
        ),
      ),
    );
  }
}
