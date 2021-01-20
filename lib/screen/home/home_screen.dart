import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_provider.dart';
import '../main_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    print('init - home');
    super.initState();
  }

  @override
  void dispose() {
    print('dispose - home');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer<MainProvider>(
              builder: (context, value, child) => Text(
                'public = ${value.publicCount}',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Consumer<HomeProvider>(
              builder: (context, value, child) => Text(
                'Home count = ${value.count}',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Consumer<MainProvider>(
            builder: (context, value, child) => FloatingActionButton(
              child: Icon(Icons.home),
              onPressed: () => value.onIcrementPublicCount(),
            ),
          ),
          SizedBox(width: 10),
          Consumer<HomeProvider>(
            builder: (context, value, child) => FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => value.onIncrement(),
            ),
          ),
        ],
      ),
    );
  }
}
