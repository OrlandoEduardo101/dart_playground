import 'dart:io';

class ListOperations {
  final int listMaxSize;

  ListOperations(this.listMaxSize);

  void listMenu() {
    List<int> codigoProduto = [];
    int sizeList = 0;
    int? inputOption;

    do {
      clearConsole();

      print('\n------ Menu - List ------\n');
      print('\n0 - Reset List\n');
      print('\n1 - Insert code at List\n');
      print('\n2 - Show List\n');
      print('\n3 - Show List size\n');
      print('\n4 - Show List item\n');
      print('\n5 -Sair\n');

      print('\nInput a option\n');
      inputOption = int.tryParse(stdin.readLineSync() ?? '-1');
      // if (inputOption == null || inputOption < 0) {
      //   print('\ninsira uma opção válida\n');
      // }

      clearConsole();

      switch (inputOption) {
        case 0:
          codigoProduto.clear();
          break;
        case 1:
          codigoProduto = insertItemList(codigoProduto, codigoProduto.length);
          sizeList = codigoProduto.length;
          break;
        case 2:
          showListItems(codigoProduto);
          break;
        case 3:
          print(sizeList);
          break;
        case 4:
          showAListItem(codigoProduto);
          break;
        case 5:
          codigoProduto.clear();
          print('\nExit\n');
          break;
        default:
          print('\nInsert a valid option\n');
      }
    } while (inputOption != 5);
  }

  List<int> insertItemList(List<int> codeList, int size) {
    late int product;
    if (size == listMaxSize) {
      print('\nAttention, list fully\n');
      return codeList;
    }
    print('\nInsert a product code to insert\n');
    product = int.parse(stdin.readLineSync() ?? '-1');
    if (product < 0) {
      print('\nInvalid code\n');
      return codeList;
    }
    codeList.add(product);
    return codeList;
  }

  void showListItems(List<int> codeList) {
    if (codeList.isEmpty) {
      return print('\nAttention, list is empty\n');
    }
    print('\nCode list\n');
    for (var item in codeList) {
      print('\n$item\n');
    }
  }

  void showAListItem(List<int> codeList) {
    if (codeList.isEmpty) {
      return print('\nAttention, list is empty\n');
    }

    late int product;
    print('\nInsert a product code to print\n');
    product = int.parse(stdin.readLineSync() ?? '-1');
    if (product < 0) {
      return print('\nInvalid code\n');
    }
    return print('\n${codeList[product]}\n');
  }

  void clearConsole() {
    if (Platform.isWindows) {
      print(Process.runSync("cls", [], runInShell: true).stdout);
    } else {
      print(Process.runSync("clear", [], runInShell: true).stdout);
    }
  }
}
