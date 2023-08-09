// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:poker/constants.dart';
import 'package:poker/pages/results_page.dart';
import 'package:poker/pages/start_page.dart';
import 'package:poker/state/actions/play_again.dart';
import 'package:poker/state/actions/show_results.dart';
import 'package:poker/state/store.dart';
import 'package:redux/redux.dart';

import '../methods.dart';
import '../models/models.dart';
import 'player_mode.dart';

class GameTableAfterDeal extends StatelessWidget {
  Store<AppState> store;
  GameTableAfterDeal({
    super.key,
    required this.store,
  });

  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tableColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'images/cards/back.png',
                    width: 100,
                  )
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    Player player1 = Player(
                      name: 'Player 1',
                      hand: store.state.hand1,
                      score: calculateScore(store.state.hand1.hand),
                    );
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PlayerMode(
                              store: store,
                              player: player1,
                            )));
                  },
                  child: const Text('Player 1')),
            ]),
            const SizedBox(height: 100),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              IconButton(
                  onPressed: () {
                    Player player1 = Player(
                      name: 'Player 1',
                      hand: store.state.hand1,
                      score: calculateScore(store.state.hand1.hand),
                    );
                    Player player2 = Player(
                      name: 'Player 2',
                      hand: store.state.hand2,
                      score: calculateScore(store.state.hand2.hand),
                    );
                    StoreProvider.of<AppState>(context)
                        .dispatch(ShowResults(player1, player2));
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ResultsPage(
                              store: store,
                            )));
                  },
                  icon: const Icon(Icons.military_tech, color: Colors.white)),
              const SizedBox(width: 10),
              Image.asset(
                'images/cards/deck.png',
                width: 170,
              ),
              const SizedBox(width: 40),
              IconButton(
                  onPressed: () {
                    StoreProvider.of<AppState>(context).dispatch(PlayAgain());
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => StartPage(store: store)));
                  },
                  icon: const Icon(
                    Icons.replay,
                    color: Colors.white,
                  )),
            ]),
            const SizedBox(height: 100),
            Stack(children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'images/cards/back.png',
                    width: 100,
                  )
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    Player player2 = Player(
                      name: 'Player 2',
                      hand: store.state.hand2,
                      score: calculateScore(store.state.hand2.hand),
                    );
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PlayerMode(
                              store: store,
                              player: player2,
                            )));
                  },
                  child: const Text('Player 2')),
            ]),
          ],
        ),
      ),
    );
  }
}
