import 'package:flutter/material.dart';
import 'package:poker/variables/constants.dart';

enum CardSuit {
  spades,
  hearts,
  diamonds,
  clubs,
}

enum CardType {
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  ten,
  jack,
  queen,
  king,
  ace
}

class PlayingCard {
  CardSuit cardSuit;
  CardType cardType;
  Image cardFront;
  Image cardBack = backOfACard;
  bool faceUp;

  PlayingCard({
    required this.cardSuit,
    required this.cardType,
    this.faceUp = false,
    required this.cardFront,
    required this.cardBack,
  });
}

class Deck {
  List<PlayingCard> allCards;
  Deck({required this.allCards});
}

class Hand {
  List<PlayingCard> hand;

  Hand({
    required this.hand,
  });
}

class Player {
  String name;
  Hand hand;
  int score;

  Player({
    required this.name,
    required this.hand,
    required this.score,
  });
}
