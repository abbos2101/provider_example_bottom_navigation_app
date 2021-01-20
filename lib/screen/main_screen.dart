import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'game/game_provider.dart';
import 'game/game_screen.dart';
import 'home/home_screen.dart';
import 'home/home_provider.dart';
import 'list/list_screen.dart';
import 'list/list_provider.dart';
import 'main_provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    Provider.of<MainProvider>(context, listen: false).launch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Example'),
        actions: [
          Center(child: Text('Save')),
          Consumer<MainProvider>(
            builder: (context, value, child) => CupertinoSwitch(
              value: value.saveState,
              onChanged: (checked) => value.onSaveState(checked),
            ),
          ),
        ],
      ),
      body: Consumer<MainProvider>(
        builder: (context, value, child) {
          if (value.saveState)
            return IndexedStack(
              index: value.bottomIndex,
              children: [
                ChangeNotifierProvider(
                  create: (_) => GameProvider(),
                  child: GameScreen(),
                ),
                ChangeNotifierProvider(
                  create: (_) => HomeProvider(),
                  child: HomeScreen(),
                ),
                ChangeNotifierProvider(
                  create: (_) => ListProvider(),
                  child: ListScreen(),
                ),
              ],
            );
          if (value.bottomIndex == 0)
            return ChangeNotifierProvider(
              create: (_) => GameProvider(),
              child: GameScreen(),
            );
          if (value.bottomIndex == 1)
            return ChangeNotifierProvider(
              create: (_) => HomeProvider(),
              child: HomeScreen(),
            );
          if (value.bottomIndex == 2)
            return ChangeNotifierProvider(
              create: (_) => ListProvider(),
              child: ListScreen(),
            );
          return Center(child: Text('Xatolik'));
        },
      ),
      bottomNavigationBar: Consumer<MainProvider>(
        builder: (context, value, child) => BottomNavigationBar(
          currentIndex: value.bottomIndex,
          onTap: (index) => value.onChangedBottomId(index),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.play_arrow), label: 'Game'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.group), label: 'List'),
          ],
        ),
      ),
    );
  }
}
