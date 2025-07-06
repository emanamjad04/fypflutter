import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sosansheaven/app/app.bottomsheets.dart';
import 'package:sosansheaven/app/app.dialogs.dart';
import 'package:sosansheaven/app/app.locator.dart';
import 'package:sosansheaven/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();


  await Firebase.initializeApp(

    options: FirebaseOptions(
        apiKey: "AIzaSyB_gZinxdHFuC9Nn-NPZmSbkLM0qZV9bko",
        authDomain: "fyp-project-bac4a.firebaseapp.com",
        projectId: "fyp-project-bac4a",
        storageBucket: "fyp-project-bac4a.firebasestorage.app",
        messagingSenderId: "257146771763",
        appId: "1:257146771763:web:3b8daf403b993d0dfd0646",
        measurementId: "G-X28VWY1SM5"
    )
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
