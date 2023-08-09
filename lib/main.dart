// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:poker/state/store.dart';
import 'package:redux/redux.dart';
import 'pages/start_page.dart';

void main() {
  final store = Store<AppState>(reducer, initialState: AppState.initialState());
  runApp(MyApp(
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  Store<AppState> store;
  MyApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: StartPage(
          store: store,
        ),
      ),
    );
  }
}
