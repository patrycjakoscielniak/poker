import 'package:poker/state/actions/close_player_mode.dart';
import 'package:poker/state/actions/deal_cards.dart';
import 'package:poker/state/actions/exchange_cards.dart';
import 'package:poker/state/actions/open_player_mode.dart';
import 'package:poker/state/actions/play_again.dart';
import 'package:poker/state/actions/show_results.dart';
import '../models/models.dart';

class AppState {
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

  AppState(this._deck, this._hand1, this._hand2, this._player1, this._player2);

  AppState.initialState()
      : _deck = Deck(allCards: []),
        _hand1 = Hand(hand: []),
        _hand2 = Hand(hand: []),
        _player1 = Player(
          name: 'Player 1',
          hand: Hand(hand: []),
          score: 0,
          showCards: false,
        ),
        _player2 = Player(
          name: 'Player 2',
          hand: Hand(hand: []),
          score: 0,
          showCards: false,
        );
}

enum Action {
  dealCards,
  openPlayer1Mode,
  openPlayer2Mode,
  closePlayer1Mode,
  closePlayer2Mode,
  exchangeCards,
  showResults,
  playAgain,
}

AppState reducer(AppState state, action) {
  if (action is DealCards || action is ExchangeCards) {
    return AppState(action.deck, action.hand1, action.hand2, action.player1,
        action.player2);
  }
  if (action is OpenPlayer1Mode || action is ClosePlayer1Mode) {
    return AppState(
        state.deck, state.hand1, state.hand2, action.player1, state.player2);
  }
  if (action is OpenPlayer2Mode || action is ClosePlayer2Mode) {
    return AppState(
        state.deck, state.hand1, state.hand2, state.player1, action.player2);
  }
  if (action is ShowResults) {
    return AppState(
        state.deck, state.hand1, state.hand2, action.player1, action.player2);
  }
  if (action is PlayAgain) {
    return AppState.initialState();
  } else {
    return state;
  }
}
