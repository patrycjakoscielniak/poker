import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:poker/state/actions/open_player_mode.dart';
import 'package:poker/state/actions/play_again.dart';
import 'package:poker/state/actions/show_results.dart';

import '../constants.dart';
import '../methods.dart';
import '../models/models.dart';
import '../state/actions/deal_cards.dart';
import '../state/store.dart';

class StartPage extends StatelessWidget {
  const StartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 49, 102, 51),
      body: Center(
          child: Stack(alignment: Alignment.center, children: [
        Image.asset(
          'images/cards/deck.png',
          width: 220,
        ),
        ElevatedButton(
            onPressed: () {
              Deck deck = Deck(allCards: []);
              Player player1;
              Player player2;
              Hand hand1 = Hand(hand: []);
              Hand hand2 = Hand(hand: []);
              int score1 = 0;
              int score2 = 0;

              for (var suit in CardSuit.values) {
                for (var type in CardType.values) {
                  deck.allCards.add(PlayingCard(
                      cardSuit: suit,
                      cardType: type,
                      cardFront: Image.asset('images/cards/$suit/$type.png'),
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

              player1 = Player(
                  name: 'Player 1',
                  hand: hand1,
                  score: score1,
                  showCards: false);
              player2 = Player(
                  name: 'Player 2',
                  hand: hand2,
                  score: score2,
                  showCards: false);

              // StoreProvider.of<AppState>(context)
              //     .dispatch(DealCards(deck, hand1, hand2, player1, player2));
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => GameTableAfterDeal()));
            },
            child: const Text(
              'Start Game',
              style: TextStyle(color: Colors.black),
            )),
      ])),
    );
  }
}

class GameTableAfterDeal extends StatelessWidget {
  GameTableAfterDeal({
    super.key,
  });

  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 49, 102, 51),

      // bottomNavigationBar: BottomNavigationBar(items: const [
      //   BottomNavigationBarItem(
      //       icon: Icon(Icons.military_tech), label: 'Show Winner'),
      //   BottomNavigationBarItem(icon: Icon(Icons.style), label: 'Play'),
      //   BottomNavigationBarItem(icon: Icon(Icons.autorenew), label: 'Restart')
      // ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'images/cards/back.png',
                    width: 100,
                  )
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    // Player player1 = Player(
                    //     name: 'Player 1',
                    //     hand: state.hand1,
                    //     score: calculateScore(state.hand1.hand),
                    //     showCards: true);
                    // StoreProvider.of<AppState>(context)
                    //     .dispatch(OpenPlayer1Mode(
                    //   player1),
                    // ));
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PlayerMode()));
                  },
                  child: const Text('Player 1')),
            ]),
            const SizedBox(height: 100),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              IconButton(
                  onPressed: () {
                    // Player player1 = Player(
                    //     name: 'Player 1',
                    //     hand: state.hand1,
                    //     score: calculateScore(state.hand1.hand),
                    //     showCards: true);

                    // Player player2 = Player(
                    //   name: 'Player 2',
                    //   hand: state.hand2,
                    //   score: calculateScore(state.hand2.hand),
                    //   showCards: true,
                    // );
                    // StoreProvider.of<AppState>(context)
                    //     .dispatch(ShowResults(player1, player2));
                  },
                  icon: const Icon(Icons.military_tech)),
              Image.asset(
                'images/cards/deck.png',
                width: 170,
              ),
              IconButton(
                  onPressed: () {
                    // Deck deck = AppState.initialState().deck;
                    // Hand hand1 = AppState.initialState().hand1;
                    // Hand hand2 = AppState.initialState().hand2;
                    // Player player1 = AppState.initialState().player1;
                    // Player player2 = AppState.initialState().player2;
                    // StoreProvider.of<AppState>(context).dispatch(
                    //     PlayAgain(deck, hand1, hand2, player1, player2));
                  },
                  icon: const Icon(Icons.autorenew)),
            ]),
            const SizedBox(height: 100),
            Stack(children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'images/cards/back.png',
                    width: 100,
                  )
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    // Player player2 = Player(
                    //     name: 'Player 2',
                    //     hand: state.hand2,
                    //     score: calculateScore(state.hand2.hand),
                    //     showCards: true);
                    // StoreProvider.of<AppState>(context)
                    //     .dispatch(OpenPlayer2Mode(
                    //   player2),
                    // ));
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PlayerMode()));
                  },
                  child: const Text('Player 1')),
            ]),
          ],
        ),
      ),
    );
  }
}

class PlayerMode extends StatelessWidget {
  const PlayerMode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Player Mode')));
  }
}
