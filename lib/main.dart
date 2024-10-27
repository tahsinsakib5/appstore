import 'package:appstore/appdetailspage.dart';
import 'package:appstore/firebase_options.dart';
import 'package:appstore/homepage.dart';
import 'package:appstore/secondpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()  {
  WidgetsFlutterBinding.ensureInitialized();

  try {
   Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(const AppStoreWeb());
  } catch (e) {
    print("Firebase initialization error: $e");
  }
}

class AppStoreWeb extends StatelessWidget {
  const AppStoreWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Professional App Store',
      theme: AppTheme.theme,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/category': (context) => const CategoryPage(),
        '/appDetail': (context) => const AppDetailPage(),
      },
    );
  }
}

class AppTheme {
  static final ThemeData theme = ThemeData(
    primarySwatch: Colors.blue,
  );
}
