import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneymietest/utils/locator.dart';
import 'package:moneymietest/ui/screens/splashscreen.dart';
import 'package:moneymietest/utils/progressBarManager/dialogManager.dart';
import 'package:moneymietest/utils/progressBarManager/dialogService.dart';
import 'package:moneymietest/utils/router/navigationService.dart';
import 'package:moneymietest/utils/router/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moneymie',
      builder: (context, child) => Navigator(
        key: locator<ProgressService>().progressNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) {
          return ProgressManager(child: child);
          //DialogManager(child: child);
        }),
      ),
      theme: ThemeData(
        textTheme: GoogleFonts.muliTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      home: AnimatedSplashScreen(),
      onGenerateRoute: generateRoute,
    );
  }
}
