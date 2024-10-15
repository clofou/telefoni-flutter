import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telefoni_dashboard/presentation/controllers/user_controller.dart';
import 'package:telefoni_dashboard/presentation/widgets/textfield.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 800;
    final UserController userController = Get.find<UserController>();

    return Obx(() {
      if (userController.isLoading.value) {
        return const CircularProgressIndicator();
      }

      if (userController.errorMessage.value.isNotEmpty) {
        return Text(userController.errorMessage.value);
      }

      final user = userController.currentUser.value;

      return isSmallScreen
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: MyCustomTextField(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Theme.of(context).primaryColor,
                    ),
                    hintText: "Recherche ici...",
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                    Stack(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Color(0XFFE0EEDB),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Center(
                            child: Icon(
                              Icons.notifications_none_outlined,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          : Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 7),
              color: Colors.white,
              child: Row(
                children: [
                  // Icone de notification
                  Stack(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: Color(0XFFE0EEDB),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Icon(
                          Icons.notifications_none_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Positioned(
                        right: 6,
                        top: 6,
                        child: Container(
                          width: 5,
                          height: 5,
                          decoration: const BoxDecoration(
                            color: Color(0xFFEB5757),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  // Photo de profil
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      image: DecorationImage(
                        image: user.photoUrl.isNotEmpty
                            ? NetworkImage(user.photoUrl)
                            : const AssetImage("assets/images/spider.jpg")
                                as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Nom et rôle utilisateur
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.nom.isEmpty ? "Nom d'utilisateur" : user.nom,
                        style: const TextStyle(
                          fontFamily: "PatrickHandSC",
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        user.role.isEmpty ? "Rôle" : user.role,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  // Icone pour rediriger vers le profil
                  InkWell(
                    onTap: () {
                      Get.toNamed('/profile'); // Redirection vers la page de profil
                    },
                    child: const Icon(Icons.arrow_drop_down_sharp),
                  ),
                  const SizedBox(width: 20),
                  // Barre de recherche
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: MyCustomTextField(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Theme.of(context).primaryColor,
                        ),
                        hintText: "Recherche Ici ...",
                      ),
                    ),
                  ),
                ],
              ),
            );
    });
  }
}
