String getHandName(int score) {
  String handName = '';
  if (score == 1500) {
    handName = 'Poker';
  }
  if (score > 1000 && score < 1500) {
    handName = 'Full House';
  }
  if (score > 800 && score < 1000) {
    handName = 'Four of a Kind';
  }
  if (score > 600 && score < 800) {
    handName = 'Three of a Kind';
  }
  if (score > 400 && score < 600) {
    handName = 'Two Pairs';
  }
  if (score > 200 && score < 400) {
    handName = 'Pair';
  }
  if (score < 200) {
    handName = 'High Card';
  }
  return handName;
}
