import 'card_model.dart';

class Deck {
  List<Card> allCards = [];
  List<Card> get getCards {
    for (var suit in CardSuit.values) {
      for (var type in CardType.values) {
        allCards.add(Card(cardSuit: suit, cardType: type, faceUp: false));
      }
    }
    return allCards;
  }
}
