import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'game_provider.dart';
import '../main_provider.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    print('init - game');
    super.initState();
  }

  @override
  void dispose() {
    print('dispose - game');
    super.dispose();
  }

  int count = 0;

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
            Consumer<GameProvider>(
              builder: (context, value, child) => Text(
                'Game count = ${value.count}',
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
          Consumer<GameProvider>(
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
