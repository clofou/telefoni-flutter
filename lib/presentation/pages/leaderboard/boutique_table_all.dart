import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telefoni_dashboard/data/models/boutique_table_model.dart';
import 'package:telefoni_dashboard/presentation/controllers/navigation/navigation_controller.dart';
import 'package:telefoni_dashboard/presentation/widgets/isLock_widget.dart';
import 'package:telefoni_dashboard/presentation/widgets/progress_indicator.dart';
import 'package:telefoni_dashboard/presentation/widgets/search_bar.dart';
import 'package:telefoni_dashboard/presentation/widgets/stat_number.dart';

class BoutiqueTableAll extends StatelessWidget {
  BoutiqueTableAll({super.key});

  final NavigationController navigationController =
      Get.find<NavigationController>();
  final SearchController searchController = Get.put(SearchController());

  final data = <BoutiqueTableModel>[
    BoutiqueTableModel(
      rang: 1,
      nom: "Bakayoko Multi Service",
      ventesPourcentageSurTotal: 45,
      isLocked: true,
    ),
    BoutiqueTableModel(
      rang: 2,
      nom: "Jp Services",
      ventesPourcentageSurTotal: 29,
      isLocked: false,
    ),
    BoutiqueTableModel(
      rang: 3,
      nom: "MMS Service",
      ventesPourcentageSurTotal: 18,
      isLocked: true,
    ),
    BoutiqueTableModel(
      rang: 4,
      nom: "Thiorno",
      ventesPourcentageSurTotal: 16,
      isLocked: false,
    ),
    BoutiqueTableModel(
      rang: 4,
      nom: "Thiorno",
      ventesPourcentageSurTotal: 16,
      isLocked: false,
    ),
    BoutiqueTableModel(
      rang: 4,
      nom: "Thiorno",
      ventesPourcentageSurTotal: 16,
      isLocked: false,
    ),
    BoutiqueTableModel(
      rang: 4,
      nom: "Thiorno",
      ventesPourcentageSurTotal: 16,
      isLocked: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MySearchBar(),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          color: Colors.white,
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      navigationController.changePage(1);
                    },
                    child: const Text(
                      "< Retour",
                      style: TextStyle(
                          fontFamily: "PatrickHand",
                          fontSize: 24,
                          color: Colors.black),
                    ),
                  ),
                  const Text(
                    "Les Boutiques",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 24,
                        color: Colors.black),
                  )
                ],
              ),
              Obx(() {
                var filtered = data.where((e) {
                  return e.nom
                      .toLowerCase()
                      .contains(searchController.text.toLowerCase());
                }).toList();

                return DataTable(
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
                      "Bloquer",
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
                  rows: filtered.map((e) {
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
                        DataCell(IslockWidget(
                          isLock: e.isLocked!,
                        )),
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
                );
              })
            ],
          ),
        ),
      ],
    );
  }
}
