import 'package:find_track_app/providers/songs_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';

void main() => runApp(
  ChangeNotifierProvider(
        create: (context) => Songs_Provider(),
        child: MyApp())
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),//.copyWith(colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple)),
      home: HomePage(),
    );
  }
}

