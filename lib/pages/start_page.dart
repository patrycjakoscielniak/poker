import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../constants.dart';
import '../methods.dart';
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

              int randomNumber = Random().nextInt(deck.allCards.length);
              for (int i = 0; i < 5; i++) {
                hand1.hand.add(deck.allCards[randomNumber]);
                deck.allCards.remove(hand1.hand[i]);
              }
              hand1.hand.sort(
                  ((a, b) => a.cardType.index.compareTo(b.cardType.index)));
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
                hand2.hand.add(deck.allCards[randomNumber]);
                deck.allCards.remove(hand2.hand[i]);
              }
              hand2.hand.sort(
                  ((a, b) => a.cardType.index.compareTo(b.cardType.index)));
              score1 = calculateScore(hand1.hand);
              score2 = calculateScore(hand2.hand);

              final pokerHand = Hand(hand: [
                PlayingCard(
                    cardSuit: CardSuit.clubs,
                    cardType: CardType.ten,
                    cardFront: Image.asset('images/cards/clubs_ten.png'),
                    cardBack: backOfACard),
                PlayingCard(
                    cardSuit: CardSuit.clubs,
                    cardType: CardType.jack,
                    cardFront: Image.asset('images/cards/clubs_jack.png'),
                    cardBack: backOfACard),
                PlayingCard(
                    cardSuit: CardSuit.clubs,
                    cardType: CardType.queen,
                    cardFront: Image.asset('images/cards/clubs_queen.png'),
                    cardBack: backOfACard),
                PlayingCard(
                    cardSuit: CardSuit.clubs,
                    cardType: CardType.king,
                    cardFront: Image.asset('images/cards/clubs_king.png'),
                    cardBack: backOfACard),
                PlayingCard(
                    cardSuit: CardSuit.clubs,
                    cardType: CardType.ace,
                    cardFront: Image.asset('images/cards/clubs_ace.png'),
                    cardBack: backOfACard)
              ]);

              player1 = Player(
                  name: 'Player 1',
                  hand: pokerHand,
                  score: score1,
                  showCards: false);
              player2 = Player(
                  name: 'Player 2',
                  hand: hand2,
                  score: score2,
                  showCards: false);

              StoreProvider.of<AppState>(context).dispatch(
                  DealCards(deck, pokerHand, hand2, player1, player2));
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
