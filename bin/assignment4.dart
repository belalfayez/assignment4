import 'package:assignment4/assignment4.dart' as assignment4;
import 'package:assignment4/assignment4.dart';

void main(List<String> arguments) {
/*  var list = [0,1,2,3,4,5,6,7,8,9,10];
  int avg = list.avg();
  print(avg);*/
  var list = getNumbersFromUser();
  int? value;
  do {
    print('Enter the number');
    value = int.tryParse(read());
  } while (value == null);
  print('Is the array contain this number ? ');
  isContain(value, list) ? print('Yes') : print('No');
  //******************************************************
  list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int avg = list.avg();
  print(avg);
  //*******************************************************
  list = getNumbersFromUser();
  print(secSmallest(list));
  //*******************************************************
  readScoresFromStudent();
  //*******************************************************
  readTenIntegers();
  //*******************************************************
  countOccurrences();
  //*******************************************************
  countAvgScores();
  //*******************************************************
  countDistinctNumbers();
}


