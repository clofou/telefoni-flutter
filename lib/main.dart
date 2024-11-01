import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telefoni_dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:telefoni_dashboard/presentation/controllers/navigation/navigation_controller.dart';
import 'package:telefoni_dashboard/presentation/theme/theme.dart';
import 'package:telefoni_dashboard/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    Get.put(NavigationController());
    return GetMaterialApp(
      title: 'Telfoni',
      initialRoute: '/',
      getPages: AppRoutes.routes,
      theme: AppTheme.lightTheme,
    );
  }
}