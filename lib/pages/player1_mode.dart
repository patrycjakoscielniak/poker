// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:poker/constants.dart';
import 'package:poker/state/store.dart';
import 'package:redux/redux.dart';

class Player1Mode extends StatelessWidget {
  Store<AppState> store;
  Player1Mode({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tableColor,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(child: store.state.hand1.hand[0].cardFront),
                Expanded(child: store.state.hand1.hand[1].cardFront),
                Expanded(child: store.state.hand1.hand[2].cardFront),
                Expanded(child: store.state.hand1.hand[3].cardFront),
                Expanded(child: store.state.hand1.hand[4].cardFront),
              ],
            ),
            Text('Score: ${store.state.player1.score}')
          ],
        )));
  }
}
