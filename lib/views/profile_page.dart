import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/profile_page_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _HomePageState();
}

class _HomePageState extends State<ProfilePage> {
  final ProfilePageController profilePageController =
      Get.put(ProfilePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade50,
        leading: Icon(Icons.arrow_back_ios_new),
        title: const Text(
          "Profile Page",
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              if (profilePageController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "State",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        hint: Text("Select State"),
                        value: profilePageController.selectedState.value.isEmpty
                            ? null
                            : profilePageController.selectedState.value,
                        items: profilePageController.states
                            .map((state) => DropdownMenuItem<String>(
                                  value: state,
                                  child: Text(state),
                                ))
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            profilePageController.updateCities(value);
                          }
                        },
                        underline: Container(),
                        isDense: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "City",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        hint: Text("Select City"),
                        value: profilePageController.selectedCity.value.isEmpty
                            ? null
                            : profilePageController.selectedCity.value,
                        items: profilePageController.cities
                            .map((city) => DropdownMenuItem<String>(
                                  value: city,
                                  child: Text(city),
                                ))
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            profilePageController.updatePincodes(value);
                          }
                          print(profilePageController.selectedPincode);
                        },
                        isDense: true,
                        underline: Container(),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Pincode",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<int>(
                        hint: Text("Select Pincode"),
                        value: profilePageController.selectedPincode.value == 0
                            ? null
                            : profilePageController.selectedPincode.value,
                        items: profilePageController.pincodes
                            .map((pincode) => DropdownMenuItem<int>(
                                  value: pincode,
                                  child: Text(pincode.toString()),
                                ))
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            profilePageController.selectedPincode(value);
                          }
                        },
                        isDense: true,
                        underline: Container(),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
