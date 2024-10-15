import 'package:flutter/material.dart';
import 'package:telefoni_dashboard/presentation/pages/dashboard/home_big_card.dart';
import 'package:telefoni_dashboard/presentation/widgets/search_bar.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [MySearchBar(), HomeBigCard()],
    );
  }
}
