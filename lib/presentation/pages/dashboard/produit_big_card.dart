/*
import 'package:flutter/material.dart';
import 'package:telefoni_dashboard/domain/entity/telephone.dart';

class ProduitBigCard extends StatefulWidget {
  final List<Telephone> products; // Liste des produits à afficher
  final int productsPerPage; // Nombre de produits par page

  const ProduitBigCard({
    super.key,
    required this.products,
    this.productsPerPage = 4, // Par défaut, 4 produits par page
  });

  @override
  State<ProduitBigCard> createState() => _ProduitBigCardState();
}

class _ProduitBigCardState extends State<ProduitBigCard> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    // Pagination : Calculer le nombre de pages totales
    int totalPages = (widget.products.length / widget.productsPerPage).ceil();
    // Calculer les produits de la page courante
    List<ProductData> currentProducts = widget.products
        .skip(currentPage * widget.productsPerPage)
        .take(widget.productsPerPage)
        .toList();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Les Meilleurs Produits",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF393960),
            ),
          ),
          const SizedBox(height: 16),

          // Afficher les produits de la page actuelle
          ...currentProducts.map((product) => ProductRow(
                rank: product.rank,
                name: product.name,
                popularity: product.popularity,
                sales: product.sales,
                barColor: product.barColor,
                salesColor: product.salesColor,
              )),

          const SizedBox(height: 16),

          // Afficher la pagination
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: currentPage > 0
                    ? () {
                        setState(() {
                          currentPage--;
                        });
                      }
                    : null, // Désactiver si on est à la première page
              ),
              Text('Page ${currentPage + 1} sur $totalPages'),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: currentPage < totalPages - 1
                    ? () {
                        setState(() {
                          currentPage++;
                        });
                      }
                    : null, // Désactiver si on est à la dernière page
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProductRow extends StatelessWidget {
  final String rank;
  final String name;
  final double popularity;
  final String sales;
  final Color barColor;
  final Color salesColor;

  const ProductRow({
    super.key,
    required this.rank,
    required this.name,
    required this.popularity,
    required this.sales,
    required this.barColor,
    required this.salesColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(rank, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 16),
          Expanded(child: Text(name)),
          const SizedBox(width: 16),
          Expanded(
            child: MyProgressIndicator(popularity: popularity, barColor: barColor),
          ),
          const SizedBox(width: 16),
          NumberStat(salesColor: salesColor, sales: sales),
        ],
      ),
    );
  }
}
*/