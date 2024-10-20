import 'package:flutter/material.dart';
import 'package:telefoni_dashboard/presentation/pages/leaderboard/boutique_table.dart';
import 'package:telefoni_dashboard/presentation/pages/leaderboard/reparateur_table.dart';
import 'package:telefoni_dashboard/presentation/pages/leaderboard/vendeur_table.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BoutiqueTable(),
        const SizedBox(
          height: 20,
        ),
        Wrap(
          runSpacing: 20,
          children: [
            ReparateurTable(),
            const SizedBox(
              height: 20,
            ),
            VendeurTable()
          ],
        )
      ],
    );
  }
}
