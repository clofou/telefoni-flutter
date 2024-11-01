import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telefoni_dashboard/models/boutique_table_model.dart';
import 'package:telefoni_dashboard/presentation/controllers/navigation/navigation_controller.dart';
import 'package:telefoni_dashboard/presentation/widgets/progress_indicator.dart';
import 'package:telefoni_dashboard/presentation/widgets/stat_number.dart';

class BoutiqueTable extends StatelessWidget {
  BoutiqueTable({super.key});

  final NavigationController navigationController =
      Get.find<NavigationController>();

  final data = <BoutiqueTableModel>[
    BoutiqueTableModel(
      rang: 1,
      nom: "Bakayoko Multi Service",
      ventesPourcentageSurTotal: 45,
    ),
    BoutiqueTableModel(
      rang: 2,
      nom: "Jp Services",
      ventesPourcentageSurTotal: 29,
    ),
    BoutiqueTableModel(
      rang: 3,
      nom: "MMS Service",
      ventesPourcentageSurTotal: 18,
    ),
    BoutiqueTableModel(
      rang: 4,
      nom: "Thiorno",
      ventesPourcentageSurTotal: 16,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 351,
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Les Boutiques",
                style: TextStyle(
                    fontFamily: "Poppins", fontSize: 24, color: Colors.black),
              ),
              TextButton(
                  onPressed: () {
                    navigationController.changePage(7);
                  },
                  child: const Text(
                    "Voir tout >",
                    style: TextStyle(
                        fontFamily: "PatrickHand",
                        fontSize: 24,
                        color: Colors.black),
                  ))
            ],
          ),
          DataTable(
            decoration: const BoxDecoration(color: Colors.white),
            columns: const [
              DataColumn(
                  label: Text(
                "#",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 13,
                    color: Color(0xFF96A5B8)),
              )),
              DataColumn(
                  label: Text(
                "Nom",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 13,
                    color: Color(0xFF96A5B8)),
              )),
              DataColumn(
                  label: Text(
                "Popularité",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 13,
                    color: Color(0xFF96A5B8)),
              )),
              DataColumn(
                  label: Text(
                "Ventes",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 13,
                    color: Color(0xFF96A5B8)),
              ))
            ],
            rows: data.map((e) {
              return DataRow(
                cells: [
                  DataCell(
                    Text(
                      "${e.rang}",
                      style: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                          color: Colors.black),
                    ),
                  ),
                  DataCell(
                    Text(
                      e.nom,
                      style: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                          color: Colors.black),
                    ),
                  ),
                  DataCell(
                    SizedBox(
                      width: 100,
                      child: MyProgressIndicator(
                        percentage: e.ventesPourcentageSurTotal,
                        barColor: e.ventesPourcentageSurTotal > 90
                            ? Colors.blue
                            : e.ventesPourcentageSurTotal > 45
                                ? Colors.green
                                : e.ventesPourcentageSurTotal > 20
                                    ? Colors.purple
                                    : Colors.orange,
                      ),
                    ),
                  ),
                  DataCell(NumberStat(
                    text: e.ventesPourcentageSurTotal.toString(),
                    color: e.ventesPourcentageSurTotal > 90
                        ? Colors.blue
                        : e.ventesPourcentageSurTotal > 45
                            ? Colors.green
                            : e.ventesPourcentageSurTotal > 20
                                ? Colors.purple
                                : Colors.orange,
                  ))
                ],
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
