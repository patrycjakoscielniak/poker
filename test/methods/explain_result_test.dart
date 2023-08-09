import 'package:flutter_test/flutter_test.dart';
import 'package:poker/methods/explain_result.dart';
import 'package:poker/models/models.dart';
import 'package:poker/variables/constants.dart';

void main() {
  group('ecplainResult', () {
    test('Different Hands', () {
      var handName1 = 'Full House';
      var handName2 = 'Two Pairs';
      var player1 = Player(
          name: 'Player1',
          hand: Hand(hand: [
            PlayingCard(
                cardSuit: CardSuit.diamonds,
                cardType: CardType.eight,
                cardFront: backOfACard,
                cardBack: backOfACard),
            PlayingCard(
                cardSuit: CardSuit.hearts,
                cardType: CardType.eight,
                cardFront: backOfACard,
                cardBack: backOfACard),
            PlayingCard(
                cardSuit: CardSuit.clubs,
                cardType: CardType.eight,
                cardFront: backOfACard,
                cardBack: backOfACard),
            PlayingCard(
                cardSuit: CardSuit.diamonds,
                cardType: CardType.king,
                cardFront: backOfACard,
                cardBack: backOfACard),
            PlayingCard(
                cardSuit: CardSuit.spades,
                cardType: CardType.king,
                cardFront: backOfACard,
                cardBack: backOfACard)
          ]),
          score: 1093);
      var player2 = Player(
          name: 'Player 2',
          hand: Hand(hand: [
            PlayingCard(
                cardSuit: CardSuit.clubs,
                cardType: CardType.eight,
                cardFront: backOfACard,
                cardBack: backOfACard),
            PlayingCard(
                cardSuit: CardSuit.hearts,
                cardType: CardType.eight,
                cardFront: backOfACard,
                cardBack: backOfACard),
            PlayingCard(
                cardSuit: CardSuit.clubs,
                cardType: CardType.ten,
                cardFront: backOfACard,
                cardBack: backOfACard),
            PlayingCard(
                cardSuit: CardSuit.diamonds,
                cardType: CardType.ace,
                cardFront: backOfACard,
                cardBack: backOfACard),
            PlayingCard(
                cardSuit: CardSuit.hearts,
                cardType: CardType.ace,
                cardFront: backOfACard,
                cardBack: backOfACard)
          ]),
          score: 550);
      final result = explainResult(handName1, handName2, player1, player2);
      expect(result, 'Full House Has Higher Rank Than Two Pairs');
    });
    test('Same Hands', () {
      var handName1 = 'Two Pairs';
      var handName2 = 'Two Pairs';
      var player1 = Player(
          name: 'Player 1',
          hand: Hand(hand: [
            PlayingCard(
                cardSuit: CardSuit.spades,
                cardType: CardType.eight,
                cardFront: backOfACard,
                cardBack: backOfACard),
            PlayingCard(
                cardSuit: CardSuit.diamonds,
                cardType: CardType.eight,
                cardFront: backOfACard,
                cardBack: backOfACard),
            PlayingCard(
                cardSuit: CardSuit.clubs,
                cardType: CardType.king,
                cardFront: backOfACard,
                cardBack: backOfACard),
            PlayingCard(
                cardSuit: CardSuit.spades,
                cardType: CardType.ace,
                cardFront: backOfACard,
                cardBack: backOfACard),
            PlayingCard(
                cardSuit: CardSuit.clubs,
                cardType: CardType.ace,
                cardFront: backOfACard,
                cardBack: backOfACard)
          ]),
          score: 553);
      var player2 = Player(
          name: 'Player 2',
          hand: Hand(hand: [
            PlayingCard(
                cardSuit: CardSuit.clubs,
                cardType: CardType.eight,
                cardFront: backOfACard,
                cardBack: backOfACard),
            PlayingCard(
                cardSuit: CardSuit.hearts,
                cardType: CardType.eight,
                cardFront: backOfACard,
                cardBack: backOfACard),
            PlayingCard(
                cardSuit: CardSuit.clubs,
                cardType: CardType.ten,
                cardFront: backOfACard,
                cardBack: backOfACard),
            PlayingCard(
                cardSuit: CardSuit.diamonds,
                cardType: CardType.ace,
                cardFront: backOfACard,
                cardBack: backOfACard),
            PlayingCard(
                cardSuit: CardSuit.hearts,
                cardType: CardType.ace,
                cardFront: backOfACard,
                cardBack: backOfACard)
          ]),
          score: 550);
      final result = explainResult(handName1, handName2, player1, player2);
      expect(result, 'Player 1 Cards Have Higher Index Than Player 2 Cards');
    });
  });
}
