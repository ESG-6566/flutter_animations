import 'package:animations_work/Widgets/AnimationExample.dart';
import 'package:animations_work/Item.dart';
import 'package:animations_work/MyTheme.dart';
import 'package:animations_work/UserData.dart';
import 'package:animations_work/Widgets/ButtonExample.dart';
import 'package:animations_work/Widgets/TestWidget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> items = [
    ItemWidget.custom(
      text: 'color animation',
      widowWidget: AnimationExample(),
    ),
    ItemWidget.custom(
      text: 'Buttons Example',
      widowWidget: ButtonExample(),
    ),
    ItemWidget.custom(text: "text", widowWidget: TestWidget()),
    ItemWidget(),
    ItemWidget(),
    ItemWidget(),
    ItemWidget(),
    ItemWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.background,
      appBar: AppBar(
        backgroundColor: MyTheme.background,
        actions: [
          IconButton(
            icon: UserData.currentTheme == MyThemeMode.defaultMode
                ? Icon(Icons.dark_mode)
                : Icon(Icons.light_mode),
            color: MyTheme.text,
            onPressed: () {
              setState(() {
                UserData.currentTheme == MyThemeMode.defaultMode
                    ? MyTheme.Switch(MyThemeMode.dark)
                    : MyTheme.Switch(MyThemeMode.defaultMode);
              });
            },
          ),
        ],
        title: Text(
          widget.title,
          style: TextStyle(color: MyTheme.text),
        ),
      ),
      // bottomNavigationBar: ElevatedButton(
      //   child: Text("open animation screen"),
      //   onPressed: () {
      //     AnimationExample.openScreen(context);
      //   },
      // ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300, // Maximum width of each item
          crossAxisSpacing: 20, // Spacing between columns
          mainAxisSpacing: 20, // Spacing between rows
        ),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return items[index];
        },
      ),
    );
  }
}
