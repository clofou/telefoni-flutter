import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telefoni_dashboard/presentation/widgets/button.dart';

class DialogService {
  static Future<void> showLogoutConfirmationDialog(Function onConfirm) async {
    return Get.dialog(
      AlertDialog(
        title: const Text(
          "Confirmation",
          style: TextStyle(fontFamily: "Poppins"),
        ),
        content: const Text("Êtes-vous sûr de vouloir vous déconnecter ?"),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Ferme le dialog
            },
            child: const Text("Non"),
          ),
          MyCustomButton(
              child: const Text("Oui"),
              onPressed: () {
                onConfirm();
                Get.back();
              })
        ],
      ),
    );
  }
}
