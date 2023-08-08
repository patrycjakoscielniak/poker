import 'package:flutter/material.dart';

import 'models/models.dart';

final backOfACard = Image.asset('images/cards/back.png');

final heartsPoker = Hand(hand: [
  PlayingCard(
      cardSuit: CardSuit.hearts,
      cardType: CardType.ten,
      cardFront: Image.asset('images/cards/hearts/10.png'),
      cardBack: backOfACard),
  PlayingCard(
      cardSuit: CardSuit.hearts,
      cardType: CardType.jack,
      cardFront: Image.asset('images/cards/hearts/jack.png'),
      cardBack: backOfACard),
  PlayingCard(
      cardSuit: CardSuit.hearts,
      cardType: CardType.queen,
      cardFront: Image.asset('images/cards/hearts/queen.png'),
      cardBack: backOfACard),
  PlayingCard(
      cardSuit: CardSuit.hearts,
      cardType: CardType.king,
      cardFront: Image.asset('images/cards/hearts/king.png'),
      cardBack: backOfACard),
  PlayingCard(
      cardSuit: CardSuit.hearts,
      cardType: CardType.ace,
      cardFront: Image.asset('images/cards/hearts/ace.png'),
      cardBack: backOfACard),
]);

final spadesPoker = Hand(hand: [
  PlayingCard(
      cardSuit: CardSuit.spades,
      cardType: CardType.ten,
      cardFront: Image.asset('images/cards/spades/10.png'),
      cardBack: backOfACard),
  PlayingCard(
      cardSuit: CardSuit.spades,
      cardType: CardType.jack,
      cardFront: Image.asset('images/cards/spades/jack.png'),
      cardBack: backOfACard),
  PlayingCard(
      cardSuit: CardSuit.spades,
      cardType: CardType.queen,
      cardFront: Image.asset('images/cards/spades/queen.png'),
      cardBack: backOfACard),
  PlayingCard(
      cardSuit: CardSuit.spades,
      cardType: CardType.king,
      cardFront: Image.asset('images/cards/spades/king.png'),
      cardBack: backOfACard),
  PlayingCard(
      cardSuit: CardSuit.spades,
      cardType: CardType.ace,
      cardFront: Image.asset('images/cards/spades/ace.png'),
      cardBack: backOfACard),
]);
final diamondsPoker = Hand(hand: [
  PlayingCard(
      cardSuit: CardSuit.diamonds,
      cardType: CardType.ten,
      cardFront: Image.asset('images/cards/diamonds/10.png'),
      cardBack: backOfACard),
  PlayingCard(
      cardSuit: CardSuit.diamonds,
      cardType: CardType.jack,
      cardFront: Image.asset('images/cards/diamonds/jack.png'),
      cardBack: backOfACard),
  PlayingCard(
      cardSuit: CardSuit.diamonds,
      cardType: CardType.queen,
      cardFront: Image.asset('images/cards/diamonds/queen.png'),
      cardBack: backOfACard),
  PlayingCard(
      cardSuit: CardSuit.diamonds,
      cardType: CardType.king,
      cardFront: Image.asset('images/cards/diamonds/king.png'),
      cardBack: backOfACard),
  PlayingCard(
      cardSuit: CardSuit.diamonds,
      cardType: CardType.ace,
      cardFront: Image.asset('images/cards/diamonds/ace.png'),
      cardBack: backOfACard),
]);
final clubsPoker = Hand(hand: [
  PlayingCard(
      cardSuit: CardSuit.clubs,
      cardType: CardType.ten,
      cardFront: Image.asset('images/cards/clubs/10.png'),
      cardBack: backOfACard),
  PlayingCard(
      cardSuit: CardSuit.clubs,
      cardType: CardType.jack,
      cardFront: Image.asset('images/cards/clubs/jack.png'),
      cardBack: backOfACard),
  PlayingCard(
      cardSuit: CardSuit.clubs,
      cardType: CardType.queen,
      cardFront: Image.asset('images/cards/clubs/queen.png'),
      cardBack: backOfACard),
  PlayingCard(
      cardSuit: CardSuit.clubs,
      cardType: CardType.king,
      cardFront: Image.asset('images/cards/clubs/king.png'),
      cardBack: backOfACard),
  PlayingCard(
    cardSuit: CardSuit.clubs,
    cardType: CardType.ace,
    cardFront: Image.asset('images/cards/clubs/ace.png'),
    cardBack: backOfACard,
  )
]);
