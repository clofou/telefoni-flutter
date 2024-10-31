import 'package:flutter/material.dart';
import 'package:telefoni_dashboard/data/models/reparateur_table_model.dart';
import 'package:telefoni_dashboard/presentation/widgets/stat_number.dart';

class ReparateurTable extends StatelessWidget {
  ReparateurTable({super.key});

  final data = <ReparateurTableModel>[
    ReparateurTableModel(
        rang: 1, nom: "Bako et Oumar", nombreDeReparation: 45, statut: "PRO"),
    ReparateurTableModel(
        rang: 2,
        nom: "Genie Iphone",
        nombreDeReparation: 299,
        statut: "PRO_PLUS"),
    ReparateurTableModel(
        rang: 3, nom: "Benoko", nombreDeReparation: 299, statut: "PRO"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 300,
      color: Colors.white,
      width: 700,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Les Reparateurs",
                style: TextStyle(
                    fontFamily: "Poppins", fontSize: 24, color: Colors.black),
              ),
              TextButton(
                  onPressed: () {},
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
                  label: Expanded(
                child: Text(
                  "Total de reparation",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 13,
                      color: Color(0xFF96A5B8)),
                ),
              )),
              DataColumn(
                  label: Text(
                "Grade",
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
                  DataCell(Text("${e.nombreDeReparation}")),
                  DataCell(NumberStat(
                    text: e.statut,
                    color: e.statut == "VIP"
                        ? Colors.blue
                        : e.statut == "PRO_PLUS"
                            ? Colors.green
                            : e.statut == "PRO"
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
