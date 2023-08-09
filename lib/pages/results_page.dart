import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:poker/constants.dart';
import 'package:poker/pages/start_page.dart';
import 'package:poker/state/actions/play_again.dart';
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
    late Player winner;
    if (max(store.state.player1.score, store.state.player2.score) ==
        store.state.player1.score) {
      winner = store.state.player1;
    } else {
      winner = store.state.player2;
    }
    return Scaffold(
      backgroundColor: tableColor,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(top: 100, bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Winner: ${winner.name}'),
            ElevatedButton(
                onPressed: () {
                  StoreProvider.of<AppState>(context).dispatch(PlayAgain());
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => StartPage(store: store)));
                },
                child: const Text('Play Again'))
          ],
        ),
      )),
    );
  }
}
