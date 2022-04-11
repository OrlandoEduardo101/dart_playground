import 'dart:io';

class SortMethods {

  List bubbleSort(List listNoSort) {
    final list = [...listNoSort];

    for (var currentIndex = 0; currentIndex < (list.length - 1); currentIndex++) {

      for (var mirrorIndex = 0; mirrorIndex < (list.length - currentIndex - 1); mirrorIndex++) {

        if (list[mirrorIndex] > list[mirrorIndex + 1]) {
          final aux = list[mirrorIndex];
          list[mirrorIndex] = list[mirrorIndex + 1];
          list[mirrorIndex + 1] = aux;
        }

        // drawProgressBar(currentIndex / list.length, 1);
      }
    }
    return list;
  }
  
  List selectionSort(List listNoSort) {
    final list = [...listNoSort];
    for (var item in list) {
      final currentIndex = list.indexOf(item);
      int minorIndex = currentIndex;

      for (var nextIndex = currentIndex + 1;
          nextIndex < list.length;
          nextIndex++) {
        if (list[nextIndex] < list[minorIndex]) {
          minorIndex = nextIndex;
        }
        // drawProgressBar(currentIndex / list.length, 1);
      }
      final aux = item;
      list[currentIndex] = list[minorIndex];
      list[minorIndex] = aux;
    }
    return list;
  }

  List insertionSort(List listNoSort) {
    final list = [...listNoSort];
    for (var currentIndex = 1; currentIndex < list.length; currentIndex++) {
      int selectedItem = list[currentIndex];
      var previousIndex = currentIndex - 1;

      // for (var previousIndex = currentIndex - 1;
      //     previousIndex < list.length;
      //     previousIndex--) {
      //   if (previousIndex >= 0 && list[previousIndex] > selectedItem) {
      //     list[previousIndex + 1] = list[previousIndex];
      //   }

      while (previousIndex >= 0 && list[previousIndex] > selectedItem) {
        list[previousIndex + 1] = list[previousIndex];
        previousIndex--;
        // drawProgressBar(currentIndex / list.length, 1);
      }

      list[previousIndex + 1] = selectedItem;
    }
    return list;
  }
}

void drawProgressBar(double amount, int size) {
  final limit = (size * amount).toInt();
  stdout.write(
    '\r\x1b[38;5;75;51m' +
        String.fromCharCodes(List.generate(size, (int index) {
          if (index < limit) {
            return 0x2593;
          }
          return 0x2591;
        })) +
        '\x1b[0m',
  );
}
