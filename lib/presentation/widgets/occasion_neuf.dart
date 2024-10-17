import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telefoni_dashboard/data/datasources/vente_remote_datasource.dart';
import 'package:telefoni_dashboard/data/repositories/vente_repository_impl.dart';
import 'package:telefoni_dashboard/domain/use_cases/creer_graphe_occasion_neuf.dart';
import 'package:telefoni_dashboard/presentation/controllers/vente_controller.dart';


class VenteChart extends StatelessWidget {
  VenteChart({super.key});

  final VenteController venteController = Get.put(
    VenteController(
      GetVentesOccasionVsNeuf(
        VenteRepositoryImpl(VenteRemoteDataSource()),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return GetX<VenteController>(
      init: Get.find<VenteController>(), // Initialise le controller via GetX
      builder: (controller) {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.mesventes.isEmpty) {
          return const Center(
              child: Text('Aucune donnée de vente disponible.'));
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: AspectRatio(
            aspectRatio: 1.5, // Optimise la taille du graphique
            child: BarChart(
              BarChartData(
                backgroundColor: Colors.white,
                alignment: BarChartAlignment.spaceBetween,
                barGroups: _createBarGroups(controller),

                titlesData: _buildTitles(),
                borderData: FlBorderData(show: false),
                gridData: const FlGridData(show: false, drawVerticalLine: false),
              ),
            ),
          ),
        );
      },
    );
  }

  // Création des données de titres
  FlTitlesData _buildTitles() {
    return FlTitlesData(
      
      
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      leftTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (double value, TitleMeta meta) {
            switch (value.toInt()) {
              case 0:
                return const Text('Jan', style: TextStyle(fontSize: 10, fontFamily: "Poppins"),);
              case 1:
                return const Text('Feb', style: TextStyle(fontSize: 10, fontFamily: "Poppins"),);
              case 2:
                return const Text('Mar', style: TextStyle(fontSize: 10, fontFamily: "Poppins"),);
              case 3:
                return const Text('Apr', style: TextStyle(fontSize: 10, fontFamily: "Poppins"),);
              case 4:
                return const Text('May', style: TextStyle(fontSize: 10, fontFamily: "Poppins"),);
              case 5:
                return const Text('Jun', style: TextStyle(fontSize: 10, fontFamily: "Poppins"),);
              case 6:
                return const Text('Jul', style: TextStyle(fontSize: 10, fontFamily: "Poppins"),);
              case 7:
                return const Text('Aug', style: TextStyle(fontSize: 10, fontFamily: "Poppins"),);
              case 8:
                return const Text('Sep', style: TextStyle(fontSize: 10, fontFamily: "Poppins"),);
              case 9:
                return const Text('Oct', style: TextStyle(fontSize: 10, fontFamily: "Poppins"),);
              case 10:
                return const Text('Nov', style: TextStyle(fontSize: 10, fontFamily: "Poppins"),);
              case 11:
                return const Text('Dec', style: TextStyle(fontSize: 10, fontFamily: "Poppins"),);
              default:
                return const Text('');
            }
          },
          
          reservedSize: 30,
        ),
      ),
    )
    ;
  }

  // Génération des données pour le graphique
  List<BarChartGroupData> _createBarGroups(VenteController controller) {
    return controller.mesventes.map((vente) {
      return BarChartGroupData(
        x: vente.mois - 1, // Aligner sur l'index des mois
        barsSpace: 4, // Espace entre les barres du même groupe
        barRods: [
          BarChartRodData(
            toY: vente.ventesOccasion.toDouble(),
            color: Colors.green,
            width: 10,
            borderRadius: BorderRadius.circular(2),
          ),
          BarChartRodData(
            toY: vente.ventesNeuf.toDouble(),
            color: Colors.orange,
            width: 10,
            borderRadius: BorderRadius.circular(2),
          ),
        ],
      );
    }).toList();
  }
}
