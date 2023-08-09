import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:poker/constants.dart';
import 'package:poker/methods/explain_result.dart';
import 'package:poker/methods/get_hand_name.dart';
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
    late Player secondPlace;
    late String winnerCardsOnHand;
    late String secondPlaceCardsOnHand;
    late String explanation;
    if (store.state.player1.score > store.state.player2.score) {
      winner = store.state.player1;
      secondPlace = store.state.player2;
    }
    if (store.state.player2.score > store.state.player1.score) {
      winner = store.state.player2;
      secondPlace = store.state.player1;
    }
    if (store.state.player2.score == store.state.player1.score) {
      winner = store.state.player1;
      secondPlace = store.state.player1;
    }
    winnerCardsOnHand = getHandName(winner.score);
    secondPlaceCardsOnHand = getHandName(secondPlace.score);
    explanation = explainResult(
        winnerCardsOnHand, secondPlaceCardsOnHand, winner, secondPlace);

    return Scaffold(
      backgroundColor: tableColor,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(top: 100, bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                winner != secondPlace
                    ? Text('Winner: ${winner.name}')
                    : const Text('Tie'),
                Text(explanation)
              ],
            ),
            PlayerCards(
              player: store.state.player1,
            ),
            PlayerCards(
              player: store.state.player2,
            ),
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

class PlayerCards extends StatelessWidget {
  const PlayerCards({
    super.key,
    required this.player,
  });

  final Player player;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: player.hand.hand[0].cardFront),
            Expanded(child: player.hand.hand[1].cardFront),
            Expanded(child: player.hand.hand[2].cardFront),
            Expanded(child: player.hand.hand[3].cardFront),
            Expanded(child: player.hand.hand[4].cardFront),
          ],
        ),
        const SizedBox(height: 10),
        Text('Score: ${player.score}'),
      ],
    );
  }
}
