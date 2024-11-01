import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telefoni_dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:telefoni_dashboard/presentation/pages/dashboard/home_big_card.dart';
import 'package:telefoni_dashboard/presentation/widgets/occasion_neuf.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});


  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Get.find<DashboardController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        HomeBigCard(),
        const SizedBox(
          height: 20,
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          width: 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Occasion vs Neuf",
                style: TextStyle(
                    fontFamily: "Poppins", fontSize: 24, color: Colors.black),
              ),
              VenteChart(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 143, 241, 146),
                      borderRadius: BorderRadius.all(
                        Radius.circular(9),
                      ),
                    ),
                    child: Center(
                        child: Icon(
                      Icons.eco,
                      color: Theme.of(context).primaryColor,
                    )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Telephone D'occasion",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                      Text("Global")
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Obx(() {
                    return Text("${dashboardController.totalVentesOccasion.value}");
                  })
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 218, 143, 241),
                      borderRadius: BorderRadius.all(
                        Radius.circular(9),
                      ),
                    ),
                    child: const Center(
                        child: Icon(
                      Icons.phone_android_rounded,
                      color: Color.fromARGB(255, 226, 17, 198),
                    )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Telephone Neuf",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                      Text("Global")
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Obx(() {
                    return Text("${dashboardController.totalVentesNeuf.value}");
                  })
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
