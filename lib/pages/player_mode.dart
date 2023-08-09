// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:poker/variables/constants.dart';
import 'package:poker/methods/calculate_score.dart';
import 'package:poker/models/models.dart';
import 'package:poker/state/actions/exchange_cards.dart';
import 'package:redux/redux.dart';

import '../state/store.dart';

class PlayerMode extends StatefulWidget {
  Store<AppState> store;
  Player player;
  PlayerMode({
    super.key,
    required this.store,
    required this.player,
  });

  @override
  State<PlayerMode> createState() => _PlayerModeState();
}

class _PlayerModeState extends State<PlayerMode> {
  @override
  Widget build(BuildContext context) {
    List<PlayingCard> selectedCards = [];
    List<PlayingCard> playersCards = widget.player.hand.hand;
    PlayingCard card1 = playersCards[0];
    PlayingCard card2 = playersCards[1];
    PlayingCard card3 = playersCards[2];
    PlayingCard card4 = playersCards[3];
    PlayingCard card5 = playersCards[4];
    return Scaffold(
      backgroundColor: tableColor,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text('Select cards that you want to exchange'),
            const SizedBox(height: 150),
            Row(
              children: [
                PlayerCard(selectedCards: selectedCards, card: card1),
                PlayerCard(selectedCards: selectedCards, card: card2),
                PlayerCard(selectedCards: selectedCards, card: card3),
                PlayerCard(selectedCards: selectedCards, card: card4),
                PlayerCard(selectedCards: selectedCards, card: card5),
              ],
            ),
            const SizedBox(height: 20),
            IconButton(
                onPressed: () {
                  List<PlayingCard> hand = playersCards;
                  Deck deck = widget.store.state.deck;
                  int randomNumber = Random().nextInt(deck.allCards.length);
                  if (selectedCards.contains(card1)) {
                    hand.remove(card1);
                    hand.add(deck.allCards[randomNumber]);
                    deck.allCards.removeAt(randomNumber);
                    deck.allCards.add(card1);
                    deck.allCards.shuffle();
                  }
                  if (selectedCards.contains(card2)) {
                    hand.remove(card2);
                    hand.add(deck.allCards[randomNumber]);
                    deck.allCards.removeAt(randomNumber);
                    deck.allCards.add(card2);
                    deck.allCards.shuffle();
                  }
                  if (selectedCards.contains(card3)) {
                    hand.remove(card3);
                    hand.add(deck.allCards[randomNumber]);
                    deck.allCards.removeAt(randomNumber);
                    deck.allCards.add(card3);
                    deck.allCards.shuffle();
                  }
                  if (selectedCards.contains(card4)) {
                    hand.remove(card4);
                    hand.add(deck.allCards[randomNumber]);
                    deck.allCards.removeAt(randomNumber);
                    deck.allCards.add(card4);
                    deck.allCards.shuffle();
                  }
                  if (selectedCards.contains(card5)) {
                    hand.remove(card5);
                    hand.add(deck.allCards[randomNumber]);
                    deck.allCards.removeAt(randomNumber);
                    deck.allCards.add(card5);
                    deck.allCards.shuffle();
                  }
                  hand.sort(
                      ((a, b) => a.cardType.index.compareTo(b.cardType.index)));
                  Player player = Player(
                    name: widget.player.name,
                    hand: Hand(hand: hand),
                    score: calculateScore(hand),
                  );
                  if (widget.player.name == widget.store.state.player2.name) {
                    StoreProvider.of<AppState>(context).dispatch(ExchangeCards(
                        deck,
                        widget.store.state.hand1,
                        Hand(hand: hand),
                        widget.store.state.player1,
                        player));
                  } else {
                    StoreProvider.of<AppState>(context).dispatch(ExchangeCards(
                        deck,
                        Hand(hand: hand),
                        widget.store.state.hand2,
                        player,
                        widget.store.state.player2));
                  }

                  setState(() {});
                },
                icon: const Icon(Icons.autorenew))
          ],
        ),
      )),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Row(
                children: [
                  Icon(Icons.close),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Back to Table View',
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class PlayerCard extends StatelessWidget {
  const PlayerCard({
    super.key,
    required this.selectedCards,
    required this.card,
  });

  final List<PlayingCard> selectedCards;
  final PlayingCard card;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
            onTap: () {
              if (selectedCards.contains(card)) {
                selectedCards.remove(card);
              } else {
                selectedCards.add(card);
              }
            },
            child: card.cardFront));
  }
}
