import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade50,
        leading: Icon(Icons.arrow_back_ios_new),
        actions: [IconButton(onPressed: () {loginController.onrefresh();}, icon: Icon(Icons.sync))],
        title: const Text(
          "Login",
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
        ),
      ),
      body: Stack(
        children: [
          Image(
              fit: BoxFit.cover,
              height: MediaQuery.sizeOf(context).height,
              image: NetworkImage(
                  'https://marketplace.canva.com/EAE6ppRBEro/1/0/900w/canva-blue-minimalist-abstract-phone-wallpaper-LqcLfLsTXZ0.jpg')),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: IntrinsicHeight(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: MediaQuery.of(context).size.width /
                                    5,

                                backgroundColor: Colors.white,
                                child: Image(
                                    height:
                                        MediaQuery.sizeOf(context).height / 3,
                                    width: MediaQuery.sizeOf(context).width,
                                    image: NetworkImage(
                                        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/512px-Circle-icons-profile.svg.png')),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Welcome!",
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Obx(() => TextField(
                              cursorColor: Colors.black,
                              focusNode: loginController.usernameFocusNode,
                              controller:
                                  loginController.usernameController.value,
                              decoration: const InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(10),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  labelText: "Username",
                                  labelStyle: TextStyle(color: Colors.black)),
                            )),
                        const SizedBox(height: 16.0),
                        Obx(() => TextField(
                              controller:
                                  loginController.passwordController.value,
                              focusNode: loginController.passwordFocusNode,
                              decoration: const InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(10),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  labelText: "Password",
                                  labelStyle: TextStyle(color: Colors.black)),
                              cursorColor: Colors.black,
                              obscureText: true,
                            )),
                        const SizedBox(height: 16.0),
                        Obx(() => loginController.isLoading.value
                            ? const CircularProgressIndicator(
                          color: Colors.cyan,
                        )
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.cyan.shade50),
                                onPressed: loginController.login,
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                              )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
