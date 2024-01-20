import 'package:firebase_core/firebase_core.dart';
import 'package:get/route_manager.dart';
import 'package:qhhub/consts/consts.dart';
import 'package:qhhub/views/landing_page/landingPage.dart';
// import 'package:qhhub/resources/components/waitingScreen.dart';
import 'package:qhhub/views/login_view/loginView.dart';
import 'package:qhhub/views/signup_view/SignupView.dart';
import 'package:qhhub/views/splash_screen/splash_screen_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBb2OQHtzs5TLaOBz9gKLYwYpVLdMjGHCU",
      appId: "1:344917595119:android:7d036078a6465ae3ee9c1a",
      messagingSenderId: "344917595119",
      projectId: "quickhealthhub",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        //initialRoute: "/login",
        getPages: [
          GetPage(name: "/", page: () => LoginView()),
          GetPage(name: "/login", page: () => LoginView()),
          GetPage(name: "/signup", page: () => SignupView()),
          
          GetPage(name: "/landing", page: () => LandingPage()),
          // Add other routes as needed
        ],
        theme: ThemeData(fontFamily: AppFonts.nunito),
        debugShowCheckedModeBanner: false,
        home: SplashScreen()
        );
  }
}

// Path: lib/main.dart