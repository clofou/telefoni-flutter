import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:telefoni_dashboard/presentation/theme/theme.dart';
import 'package:telefoni_dashboard/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Telfoni',
      initialRoute: '/',
      getPages: AppRoutes.routes,
      theme: AppTheme.lightTheme,
    );
  }
}