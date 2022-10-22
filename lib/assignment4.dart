import 'dart:io';

int calculate() {
  return 6 * 7;
}

extension SortedList<E extends Comparable<dynamic>> on List<int> {
  int avg() {
    int avg = 0, sum = 0;
    for (int i in this) {
      sum += i;
    }
    avg = sum ~/ length;
    return avg;
  }
}

int getListAvg(List<int> list){
  int avg = 0, sum = 0;
  int len = list.length;
  for (int i in list) {
    sum += i;
  }
  avg = sum ~/ len;
  return avg;
}

bool isContain(int value, List<int> list) {
  bool isFound = false;
  for (int i in list) {
    if (i == value) {
      isFound = true;
      break;
    }
  }
  return isFound;
}

int secSmallest(List<int> list) {
  List<int> sortedList = optimizedBubbleSort(list);
  return sortedList.elementAt(1);
}

List<int> optimizedBubbleSort(List<int> list) {
  bool checkSwap = true;
  int n = list.length;
  var iterations = 0, swaps = 0;
  int o, i;
  for (o = n - 1; o >= 1; o--) {
    checkSwap = false;
    for (i = 0; i < o; i++) {
      if (list[i] > list[i + 1]) {
        swap(list, i, i + 1);
        checkSwap = true;
        swaps++;
      }
      iterations++;
    }
    if (!checkSwap) {
      break;
    }
  }
  print('number of swaps is $swaps and compressions is $iterations;');
  return list;
}

void swap(List<int> list, int index1, int index2) {
  var temp = list[index1];
  list[index1] = list[index2];
  list[index2] = temp;
}

String countGeneral(List<int> arr) {
  String counter = '';
  var countedNumberList = <int>[];
  int count = 0;
  for (int i in arr) {
    for (int j = 0; j < arr.length; j++) {
      if (!countedNumberList.contains(i)) {
        if (i == arr[j]) {
          count++;
        }
      }
    }
    if (count != 0) {
      counter += '$i is counted $count times \n';
      count = 0;
    }
    countedNumberList.add(i);
  }
  return counter;
}

List<int> getArrayFromUser() {
  final list = <int>[];
  int? len;
  do {
    print('Enter the number of students:');
    len = int.tryParse(stdin.readLineSync() ?? '');
  } while (len == null);
  print('Enter the scores');
  for (var i = 0; i < len; i++) {
    int? input;
    do {
      input = int.tryParse(stdin.readLineSync() ?? '');
    } while (input == null);
    list.add(input);
  }
  return list;
}

void readScoresFromStudent() {
  List<int> scores = getArrayFromUser();
  var sortedScores = optimizedBubbleSort(scores);
  var best = sortedScores.last;
  int position = 0;
  for (int i in scores){
    print('Student ${++position} score is $i and grade is ${getScore(best, i)}');
  }
}

String getScore(var best, var value) {
  List<String> grades = ['A', 'B', 'C', 'D', 'F'];
  if (value <= (best - 10)) {
    return grades[0];
  } else if (value <= (best - 20)) {
    return grades[1];
  } else if (value <= (best - 30)) {
    return grades[2];
  } else if (value <= (best - 40)) {
    return grades[3];
  } else {
    return grades[4];
  }
}

List<int> getListReversed(List<int> list){
  var reversed = <int>[];
  for(int i = list.length -1 ; i>=0;i--){
    reversed.add(list[i]);
  }
  return reversed;
}

void readTenIntegers(){
  var list = getNumbersFromUser();
  var reversedList = getListReversed(list);
  print(reversedList);
}

List<int> getNumbersFromUser(){
  final list = <int>[];
  int? len;
  do {
    print('Enter how many numbers you want?');
    len = int.tryParse(stdin.readLineSync() ?? '');
  } while (len == null);
  print('Enter the numbers');
  for (var i = 0; i < len; i++) {
    int? input;
    do {
      input = int.tryParse(stdin.readLineSync() ?? '');
    } while (input == null);
    list.add(input);
  }
  return list;
}

void countOccurrences(){
  final list = <int>[];
  print('Enter the numbers between 1 and 100');
  bool inTheRange = true;
  while(inTheRange) {
    int? input;
    do {
      input = int.tryParse(stdin.readLineSync() ?? '');
    } while (input == null || input < 0 || input > 100);
    if(input != 0){
        list.add(input);
    }else {
      inTheRange = false;
    }
  }
  print(countGeneral(list));
}

void countAvgScores(){
  final list = <int>[];
  print('Enter the scores between 0 and 100'
      'note: Enter a negative number to signify the end of the input');
  bool inTheRange = true;
  while(inTheRange) {
    int? input;
    do {
      input = int.tryParse(stdin.readLineSync() ?? '');
    } while (input == null || input > 100);
    if(input >= 0){
      list.add(input);
    }else {
      inTheRange = false;
    }
  }
  int avg = getListAvg(list);
  int bigger = 0 , smaller =0 , equal =0 ;
  for (int i in list){
    if(i > avg) {
      bigger++;
    } else if (i < avg) {
      smaller++;
    } else {
      equal ++;
    }
  }
  print('how many scores are above or equal to the average and how many scores are below the average.');
  print('$bigger above the average, $equal equal to the average and $smaller below the average.');
}
void countDistinctNumbers(){
  var list = <int>[];
  var distinctList = <int>[];
  for(int i= 0 ; i < 10 ; i++ ){
    int? num ;
    do{
      print('number ${i+1} is:');
      num = int.tryParse(read());
    }while(num == null);
   list.add(num);
   if(distinctList.isEmpty || !distinctList.contains(num)){
     distinctList.add(num);
   }
  }
  print('the numbers entered : $list');
  print('The number of distinct number is ${distinctList.length}');
  print('The distinct numbers are: $distinctList');
}
String read() {
  return stdin.readLineSync() ?? '';
}
