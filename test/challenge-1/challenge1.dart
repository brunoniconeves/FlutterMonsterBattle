import 'dart:math';

class Challenge1 {
  Map<String, double> numbersFractionCalculator(List<int> numbers) {
    int postiveOcorr = 0;
    int negativeOcorr = 0;
    int zeroOccor = 0;

    for(var number in numbers){
      if(number == 0){
        zeroOccor++;
      } else if (number > 0){
        postiveOcorr++;
      } else {
        negativeOcorr++;
      }
    }


    return <String, double>{
      'positives': round(postiveOcorr/numbers.length, 6),
      'negative': round(negativeOcorr/numbers.length,6),
      'zeros': round(zeroOccor/numbers.length,6),
    };
  }

  double round(double number, decimals) {
    var valueToRound = pow(10, decimals);
    return (number * valueToRound).round() / valueToRound;
  }
}
