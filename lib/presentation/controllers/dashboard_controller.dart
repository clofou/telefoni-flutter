import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telefoni_dashboard/core/errors/failures.dart';
import 'package:telefoni_dashboard/data/commande_service.dart';
import 'package:telefoni_dashboard/data/user_service.dart';
import 'package:telefoni_dashboard/data/vente_service.dart';

class DashboardController extends GetxController {
  UserService userService = UserService();
  CommandeService commandeService = CommandeService();
  VenteService venteService = VenteService();

  // BigCard
  var venteTotal = 0.obs;
  var totalCommande = 0.obs;

  var totalVentesOccasion = 0.obs;
  var totalVentesNeuf = 0.obs;
  var mesventes = [].obs;

  var isLoading = false.obs;

  // Utilisateurs
  var newUsers = 0.obs;
  var userIncrease = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    recupUtilisateurs();
    recupCommandes();
    recupVentes();
  }

  recupUtilisateurs() async {
    isLoading.value = true;

    final result = await userService.getNouveauxUtilisateursAvecPourcentage();
    result.fold((failure) {
      if (failure is ServerFailure) {
        Get.snackbar(
          'Erreur',
          'Impossible de récupérer les utilisateurs',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }, (data) {
      newUsers.value = data['newUsersToday'];
      userIncrease.value = data['percentageIncrease'];
    });
    isLoading.value = false;
  }

  recupCommandes() async {
    isLoading.value = true;
    final result = await commandeService.getCommandes();
    result.fold((failure) {
      if (failure is ServerFailure) {
        Get.snackbar(
          'Erreur',
          'Impossible de récupérer les Commandes',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }, (data) {
      totalCommande.value = data.length;
      print("+++++++++++++++++ $data");
    });
    isLoading.value = false;
  }

  recupVentes() async {
    isLoading.value = true;
    final result = await venteService.getTotalVentes();
    result.fold((failure) {
      if (failure is ServerFailure) {
        Get.snackbar(
          'Erreur',
          'Impossible de récupérer les ventes',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }, (data) {
      venteTotal.value = data;
      print("JJJJJJJJJJJJJJJ $data");
    });
    isLoading.value = false;
  }
}
