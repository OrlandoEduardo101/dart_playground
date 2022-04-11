
import 'dart:math';

import 'package:dart_playground/sort_methods.dart';

void sortPlayground() {
  final sortMethods = SortMethods();
  final listNoSort =
      List<int>.generate(100000, (index) => Random().nextInt(1000));

  print('');
  print('-------- Bubble Sort ---------');

  print('No sorted:');
  printList(listNoSort);
  var initTimestamp = DateTime.now().millisecondsSinceEpoch;

  print('Sorted:');
  var listSorted = sortMethods.bubbleSort(listNoSort);
  printList(listSorted);
  printBenchmark(initTimestamp);

  print('');
  print('-------- Selection Sort ---------');

  print('No sorted:');
  printList(listNoSort);
  initTimestamp = DateTime.now().millisecondsSinceEpoch;

  print('Sorted:');
  listSorted = sortMethods.selectionSort(listNoSort);
  printList(listSorted);
  printBenchmark(initTimestamp);

  print('');
  print('-------- Insertion Sort ---------');

  print('No sorted:');
  printList(listNoSort);
  initTimestamp = DateTime.now().millisecondsSinceEpoch;

  print('Sorted:');
  listSorted = sortMethods.insertionSort(listNoSort);
  printList(listSorted);
  printBenchmark(initTimestamp);
  
}

void printBenchmark(int initTimestamp) {
  print('Benchmark: ${DateTime.now().millisecondsSinceEpoch - initTimestamp} ms');
}

void printList(List list) {
  print(list.getRange(0, 15).toString() +
      '... ' +
      list.last.toString());
}
