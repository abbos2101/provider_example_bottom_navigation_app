import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'list_provider.dart';
import '../main_provider.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  void initState() {
    print('init - list');
    super.initState();
  }

  @override
  void dispose() {
    print('dispose - list');
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
            Consumer<ListProvider>(
              builder: (context, value, child) => Text(
                'List count = ${value.count}',
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
          Consumer<ListProvider>(
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
