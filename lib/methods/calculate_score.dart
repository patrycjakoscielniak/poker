import '../models/models.dart';

int calculateScore(List<PlayingCard> hand) {
  int score = 0;
  int highCard = 0;
  int highPair = 0;
  List<CardType> cardTypes = [];
  List<CardSuit> cardSuits = [];
  for (var card in hand) {
    cardTypes.add(card.cardType);
    cardSuits.add(card.cardSuit);
  }
  if (cardTypes.toSet().length == 5) {
    //POKER
    if (cardTypes.contains(CardType.ten) &&
        cardTypes.contains(CardType.jack) &&
        cardTypes.contains(CardType.queen) &&
        cardTypes.contains(CardType.king) &&
        cardTypes.contains(CardType.ace) &&
        cardSuits.toSet().length == 1) {
      score = 1500;
      //HIGH CARD
    } else {
      highCard = hand[4].cardType.index + 2;
      score = highCard * 10;
    }
  }

  if (cardTypes.toSet().length == 2) {
    //FULL HOUSE
    if (cardTypes[0] == cardTypes[1] &&
        cardTypes[1] == cardTypes[2] &&
        cardTypes[3] == cardTypes[4]) {
      highPair = hand[3].cardType.index + 2;
      int threeOfAKind = hand[2].cardType.index + 2;
      score = 1000 + threeOfAKind * 10 + highPair;
    }
    if (hand[0].cardType == hand[1].cardType &&
        hand[2].cardType == hand[3].cardType &&
        hand[3].cardType == hand[4].cardType) {
      highPair = hand[0].cardType.index + 2;
      int threeOfAKind = hand[2].cardType.index + 2;
      score = 1000 + threeOfAKind * 10 + highPair;
    }
    //FOUR OF A KIND
    if (hand[0].cardType == hand[1].cardType &&
        hand[1].cardType == hand[2].cardType &&
        hand[2].cardType == hand[3].cardType) {
      highCard = hand[4].cardType.index + 2;
      int fourOfAKind = hand[3].cardType.index + 2;
      score = 800 + fourOfAKind * 10 + highCard;
    }
    if (hand[1].cardType == hand[2].cardType &&
        hand[2].cardType == hand[3].cardType &&
        hand[3].cardType == hand[4].cardType) {
      highCard = hand[0].cardType.index + 2;
      int fourOfAKind = hand[3].cardType.index + 2;
      score = 800 + fourOfAKind * 10 + highCard;
    }
  }

  if (cardTypes.toSet().length == 3) {
    //THREE OF A KIND
    if (hand[0].cardType == hand[1].cardType &&
            hand[1].cardType == hand[2].cardType ||
        hand[1].cardType == hand[2].cardType &&
            hand[2].cardType == hand[3].cardType ||
        hand[2].cardType == hand[3].cardType &&
            hand[3].cardType == hand[4].cardType) {
      if (hand[2].cardType == hand[3].cardType &&
          hand[3].cardType == hand[4].cardType) {
        highCard = hand[1].cardType.index + 2;
      } else {
        highCard = hand[4].cardType.index + 2;
      }
      int threeOfAKind = hand[2].cardType.index + 2;
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
        highCard = hand[4].cardType.index + 2;
      }
      if (hand[0].cardType == hand[1].cardType &&
          hand[3].cardType == hand[4].cardType) {
        highCard = hand[2].cardType.index + 2;
      }
      if (hand[1].cardType == hand[2].cardType &&
          hand[3].cardType == hand[4].cardType) {
        highCard = hand[0].cardType.index + 2;
      }
      highPair = hand[3].cardType.index + 2;
      score = 400 + highPair * 10 + highCard;
    }
  }

  //PAIR
  if (cardTypes.toSet().length == 4) {
    if (hand[0].cardType == hand[1].cardType ||
        hand[1].cardType == hand[2].cardType ||
        hand[2].cardType == hand[3].cardType ||
        hand[3].cardType == hand[4].cardType) {
      if (hand[0].cardType == hand[1].cardType ||
          hand[1].cardType == hand[2].cardType) {
        highPair = hand[1].cardType.index + 2;
      } else {
        highPair = hand[3].cardType.index + 2;
      }
      if (hand[3].cardType == hand[4].cardType) {
        highCard = hand[2].cardType.index + 2;
      } else {
        highCard = hand[4].cardType.index + 2;
      }
      score = 200 + highPair * 10 + highCard;
    }
  }

  return score;
}
