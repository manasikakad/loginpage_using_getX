import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginpage/views/bottom_bar.dart';
import 'package:loginpage/views/home_page.dart';
import '../models/login_model.dart';

class LoginController extends GetxController {
  Rx<User> user = User(username: "", password: "").obs;
  var isLoading = false.obs;
  Rx<TextEditingController> usernameController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  late FocusNode usernameFocusNode;
  late FocusNode passwordFocusNode;
  List<User> loginData = [
    User(username: "admin1", password: "admin1"),
    User(username: "admin2", password: "admin2"),
  ];

  void login() async {
    print(usernameController.value.text);
    isLoading(true);
    bool isValid = false;
    await Future.delayed(Duration(seconds: 3));
    for (var userData in loginData) {
      print(usernameController.value.text);

      if (userData.username == usernameController.value.text &&
          userData.password == passwordController.value.text) {
        isValid = true;
        break;
      }
    }
    isLoading(false);
    if (isValid) {
      Get.snackbar(
          "Login Success", "Welcome, ${usernameController.value.text}!",
          backgroundColor: Colors.cyan.shade200, colorText: Colors.black);
      await Get.to(BottomNavBar());
    } else {
      Get.snackbar("Login Failed", "Invalid username or password",
          backgroundColor: Colors.red.shade300, colorText: Colors.white);
    }
  }

  onrefresh() {
    usernameController.value.text = '';
    passwordController.value.text = '';
    FocusScope.of(Get.context!).requestFocus(FocusNode());
  }

  // void setUsername(String username) {
  //   user.update((user) {
  //     user?.username = username;
  //   });
  // }

  // void setPassword(String password) {
  //   user.update((user) {
  //     user?.password = password;
  //   });
  // }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    passwordFocusNode = FocusNode();
    usernameFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    usernameController.close();
    passwordController.close();
    super.dispose();
  }
}
