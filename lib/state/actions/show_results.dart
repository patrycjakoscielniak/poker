import '../../models/models.dart';

class ShowResults {
  final Player _player1;
  final Player _player2;

  Player get player1 => _player1;
  Player get player2 => _player2;

  ShowResults(this._player1, this._player2);
}
