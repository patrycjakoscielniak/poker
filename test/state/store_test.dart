import 'package:flutter_test/flutter_test.dart';
import 'package:poker/models/models.dart';
import 'package:poker/state/actions/deal_cards.dart';
import 'package:poker/state/store.dart';
import 'package:poker/variables/constants.dart';

void main() {
  test('reducer', () {
    var state = AppState.initialState();
    List<PlayingCard> allCards = [];
    for (var suit in CardSuit.values) {
      for (var type in CardType.values) {
        allCards.add(PlayingCard(
            cardSuit: suit,
            cardType: type,
            cardFront: backOfACard,
            cardBack: backOfACard));
        allCards.shuffle();
      }
    }
    var hand = Hand(hand: [
      PlayingCard(
          cardSuit: CardSuit.hearts,
          cardType: CardType.five,
          cardFront: backOfACard,
          cardBack: backOfACard),
      PlayingCard(
          cardSuit: CardSuit.spades,
          cardType: CardType.six,
          cardFront: backOfACard,
          cardBack: backOfACard),
      PlayingCard(
          cardSuit: CardSuit.spades,
          cardType: CardType.eight,
          cardFront: backOfACard,
          cardBack: backOfACard),
      PlayingCard(
          cardSuit: CardSuit.hearts,
          cardType: CardType.jack,
          cardFront: backOfACard,
          cardBack: backOfACard),
      PlayingCard(
          cardSuit: CardSuit.diamonds,
          cardType: CardType.queen,
          cardFront: backOfACard,
          cardBack: backOfACard),
    ]);
    var action = DealCards(
        Deck(allCards: allCards),
        hand,
        hand,
        Player(name: 'Player 1', hand: hand, score: 120),
        Player(name: 'Player 2', hand: hand, score: 120));
    final result = reducer(state, action);
    expect(
        result.player1.score,
        AppState(
                Deck(allCards: allCards),
                hand,
                hand,
                Player(name: 'Player 1', hand: hand, score: 120),
                Player(name: 'Player 2', hand: hand, score: 120))
            .player1
            .score);
  });
}
