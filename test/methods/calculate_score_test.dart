import 'package:flutter_test/flutter_test.dart';
import 'package:poker/methods/calculate_score.dart';
import 'package:poker/models/models.dart';
import 'package:poker/variables/constants.dart';

void main() {
  group('calculateScore', () {
    test('Poker hand', () {
      var hand = spadesPoker.hand;
      final result = calculateScore(hand);
      expect(result, 1500);
    });
    test('Full house hand', () {
      var hand = [
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
      ];
      final result = calculateScore(hand);
      expect(result, 1093);
    });

    test('Four of a kind hand', () {
      var hand = [
        PlayingCard(
            cardSuit: CardSuit.clubs,
            cardType: CardType.two,
            cardFront: backOfACard,
            cardBack: backOfACard),
        PlayingCard(
            cardSuit: CardSuit.hearts,
            cardType: CardType.two,
            cardFront: backOfACard,
            cardBack: backOfACard),
        PlayingCard(
            cardSuit: CardSuit.diamonds,
            cardType: CardType.two,
            cardFront: backOfACard,
            cardBack: backOfACard),
        PlayingCard(
            cardSuit: CardSuit.spades,
            cardType: CardType.two,
            cardFront: backOfACard,
            cardBack: backOfACard),
        PlayingCard(
            cardSuit: CardSuit.hearts,
            cardType: CardType.jack,
            cardFront: backOfACard,
            cardBack: backOfACard)
      ];
      final result = calculateScore(hand);
      expect(result, 831);
    });
    test('Three of a kind hand', () {
      var hand = [
        PlayingCard(
            cardSuit: CardSuit.diamonds,
            cardType: CardType.two,
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
            cardType: CardType.eight,
            cardFront: backOfACard,
            cardBack: backOfACard),
        PlayingCard(
            cardSuit: CardSuit.hearts,
            cardType: CardType.ten,
            cardFront: backOfACard,
            cardBack: backOfACard)
      ];
      final result = calculateScore(hand);
      expect(result, 690);
    });
    test('Two pair hand score', () {
      var hand = [
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
      ];
      final result = calculateScore(hand);
      expect(result, 550);
    });
    test('Pair hand', () {
      var hand = [
        PlayingCard(
            cardSuit: CardSuit.clubs,
            cardType: CardType.two,
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
            cardType: CardType.ten,
            cardFront: backOfACard,
            cardBack: backOfACard),
        PlayingCard(
            cardSuit: CardSuit.hearts,
            cardType: CardType.ace,
            cardFront: backOfACard,
            cardBack: backOfACard)
      ];
      final result = calculateScore(hand);
      expect(result, 314);
    });
    test('High card hand', () {
      var hand = [
        PlayingCard(
            cardSuit: CardSuit.clubs,
            cardType: CardType.two,
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
            cardType: CardType.queen,
            cardFront: backOfACard,
            cardBack: backOfACard),
        PlayingCard(
            cardSuit: CardSuit.hearts,
            cardType: CardType.ace,
            cardFront: backOfACard,
            cardBack: backOfACard)
      ];
      final result = calculateScore(hand);
      expect(result, 140);
    });
  });
}
