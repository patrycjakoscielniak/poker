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

class Deck {
  List<Card> allCards;
  Deck({required this.allCards});
  List<Card> get getCards {
    for (var suit in CardSuit.values) {
      for (var type in CardType.values) {
        allCards.add(Card(cardSuit: suit, cardType: type));
      }
    }
    return allCards;
  }
}

class Hand {
  Card card1;
  Card card2;
  Card card3;
  Card card4;
  Card card5;

  Hand({
    required this.card1,
    required this.card2,
    required this.card3,
    required this.card4,
    required this.card5,
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

class DeckAfterDeal {
  List<Card> cardsAfterDeal;
  DeckAfterDeal({required this.cardsAfterDeal});
}
