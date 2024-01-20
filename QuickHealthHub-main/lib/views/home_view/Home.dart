import 'package:flutter/material.dart';
import 'package:sampleapp/consts/colors.dart';
import 'package:sampleapp/views/appointment_view/AppointmentView.dart';
import 'package:sampleapp/views/category_view/CategoryView.dart';
import 'package:sampleapp/views/home_view/HomeView.dart';
import 'package:sampleapp/views/settings_view/settingsView.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List screenList = [
    const HomeView(),
    const AppointmentView(),
    const CategoryView(),
    
    const SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Color(0xffffa600).withOpacity(0.5),
        selectedItemColor: Color(0xffffa600),
        selectedLabelStyle: TextStyle(
          color: AppColors.whiteColor,
        ),
        selectedIconTheme: IconThemeData(
          color: Color(0xffffa600),
          ),

        backgroundColor: Color(0xffffeac2),
        type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.book),label: "Appointment"),
            BottomNavigationBarItem(icon: Icon(Icons.category),label: "Category"),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Setting"),
          ]),
    );
  }
}
