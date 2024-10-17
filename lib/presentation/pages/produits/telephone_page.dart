import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telefoni_dashboard/data/datasources/produit_remote_datasource.dart';
import 'package:telefoni_dashboard/data/repositories/produit_repository_impl.dart';
import 'package:telefoni_dashboard/domain/use_cases/recuperer_liste_produits.dart';
import 'package:telefoni_dashboard/presentation/controllers/produit_controller.dart';
import 'package:telefoni_dashboard/presentation/pages/produits/telephone_card.dart';
import 'package:telefoni_dashboard/presentation/widgets/search_bar.dart';

class TelephonePage extends StatelessWidget {
  TelephonePage({super.key});

  final ProduitController produitController = Get.put(
    ProduitController(
        recupererListeProduits: RecupererListeProduits(
      repository: ProduitRepositoryImpl(
          produitRemoteDatasource: ProduitRemoteDatasource()),
    )),
  );
  @override
  Widget build(BuildContext context) {
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
          const MySearchBar(),
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
