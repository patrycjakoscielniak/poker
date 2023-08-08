import '../../models/models.dart';

class DealCards {
  final Deck _deck;
  final Hand _hand1;
  final Hand _hand2;
  final Player _player1;
  final Player _player2;

  Deck get deck => _deck;
  Hand get hand1 => _hand1;
  Hand get hand2 => _hand2;
  Player get player1 => _player1;
  Player get player2 => _player2;

  DealCards(this._deck, this._hand1, this._hand2, this._player1, this._player2);
}
