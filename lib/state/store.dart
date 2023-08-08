import 'dart:math';

import '../constants.dart';
import '../methods.dart';
import '../models/models.dart';

class AppState {
  final Deck _deck;
  final Hand _hand1;
  final Hand _hand2;
  final Player _player1;
  final Player _player2;

  Deck get deck => _deck;
  Hand get hand1 => _hand1;
  Hand get hand2 => _hand2;
  Player get player1 => _player1;
  Player get player2 => _player2;

  AppState(this._deck, this._hand1, this._hand2, this._player1, this._player2);

  AppState.initialState()
      : _deck = Deck(allCards: []),
        _hand1 = Hand(hand: []),
        _hand2 = Hand(hand: []),
        _player1 = Player(
          name: 'Player 1',
          hand: Hand(hand: []),
          score: 0,
          showCards: false,
        ),
        _player2 = Player(
          name: 'Player 2',
          hand: Hand(hand: []),
          score: 0,
          showCards: false,
        );
}

enum Action {
  dealCards,
  openPlayer1Mode,
  openPlayer2Mode,
  closePlayer1Mode,
  closePlayer2Mode,
  exchangeCards,
  showResults,
  playAgain,
}

AppState reducer(AppState state, action) {
  AppState newState = state;
  switch (action) {
    case Action.dealCards:
      List<Card> deck = [];
      Player player1;
      Player player2;
      List<Card> hand1 = [];
      List<Card> hand2 = [];
      int score1 = 0;
      int score2 = 0;

      for (var suit in CardSuit.values) {
        for (var type in CardType.values) {
          deck.add(Card(cardSuit: suit, cardType: type));
          deck.shuffle();
        }
      }

      int randomNumber = Random().nextInt(deck.length);
      for (int i = 0; i < 5; i++) {
        hand1.add(deck[randomNumber]);
        deck.remove(hand1[i]);
      }
      hand1.sort(((a, b) => a.cardType.index.compareTo(b.cardType.index)));
      if (hand1 == heartsPoker.hand) {
        deck.remove(spadesPoker.hand.elementAt(randomNumber));
        deck.remove(diamondsPoker.hand.elementAt(randomNumber));
        deck.remove(clubsPoker.hand.elementAt(randomNumber));
      }
      if (hand1 == spadesPoker.hand) {
        deck.remove(heartsPoker.hand.elementAt(randomNumber));
        deck.remove(diamondsPoker.hand.elementAt(randomNumber));
        deck.remove(clubsPoker.hand.elementAt(randomNumber));
      }
      if (hand1 == diamondsPoker.hand) {
        deck.remove(spadesPoker.hand.elementAt(randomNumber));
        deck.remove(heartsPoker.hand.elementAt(randomNumber));
        deck.remove(clubsPoker.hand.elementAt(randomNumber));
      }
      if (hand1 == clubsPoker.hand) {
        deck.remove(spadesPoker.hand.elementAt(randomNumber));
        deck.remove(diamondsPoker.hand.elementAt(randomNumber));
        deck.remove(heartsPoker.hand.elementAt(randomNumber));
      }
      for (int i = 0; i < 5; i++) {
        hand2.add(deck[randomNumber]);
        deck.remove(hand2[i]);
      }
      hand2.sort(((a, b) => a.cardType.index.compareTo(b.cardType.index)));
      score1 = calculateScore(hand1);
      score2 = calculateScore(hand2);

      player1 = Player(
          name: 'Player 1',
          hand: Hand(hand: hand1),
          score: score1,
          showCards: false);
      player2 = Player(
          name: 'Player 2',
          hand: Hand(hand: hand2),
          score: score2,
          showCards: false);
      newState = AppState(Deck(allCards: deck), Hand(hand: hand1),
          Hand(hand: hand2), player1, player2);
    case Action.openPlayer1Mode:
      Player player1 = Player(
          name: 'Player 1',
          hand: state.hand1,
          score: calculateScore(state.hand1.hand),
          showCards: true);
      newState = AppState(
          state.deck, state.hand1, state.hand2, player1, state.player2);
    case Action.openPlayer2Mode:
      Player player2 = Player(
          name: 'Player 2',
          hand: state.hand2,
          score: calculateScore(state.hand2.hand),
          showCards: true);
      newState = AppState(
          state.deck, state.hand1, state.hand2, state.player1, player2);
    case Action.closePlayer1Mode:
      Player player1 = Player(
          name: 'Player 1',
          hand: state.hand1,
          score: calculateScore(state.hand1.hand),
          showCards: false);
      newState = AppState(
          state.deck, state.hand1, state.hand2, player1, state.player2);
    case Action.closePlayer2Mode:
      Player player2 = Player(
          name: 'Player 2',
          hand: state.hand2,
          score: calculateScore(state.hand2.hand),
          showCards: false);
      newState = AppState(
          state.deck, state.hand1, state.hand2, state.player1, player2);
    case Action.exchangeCards:
      newState = AppState(
          state.deck, state.hand1, state.hand2, state.player1, state.player2);
    case Action.showResults:
      Player player1 = Player(
          name: 'Player 1',
          hand: state.hand1,
          score: calculateScore(state.hand1.hand),
          showCards: true);

      Player player2 = Player(
        name: 'Player 2',
        hand: state.hand2,
        score: calculateScore(state.hand2.hand),
        showCards: true,
      );
      newState =
          AppState(state.deck, state.hand1, state.hand2, player1, player2);
    case Action.playAgain:
      newState = AppState.initialState();
  }
  return newState;
}
