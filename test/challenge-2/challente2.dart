import 'dart:math';

class Challenge2 {
  int diceFacesCalculator(int number1, int number2, int number3) {

    List<int> diceValues = [number1, number2, number3];

    for(var value in diceValues){
      if(value <= 0 || value > 6){
        throw Exception("Not valid dice value");
      }

      int numberOcorr = diceValues.where((dice) => dice == value).length;

      if(numberOcorr == 3){
        //multiply by 3
        return value * 3;
      } else if (numberOcorr == 2){
        //multiply by 2
        return value * 2;
      } else{
        return diceValues.reduce(max);
      }

    }

    return 0;
  }
}
