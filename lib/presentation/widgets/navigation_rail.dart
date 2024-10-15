import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telefoni_dashboard/core/constants.dart';
import 'package:telefoni_dashboard/data/datasources/auth_local_datasource.dart';
import 'package:telefoni_dashboard/data/datasources/auth_remote_datasource.dart';
import 'package:telefoni_dashboard/data/datasources/user_remote_datasource.dart';
import 'package:telefoni_dashboard/data/repositories/auth_repository_impl.dart';
import 'package:telefoni_dashboard/data/repositories/user_repository_impl.dart';
import 'package:telefoni_dashboard/domain/use_cases/recuper_current_user_info.dart';
import 'package:telefoni_dashboard/domain/use_cases/se_deconnecter.dart';
import 'package:telefoni_dashboard/presentation/controllers/deconnexion_controller.dart';
import 'package:telefoni_dashboard/presentation/controllers/navigation/navigation_controller.dart';
import 'package:telefoni_dashboard/presentation/controllers/user_controller.dart';

class MyNavigationRail extends StatelessWidget {
  MyNavigationRail({super.key});

  final DeconnexionController deconnexionController =
      Get.put(DeconnexionController(
    seDeconnecterUseCase: SeDeconnecterUseCase(
      repository: AuthRepositoryImpl(
        AuthLocalDatasource(),
        remoteDataSource: AuthRemoteDataSource(),
      ),
    ),
  ));
  // Initialiser le contrôleur

  final UserController userController = Get.put(UserController(
      recuperCurrentUserInfo: RecuperCurrentUserInfo(
    repository:
        UserRepositoryImpl(userRemoteDataSource: UserRemoteDataSource()),
  )));

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.white12,
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            "assets/images/logo.png",
            width: 100,
          ),
          const RailItem(
              icon: Icons.dashboard, menuTitle: 'Dashboard', index: 0),
          const SizedBox(height: 10),
          const RailItem(
              icon: Icons.leaderboard, menuTitle: 'LeaderBoard', index: 1),
          const SizedBox(height: 10),
          const RailItem(
              icon: Icons.shopping_cart, menuTitle: 'Commandes', index: 2),
          const SizedBox(height: 10),
          const RailItem(
              icon: Icons.phone_android_rounded,
              menuTitle: 'Produits',
              index: 3),
          const SizedBox(height: 10),
          const RailItem(
              icon: Icons.production_quantity_limits,
              menuTitle: 'Litige',
              index: 4),
          const SizedBox(height: 10),
          const RailItem(
              icon: Icons.person, menuTitle: 'Controllers', index: 5),
          const SizedBox(height: 10),
          const RailItem(icon: Icons.settings, menuTitle: 'Profil', index: 6),
          const Expanded(child: SizedBox(height: 10)),

          // Bouton de deconnexion
          InkWell(
            onTap: () {
              // Ajoute la logique de déconnexion ici
              deconnexionController.showLogoutConfirmation();
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: const Row(
                children: [
                  Icon(Icons.logout, color: Colors.red),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Se Deconnecter",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RailItem extends StatelessWidget {
  final IconData icon;
  final String menuTitle;
  final int index;

  const RailItem(
      {super.key,
      required this.icon,
      required this.menuTitle,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return GetX<NavigationController>(
      builder: (controller) {
        return InkWell(
          onTap: () {
            controller.changePage(index);
          },
          child: Container(
            decoration: BoxDecoration(
              color: controller.selectedIndex.value == index
                  ? Theme.of(context).primaryColor
                  : Colors.transparent,
              boxShadow: [
                if (controller.selectedIndex.value == index) menuItemShadow
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: controller.selectedIndex.value == index
                      ? Colors.white
                      : Theme.of(context).primaryColorDark,
                ),
                const SizedBox(width: 8), // Space between icon and label
                Expanded(
                  child: Text(
                    menuTitle,
                    style: TextStyle(
                      color: controller.selectedIndex.value == index
                          ? Colors.white
                          : Colors.black,
                      fontWeight: controller.selectedIndex.value == index
                          ? FontWeight.bold
                          : FontWeight.normal,
                      fontSize: controller.selectedIndex.value == index ? 20 : 14,
                      fontFamily: controller.selectedIndex.value == index
                          ? 'PatrickHandSC'
                          : 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
