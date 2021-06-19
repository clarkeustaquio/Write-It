import 'package:drawing_machine/screens/main/main_body.dart';
import 'package:drawing_machine/services/flare_initializer.dart';

import 'package:flutter/material.dart';
import 'package:drawing_machine/database/table.dart';
import 'package:drawing_machine/services/sound_initializer.dart';

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: 'Write It', home: MainBody());
  }
}

void main() async {
  final DatabaseTable databaseTable = DatabaseTable();
  WidgetsFlutterBinding.ensureInitialized();
  await databaseTable.createGameTable();
  await loadSound();
  await warmupAnimations();
  runApp(Main());
}
