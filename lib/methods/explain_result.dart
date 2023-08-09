import '../models/models.dart';

String explainResult(
    String hand1Name, String hand2Name, Player winner, Player secondPlace) {
  String explanation = '';
  if (hand1Name != hand2Name) {
    explanation = '$hand1Name Has Higher Rank Than $hand2Name';
  } else {
    explanation =
        '${winner.name} Cards Have Higher Index Than ${secondPlace.name} Cards';
  }

  return explanation;
}
