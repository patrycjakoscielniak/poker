import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../variables/constants.dart';
import '../methods/calculate_score.dart';
import '../models/models.dart';
import '../state/actions/deal_cards.dart';
import '../state/store.dart';
import 'game_table.dart';

class StartPage extends StatelessWidget {
  final Store<AppState> store;
  const StartPage({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tableColor,
      body: Center(
          child: Stack(alignment: Alignment.center, children: [
        Image.asset(
          'images/cards/deck.png',
          width: 220,
        ),
        ElevatedButton(
            onPressed: () {
              Deck deck = store.state.deck;
              Player player1 = store.state.player1;
              Player player2 = store.state.player2;
              Hand hand1 = store.state.hand1;
              Hand hand2 = store.state.hand2;
              int score1 = 0;
              int score2 = 0;

              for (var suit in CardSuit.values) {
                for (var type in CardType.values) {
                  deck.allCards.add(PlayingCard(
                      cardSuit: suit,
                      cardType: type,
                      cardFront: Image.asset(
                        'images/cards/${suit.name}_${type.name}.png',
                        width: 100,
                      ),
                      cardBack: backOfACard));
                  deck.allCards.shuffle();
                }
              }

              for (int i = 0; i < 5; i++) {
                int randomNumber = Random().nextInt(deck.allCards.length);
                PlayingCard randomCard = deck.allCards[randomNumber];
                hand1.hand.add(randomCard);
                deck.allCards.remove(randomCard);
              }
              hand1.hand.sort(
                  ((a, b) => a.cardType.index.compareTo(b.cardType.index)));
              int randomNumber = Random().nextInt(5);
              if (hand1.hand == heartsPoker.hand) {
                deck.allCards.remove(spadesPoker.hand.elementAt(randomNumber));
                deck.allCards
                    .remove(diamondsPoker.hand.elementAt(randomNumber));
                deck.allCards.remove(clubsPoker.hand.elementAt(randomNumber));
              }
              if (hand1.hand == spadesPoker.hand) {
                deck.allCards.remove(heartsPoker.hand.elementAt(randomNumber));
                deck.allCards
                    .remove(diamondsPoker.hand.elementAt(randomNumber));
                deck.allCards.remove(clubsPoker.hand.elementAt(randomNumber));
              }
              if (hand1.hand == diamondsPoker.hand) {
                deck.allCards.remove(spadesPoker.hand.elementAt(randomNumber));
                deck.allCards.remove(heartsPoker.hand.elementAt(randomNumber));
                deck.allCards.remove(clubsPoker.hand.elementAt(randomNumber));
              }
              if (hand1.hand == clubsPoker.hand) {
                deck.allCards.remove(spadesPoker.hand.elementAt(randomNumber));
                deck.allCards
                    .remove(diamondsPoker.hand.elementAt(randomNumber));
                deck.allCards.remove(heartsPoker.hand.elementAt(randomNumber));
              }
              for (int i = 0; i < 5; i++) {
                int randomNumber = Random().nextInt(deck.allCards.length);
                PlayingCard randomCard = deck.allCards[randomNumber];
                hand2.hand.add(randomCard);
                deck.allCards.remove(randomCard);
              }
              hand2.hand.sort(
                  ((a, b) => a.cardType.index.compareTo(b.cardType.index)));
              score1 = calculateScore(hand1.hand);
              score2 = calculateScore(hand2.hand);

              player1 = Player(
                name: 'Player 1',
                hand: hand1,
                score: score1,
              );
              player2 = Player(
                name: 'Player 2',
                hand: hand2,
                score: score2,
              );

              StoreProvider.of<AppState>(context)
                  .dispatch(DealCards(deck, hand1, hand2, player1, player2));
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => GameTableAfterDeal(
                        store: store,
                      )));
            },
            child: const Text(
              'Start Game',
              style: TextStyle(color: Colors.black),
            )),
      ])),
    );
  }
}
