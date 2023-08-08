import 'dart:math';

import 'models/models.dart';

int calculateScore(List<Card> hand) {
  int score = 0;
  int highCard = 0;
  int highPair = 0;
  //POKER
  if (hand[0].cardType == CardType.ten &&
      hand[1].cardType == CardType.jack &&
      hand[2].cardType == CardType.queen &&
      hand[3].cardType == CardType.king &&
      hand[4].cardType == CardType.ace &&
      hand[0].cardSuit == hand[1].cardSuit &&
      hand[0].cardSuit == hand[2].cardSuit &&
      hand[0].cardSuit == hand[3].cardSuit &&
      hand[0].cardSuit == hand[4].cardSuit) {
    score = 1500;
  }
  //FULL HOUSE
  if (hand[0].cardType == hand[1].cardType &&
          hand[1].cardType == hand[2].cardType &&
          hand[3].cardType == hand[4].cardType ||
      hand[0].cardType == hand[1].cardType &&
          hand[2].cardType == hand[3].cardType &&
          hand[3].cardType == hand[4].cardType) {
    if (hand[0].cardType == hand[1].cardType &&
        hand[1].cardType == hand[2].cardType &&
        hand[3].cardType == hand[4].cardType) {
      highPair = hand[3].cardType.index;
    }
    if (hand[0].cardType == hand[1].cardType &&
        hand[2].cardType == hand[3].cardType &&
        hand[3].cardType == hand[4].cardType) {
      highPair = hand[0].cardType.index;
    }
    int threeOfAKind = hand[2].cardType.index;
    score = 1000 + threeOfAKind * 10 + highPair;
  }

  //FOUR OF A KIND
  if (hand[0].cardType == hand[1].cardType &&
          hand[1].cardType == hand[2].cardType &&
          hand[2].cardType == hand[3].cardType ||
      hand[1].cardType == hand[2].cardType &&
          hand[2].cardType == hand[3].cardType &&
          hand[3].cardType == hand[4].cardType) {
    if (hand[0].cardType == hand[1].cardType &&
        hand[1].cardType == hand[2].cardType &&
        hand[2].cardType == hand[3].cardType) {
      highCard = hand[4].cardType.index;
    }
    if (hand[1].cardType == hand[2].cardType &&
        hand[2].cardType == hand[3].cardType &&
        hand[3].cardType == hand[4].cardType) {
      highCard = hand[0].cardType.index;
    }
    int fourOfAKind = hand[3].cardType.index;
    score = 800 + fourOfAKind * 10 + highCard;
  }
  //THREE OF A KIND
  if (hand[0].cardType == hand[1].cardType &&
          hand[1].cardType == hand[2].cardType ||
      hand[1].cardType == hand[2].cardType &&
          hand[2].cardType == hand[3].cardType ||
      hand[2].cardType == hand[3].cardType &&
          hand[3].cardType == hand[4].cardType) {
    if (hand[2].cardType == hand[3].cardType &&
        hand[3].cardType == hand[4].cardType) {
      highCard = hand[1].cardType.index;
    } else {
      highCard = hand[4].cardType.index;
    }
    int threeOfAKind = hand[2].cardType.index;
    score = 600 + threeOfAKind * 10 + highCard;
  }
  //TWO PAIRS
  if (hand[0].cardType == hand[1].cardType &&
          hand[2].cardType == hand[3].cardType ||
      hand[0].cardType == hand[1].cardType &&
          hand[3].cardType == hand[4].cardType ||
      hand[1].cardType == hand[2].cardType &&
          hand[3].cardType == hand[4].cardType) {
    if (hand[0].cardType == hand[1].cardType &&
        hand[2].cardType == hand[3].cardType) {
      highCard = hand[4].cardType.index;
    }
    if (hand[0].cardType == hand[1].cardType &&
        hand[3].cardType == hand[4].cardType) {
      highCard = hand[2].cardType.index;
    }
    if (hand[1].cardType == hand[2].cardType &&
        hand[3].cardType == hand[4].cardType) {
      highCard = hand[0].cardType.index;
    }
    highPair = max(hand[1].cardType.index, hand[3].cardType.index);
    score = 400 + highPair * 10 + highCard;
  }
  //PAIR
  if (hand.toSet().length == 4) {
    if (hand[0].cardType == hand[1].cardType ||
        hand[1].cardType == hand[2].cardType) {
      highPair = hand[1].cardType.index;
    } else {
      highPair = hand[3].cardType.index;
    }
    if (hand[3].cardType == hand[4].cardType) {
      highCard = hand[2].cardType.index;
    } else {
      highCard = hand[4].cardType.index;
    }
    score = 200 + highPair * 10 + highCard;
    //HIGH CARD
  } else {
    highCard = hand[4].cardType.index;
    score = highCard * 10;
  }

  return score;
}
