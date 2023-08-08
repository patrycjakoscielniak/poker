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

class Card {
  CardSuit cardSuit;
  CardType cardType;
  bool faceUp;

  Card({
    required this.cardSuit,
    required this.cardType,
    this.faceUp = false,
  });
}

class Deck {
  List<Card> allCards;
  Deck({required this.allCards});
}

class Hand {
  List<Card> hand;

  Hand({
    required this.hand,
  });
}

class Player {
  String name;
  Hand hand;
  int score;
  bool showCards;
  Player(
      {required this.name,
      required this.hand,
      required this.score,
      required this.showCards});
}
