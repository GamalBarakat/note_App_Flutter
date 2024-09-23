import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'week13/home.dart';
import 'note/home_page/screen/home_screen.dart';
import 'note/home_page/screen/widget/note_card.dart';

Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('Note');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,


      home: Home(),
    );
  }
}











