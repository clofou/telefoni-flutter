import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telefoni_dashboard/presentation/controllers/produit_controller.dart';
import 'package:telefoni_dashboard/presentation/pages/produits/telephone_card.dart';
import 'package:telefoni_dashboard/presentation/widgets/search_bar.dart';

class TelephonePage extends StatelessWidget {
  TelephonePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProduitController produitController = Get.put(ProduitController());
    return Obx(() {
      if (produitController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (produitController.errorMessage.isNotEmpty) {
        return Center(
          child: Text(produitController.errorMessage.value),
        );
      }

      return Column(
        children: [
          MySearchBar(),
          SizedBox(
            height: 500,
            child: ListView.builder(
              itemCount: produitController.produits.length,
              itemBuilder: (context, index) =>
                  TelephoneCard(telephone: produitController.produits[index]),
            ),
          ),
        ],
      );
    });
  }
}
