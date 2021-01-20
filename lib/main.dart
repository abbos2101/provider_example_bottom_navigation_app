import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/main_provider.dart';
import 'screen/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ChangeNotifierProvider(
        create: (_) => MainProvider(),
        child: MainScreen(),
      ),
    );
  }
}
