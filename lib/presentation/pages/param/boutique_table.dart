/*import 'package:flutter/material.dart';
import 'package:telefoni_dashboard/domain/entity/boutique.dart';

class BoutiqueTable extends StatelessWidget {
  final List<Boutique> boutiques; // List<Boutique> sera ton modèle à définir
  final Function(int) onBlockToggle;

  const BoutiqueTable({
    super.key,
    required this.boutiques,
    required this.onBlockToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTableHeader(),
        ...boutiques.map((boutique) => _buildTableRow(boutique)),
      ],
    );
  }

  Widget _buildTableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('#', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Nom', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Popularité', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Bloquer', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Ventes', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildTableRow(Boutique boutique) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(boutique.id.toString()),
          Text(boutique.nom),
          _buildPopularityBar(boutique.nom),
          _buildBlockButton(boutique),
          Text('${boutique.ventes}%'),
        ],
      ),
    );
  }

  Widget _buildPopularityBar(double popularite) {
    return LinearProgressIndicator(
      value: popularite / 100,
      color: Colors.blue,
      backgroundColor: Colors.grey.shade200,
    );
  }

  Widget _buildBlockButton(Boutique boutique) {
    return ElevatedButton(
      onPressed: () => onBlockToggle(boutique.id),
      style: ElevatedButton.styleFrom(
        backgroundColor: boutique.isBlocked ? Colors.red : Colors.green,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      ),
      child: Text(boutique.isBlocked ? 'N' : 'Y'),
    );
  }
}*/
