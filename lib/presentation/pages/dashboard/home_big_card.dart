import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:telefoni_dashboard/data/datasources/vente_remote_datasource.dart';
import 'package:telefoni_dashboard/data/repositories/vente_repository_impl.dart';
import 'package:telefoni_dashboard/domain/use_cases/recuperer_vente_total.dart';
import 'package:telefoni_dashboard/presentation/controllers/display_vente_total_controller.dart';
import 'package:telefoni_dashboard/presentation/widgets/sell_card.dart';
import 'package:get/get.dart';
import 'package:telefoni_dashboard/data/datasources/commande_remote_data_source.dart';
import 'package:telefoni_dashboard/data/repositories/commande_repository_impl.dart';
import 'package:telefoni_dashboard/domain/use_cases/recupere_nombre_commande.dart';
import 'package:telefoni_dashboard/domain/use_cases/recuperer_liste_commande.dart';
import 'package:telefoni_dashboard/presentation/controllers/commande_controller.dart';

class HomeBigCard extends StatelessWidget {
  HomeBigCard({super.key});

  final CommandeController commandeController = Get.put(CommandeController(
    recupereNombreCommande: RecupereNombreCommande(
      repository: CommandeRepositoryImpl(
          commandeRemoteDataSource: CommandeRemoteDataSource()),
    ),
    recupererListeCommande: RecupererListeCommande(
      repository: CommandeRepositoryImpl(
          commandeRemoteDataSource: CommandeRemoteDataSource()),
    ),
  ));

  final DisplayVenteTotalController displayVenteTotalController =
      Get.put(DisplayVenteTotalController(
    recupererVenteTotal: RecupererVenteTotal(
      repository: VenteRepositoryImpl(VenteRemoteDataSource()),
    ),
  ));

  @override
  Widget build(BuildContext context) {
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
                        fontFamily: "PatrickHandSC",
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
                        "CFA ${displayVenteTotalController.venteTotal.value.totalMontantVentes} ${displayVenteTotalController.suffix.value}",
                    subtitle: "Vente Total",
                    info: "${displayVenteTotalController.venteTotal.value.pourcentageVariation}% depuis hier",
                    backgroundColor: const Color.fromARGB(170, 252, 190, 203),
                    foregroundColor: const Color(0xFFFA5A7D));
              }),
              const SizedBox(
                width: 20,
              ),
              Obx(() {
                return SellCard(
                    iconPath: "assets/icons/commande_icon.svg",
                    title: commandeController.nombreCommande.value,
                    info: "+5% depuis hier",
                    subtitle: "COmmandes",
                    backgroundColor: const Color.fromARGB(255, 247, 226, 169),
                    foregroundColor: const Color.fromARGB(255, 212, 162, 22));
              }),
              const SizedBox(
                width: 20,
              ),
              const SellCard(
                  iconPath: "assets/icons/newuser_icon.svg",
                  title: "8",
                  info: "0.5% depuis hier",
                  subtitle: "Nouveau User",
                  backgroundColor: Color.fromARGB(255, 214, 247, 162),
                  foregroundColor: Color.fromARGB(255, 153, 226, 35)),
            ],
          ),
        ],
      ),
    );
  }
}
