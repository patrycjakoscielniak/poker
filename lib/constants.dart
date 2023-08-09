import 'package:flutter/material.dart';

import 'models/models.dart';

final backOfACard = Image.asset('images/cards/back.png');
const tableColor = Color.fromARGB(255, 49, 102, 51);

final heartsPoker = Hand(hand: [
  PlayingCard(
      cardSuit: CardSuit.hearts,
      cardType: CardType.ten,
      cardFront: Image.asset('images/cards/hearts_ten.png'),
      cardBack: backOfACard),
  PlayingCard(
      cardSuit: CardSuit.hearts,
      cardType: CardType.jack,
      cardFront: Image.asset('images/cards/hearts_jack.png'),
      cardBack: backOfACard),
  PlayingCard(
      cardSuit: CardSuit.hearts,
      cardType: CardType.queen,
      cardFront: Image.asset('images/cards/hearts_queen.png'),
      cardBack: backOfACard),
  PlayingCard(
      cardSuit: CardSuit.hearts,
      cardType: CardType.king,
      cardFront: Image.asset('images/cards/hearts_king.png'),
      cardBack: backOfACard),
  PlayingCard(
      cardSuit: CardSuit.hearts,
      cardType: CardType.ace,
      cardFront: Image.asset('images/cards/hearts_ace.png'),
      cardBack: backOfACard),
]);

final spadesPoker = Hand(hand: [
  PlayingCard(
      cardSuit: CardSuit.spades,
      cardType: CardType.ten,
      cardFront: Image.asset('images/cards/spades_ten.png'),
      cardBack: backOfACard),
  PlayingCard(
      cardSuit: CardSuit.spades,
      cardType: CardType.jack,
      cardFront: Image.asset('images/cards/spades_jack.png'),
      cardBack: backOfACard),
  PlayingCard(
      cardSuit: CardSuit.spades,
      cardType: CardType.queen,
      cardFront: Image.asset('images/cards/spades_queen.png'),
      cardBack: backOfACard),
  PlayingCard(
      cardSuit: CardSuit.spades,
      cardType: CardType.king,
      cardFront: Image.asset('images/cards/spades_king.png'),
      cardBack: backOfACard),
  PlayingCard(
      cardSuit: CardSuit.spades,
      cardType: CardType.ace,
      cardFront: Image.asset('images/cards/spades_ace.png'),
      cardBack: backOfACard),
]);
final diamondsPoker = Hand(hand: [
  PlayingCard(
      cardSuit: CardSuit.diamonds,
      cardType: CardType.ten,
      cardFront: Image.asset('images/cards/diamonds_ten.png'),
      cardBack: backOfACard),
  PlayingCard(
      cardSuit: CardSuit.diamonds,
      cardType: CardType.jack,
      cardFront: Image.asset('images/cards/diamonds_jack.png'),
      cardBack: backOfACard),
  PlayingCard(
      cardSuit: CardSuit.diamonds,
      cardType: CardType.queen,
      cardFront: Image.asset('images/cards/diamonds_queen.png'),
      cardBack: backOfACard),
  PlayingCard(
      cardSuit: CardSuit.diamonds,
      cardType: CardType.king,
      cardFront: Image.asset('images/cards/diamonds_king.png'),
      cardBack: backOfACard),
  PlayingCard(
      cardSuit: CardSuit.diamonds,
      cardType: CardType.ace,
      cardFront: Image.asset('images/cards/diamonds_ace.png'),
      cardBack: backOfACard),
]);
final clubsPoker = Hand(hand: [
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
    cardBack: backOfACard,
  )
]);
