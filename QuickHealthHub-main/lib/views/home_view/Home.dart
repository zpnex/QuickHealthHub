import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qhhub/consts/colors.dart';
import 'package:qhhub/views/category_view/CategoryView.dart';
import 'package:qhhub/views/home_view/HomeView.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List screenList = [
    HomeView(),
    const CategoryView(),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white.withOpacity(0.5),
        selectedItemColor: AppColors.whiteColor,
        selectedLabelStyle: TextStyle(
          color: AppColors.whiteColor,
        ),
        selectedIconTheme: IconThemeData(
          color: AppColors.whiteColor,
          ),

        backgroundColor: AppColors.blueColor,
        type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.category),label: "Category"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "Doctor"),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Setting"),
          ]),
    );
  }
}
