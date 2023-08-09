import 'package:flutter_test/flutter_test.dart';
import 'package:poker/methods/get_hand_name.dart';

void main() {
  group('getHandName', () {
    test('Poker', () {
      var score = 1500;
      final result = getHandName(score);
      expect(result, 'Poker');
    });
    test('Full House', () {
      var score = 1093;
      final result = getHandName(score);
      expect(result, 'Full House');
    });
    test('Four of a Kind', () {
      var score = 831;
      final result = getHandName(score);
      expect(result, 'Four of a Kind');
    });
    test('Three of a Kind', () {
      var score = 690;
      final result = getHandName(score);
      expect(result, 'Three of a Kind');
    });
    test('Two Pairs', () {
      var score = 550;
      final result = getHandName(score);
      expect(result, 'Two Pairs');
    });
    test('Pair', () {
      var score = 341;
      final result = getHandName(score);
      expect(result, 'Pair');
    });
    test('High Card', () {
      var score = 140;
      final result = getHandName(score);
      expect(result, 'High Card');
    });
  });
}
