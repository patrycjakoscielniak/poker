import 'package:flutter/material.dart';
import 'package:poker/state/store.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'pages/start_page.dart';

void main() {
  runApp(MyApp(
    store: Store(reducer, initialState: AppState.initialState()),
  ));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  const MyApp({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StartPage(),
    );
  }
}
