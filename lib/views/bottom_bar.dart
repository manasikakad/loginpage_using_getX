import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:loginpage/controllers/bottom_nav_bar.dart';
import 'package:loginpage/views/profile_page.dart';
import 'package:loginpage/views/settings_page.dart';

import 'home_page.dart';

class BottomNavBar extends StatelessWidget {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.grey.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 12);


  @override
  Widget build(BuildContext context) {
    final BottomNavController landingPageController =
    Get.put(BottomNavController(), permanent: false);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar:
      buildBottomNavigationMenu(context, landingPageController),
      body: Obx(() => IndexedStack(
        index: landingPageController.tabIndex.value,
        children: [
          HomePage(),
          ProfilePage(),
          SettingsPage(),
        ],
      )),
    );
  }

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() =>
        MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: SizedBox(
              // height: 55,
              child: BottomNavigationBar(
                showUnselectedLabels: true,
                showSelectedLabels: true,
                onTap: landingPageController.changeTabIndex,
                currentIndex: landingPageController.tabIndex.value,
                backgroundColor:Colors.cyan.shade100,
                unselectedItemColor: Colors.grey.withOpacity(0.5),
                selectedItemColor: Colors.black,
                unselectedLabelStyle: unselectedLabelStyle,
                selectedLabelStyle: selectedLabelStyle,
                items: [
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(bottom: 7),
                      child: Icon(
                        Icons.home,
                        size: 20.0,
                      ),
                    ),
                    label: 'Home',
                    backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(bottom: 7),
                      child: Icon(
                        Icons.person,
                        size: 20.0,
                      ),
                    ),
                    label: 'Profile',
                    backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
                  ),

                  BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(bottom: 7),
                      child: Icon(
                        Icons.settings,
                        size: 20.0,
                      ),
                    ),
                    label: 'Settings',
                    backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
                  ),
                ],
              ),
            )));
  }
}
