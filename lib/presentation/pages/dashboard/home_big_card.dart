import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:telefoni_dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:telefoni_dashboard/presentation/widgets/sell_card.dart';
import 'package:get/get.dart';

class HomeBigCard extends StatelessWidget {
  const HomeBigCard({super.key});



  @override
  Widget build(BuildContext context) {
    DashboardController controller = Get.find<DashboardController>();

    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ventes d'aujourd'hui",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 24,
                        color: Colors.black),
                  ),
                  Text(
                    "Cartes",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "PatrickHand",
                        fontSize: 20),
                  )
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFC3D3E2)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/export_icon.svg",
                        colorFilter: const ColorFilter.mode(
                            Colors.black, BlendMode.srcIn),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Export",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.black,
                            fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Wrap(
            runSpacing: 10,
            children: [
              Obx(() {
                return SellCard(
                    iconPath: "assets/icons/vente_icon.svg",
                    title:
                        "CFA ${controller.venteTotal.value}",
                    subtitle: "Vente Total",
                    backgroundColor: const Color.fromARGB(170, 252, 190, 203),
                    foregroundColor: const Color(0xFFFA5A7D));
              }),
              const SizedBox(
                width: 20,
              ),
              Obx(() {
                return SellCard(
                    iconPath: "assets/icons/commande_icon.svg",
                    title: controller.totalCommande.toString(),
                    subtitle: "Commandes",
                    backgroundColor: const Color.fromARGB(255, 247, 226, 169),
                    foregroundColor: const Color.fromARGB(255, 212, 162, 22));
              }),
              const SizedBox(
                width: 20,
              ),
              Obx(() {
                return SellCard(
                  iconPath: "assets/icons/newuser_icon.svg",
                  title: controller.newUsers.value.toString(),
                  info:
                      "${controller.userIncrease.value}% depuis hier",
                  subtitle: "Nouveaux utilisateurs",
                  backgroundColor: const Color.fromARGB(255, 214, 247, 162),
                  foregroundColor: const Color.fromARGB(255, 153, 226, 35),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
