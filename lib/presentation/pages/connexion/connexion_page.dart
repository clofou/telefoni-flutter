import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telefoni_dashboard/data/datasources/auth_local_datasource.dart';
import 'package:telefoni_dashboard/data/datasources/auth_remote_datasource.dart';
import 'package:telefoni_dashboard/data/repositories/auth_repository_impl.dart';
import 'package:telefoni_dashboard/domain/use_cases/se_connecter.dart';
import 'package:telefoni_dashboard/presentation/controllers/auth_controller.dart';
import 'package:telefoni_dashboard/presentation/widgets/button.dart';
import 'package:telefoni_dashboard/presentation/widgets/textfield.dart';

class ConnexionPage extends StatelessWidget {
  ConnexionPage({super.key});

  final ConnexionController controller = Get.put(ConnexionController(
    connexionUseCase: ConnexionUseCase(
      repository: AuthRepositoryImpl(
        AuthLocalDatasource(),
        remoteDataSource: AuthRemoteDataSource(),
      ),
    ),
  ));

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // La partie de gauche de la page Connexion
          Container(
            decoration: const BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                image: AssetImage("assets/images/sidebar.png"),
                fit: BoxFit.cover,
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.45,
          ),

          // La Partie de droite de la page de connexion
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            width: MediaQuery.of(context).size.width * 0.55,
            child: Column(
              children: [
                // Section d'en Haut Le Login
                Row(
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      width: 150,
                    ),
                    const Text("Login",
                        style: TextStyle(
                            fontFamily: "PatrickHandSC", fontSize: 45)),
                  ],
                ),

                // Les Champs de texte
                MyCustomTextField(
                  labelText: "Email",
                  controller: emailController,
                  suffixIcon: Icon(
                    Icons.email,
                    color: Theme.of(context).primaryColor,
                  ),
                  hintText: "Entrez Vôtre Email",
                ),
                const SizedBox(height: 10),
                MyCustomTextField(
                  labelText: "Mot de passe",
                  controller: passwordController,
                  suffixIcon: Icon(
                    Icons.password,
                    color: Theme.of(context).primaryColor,
                  ),
                  obscureText: true,
                ),

                // Affichage du message d'erreur
                Obx(() {
                  if (controller.errorMessage.value.isNotEmpty) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        controller.errorMessage.value,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                }),

                Container(
                  margin: const EdgeInsets.fromLTRB(20, 40, 20, 80),
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey,
                ),

                // Le Bouton de validation
                Obx(() {
                  return MyCustomButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () {
                            controller.login(
                              emailController.text,
                              passwordController.text,
                            );
                          },
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : const Text(
                            "Se Connecter",
                            style: TextStyle(color: Colors.white),
                          ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
