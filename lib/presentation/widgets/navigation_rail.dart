import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:telefoni_dashboard/presentation/controllers/auth_controller.dart';
import 'package:telefoni_dashboard/presentation/controllers/navigation/navigation_controller.dart';
import 'package:telefoni_dashboard/presentation/theme.dart';

class MyNavigationRail extends StatelessWidget {
  const MyNavigationRail({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.put(AuthController());

    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.elliptical(24, 24)),
        color: Colors.white,
        border: Border.all(
          color: Colors.white12,
          width: 1.5,
        ),
      ),
      child: ListView(
        children: [
          SvgPicture.asset(
            'assets/images/logo.svg',
            height: 100,
            width: 100,
          ),
          RailItem(
              icon: SvgPicture.asset(
                'assets/icons/dashboard_icon.svg',
                height: 30,
                width: 30,
                colorFilter:
                    ColorFilter.mode(MyColors.secondaryColor, BlendMode.srcIn),
              ),
              menuTitle: 'Dashboard',
              index: 0),
          const SizedBox(height: 10),
          RailItem(
              icon: SvgPicture.asset(
                'assets/icons/leaderboard_icon.svg',
                height: 30,
                width: 30,
                colorFilter:
                    ColorFilter.mode(MyColors.secondaryColor, BlendMode.srcIn),
              ),
              menuTitle: 'LeaderBoard',
              index: 1),
          const SizedBox(height: 10),
          RailItem(
              icon: SvgPicture.asset(
                'assets/icons/Order_icon.svg',
                height: 30,
                width: 30,
                colorFilter:
                    ColorFilter.mode(MyColors.secondaryColor, BlendMode.srcIn),
              ),
              menuTitle: 'Commandes',
              index: 2),
          const SizedBox(height: 10),
          RailItem(
              icon: SvgPicture.asset(
                'assets/icons/phone_icon.svg',
                height: 30,
                width: 30,
                colorFilter:
                    ColorFilter.mode(MyColors.secondaryColor, BlendMode.srcIn),
              ),
              menuTitle: 'Produits',
              index: 3),
          const SizedBox(height: 10),
          RailItem(
              icon: SvgPicture.asset(
                'assets/icons/litige_icon.svg',
                height: 30,
                width: 30,
                colorFilter:
                    ColorFilter.mode(MyColors.secondaryColor, BlendMode.srcIn),
              ),
              menuTitle: 'Litige',
              index: 4),
          const SizedBox(height: 10),
          RailItem(
              icon: SvgPicture.asset(
                'assets/icons/controller_icon.svg',
                height: 30,
                width: 30,
                colorFilter:
                    ColorFilter.mode(MyColors.secondaryColor, BlendMode.srcIn),
              ),
              menuTitle: 'Controllers',
              index: 5),
          const SizedBox(height: 10),
          RailItem(
              icon: SvgPicture.asset(
                'assets/icons/account_icon.svg',
                height: 30,
                width: 30,
                colorFilter:
                    ColorFilter.mode(MyColors.secondaryColor, BlendMode.srcIn),
              ),
              menuTitle: 'Profil',
              index: 6),
          const SizedBox(height: 10),

          // Bouton de deconnexion
          InkWell(
            onTap: () {
              // Ajoute la logique de déconnexion ici
              controller.deconnexion();
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: const Row(
                children: [
                  Icon(Icons.logout, color: Colors.red),
                  SizedBox(width: 8),
                  Text(
                    "Se Deconnecter",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      fontFamily: 'Poppins',
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
  final Widget icon;
  final String menuTitle;
  final int index;

  const RailItem(
      {super.key,
      required this.icon,
      required this.menuTitle,
      required this.index});

  @override
  Widget build(BuildContext context) {
    NavigationController controller = Get.find<NavigationController>();

    return Obx(() {
      return InkWell(
        onTap: () {
          controller.changePage(index);
        },
        child: Container(
          decoration: BoxDecoration(
            color: controller.selectedIndex.value == index
                ? MyColors.primaryColor
                : Colors.transparent,
            boxShadow: [
              if (controller.selectedIndex.value == index)
                Apptheme1.menuItemShadow
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 8), // Space between icon and label
              Text(
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
                      ? 'Poppins'
                      : 'Poppins',
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
