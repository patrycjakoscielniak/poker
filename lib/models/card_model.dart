enum CardSuit {
  spades,
  hearts,
  diamonds,
  clubs,
}

enum CardType {
  one,
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
  ace,
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
