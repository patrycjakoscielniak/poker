import 'dart:math';

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import '../models/models.dart';
import '../state/store.dart';

class ResultsPage extends StatelessWidget {
  final Store<AppState> store;
  const ResultsPage({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    if (max(store.state.player1.score, store.state.player2.score) ==
        store.state.player1.score) {
      return const Scaffold(
        body: Center(child: Text('Winner: Player 1')),
      );
    } else {
      return const Scaffold(
        body: Center(child: Text('Winner: Player 2')),
      );
    }
  }
}
