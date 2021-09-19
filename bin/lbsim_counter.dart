import 'dart:io';

class LBSIMCounter {
  int count;
  String userName;

  LBSIMCounter({required this.count, required this.userName});
}

void changeUserName({required LBSIMCounter object}) {
  print('New username: ');
  var inputVar = stdin.readLineSync();

  if (inputVar != null && inputVar.isNotEmpty) {
    print('New user is :$inputVar');
    object.userName = inputVar;
  }
}

void incrementCounter({required LBSIMCounter object, required int value}) {
  object.count = object.count + value;
}

void decrementCounter({required LBSIMCounter object, required int value}) {
  object.count = object.count - value;
}

void divide({required LBSIMCounter object, required int value}) {
  object.count = object.count ~/ value;
}

void mod({required LBSIMCounter object, required int value}) {
  object.count = object.count % value;
}

void multiply({required LBSIMCounter object, required int value}) {
  object.count = object.count * value;
}

void main(List<String> arguments) {
  int operationValue;
  bool stop = false;
  String? inputVar;
  LBSIMCounter lbsimCounter;

  print('Please enter username');
  inputVar = stdin.readLineSync();

  if (inputVar != null && inputVar.isNotEmpty) lbsimCounter = LBSIMCounter(userName: inputVar, count: 100);
  else return;

  while (!stop) {
    print('\n-> Current value of count is ${lbsimCounter.count} by ${lbsimCounter.userName}\n');

    print('''
Enter your choice
0. Print count
1. Increment
2. Decrement
3. Multiply 
4. Divide
5. Reminder
6. Change username
7. Exit
    ''');

    print('Choice: ');
    inputVar = stdin.readLineSync();

    if (inputVar != null && inputVar.isNotEmpty) operationValue = int.parse(inputVar);
    else operationValue = 7;

    switch (operationValue) {
      case 0:
        print("Count: " + (lbsimCounter.count).toString());
        break;
      case 1:
        print("Increment counter by: ");
        inputVar = stdin.readLineSync();
        incrementCounter(object: lbsimCounter, value: int.parse(inputVar!));
        break;
      case 2:
        print("Decrement counter by: ");
        inputVar = stdin.readLineSync();
        decrementCounter(object: lbsimCounter, value: int.parse(inputVar!));
        break;
      case 3:
        print("Multiply counter by: ");
        inputVar = stdin.readLineSync();
        multiply(object: lbsimCounter, value: int.parse(inputVar!));
        break;
      case 4:
        print("Divide counter by: ");
        inputVar = stdin.readLineSync();
        divide(object: lbsimCounter, value: int.parse(inputVar!));
        break;
      case 5:
        print("Modulo counter by: ");
        inputVar = stdin.readLineSync();
        mod(object: lbsimCounter, value: int.parse(inputVar!));
        break;
      case 6:
        changeUserName(object: lbsimCounter);
        break;
      case 7:
        print('Exit');
        stop = true;
        break;
      default:
        print('Wrong input!!');
    }
  }
  print('\nFinal value of count is ${lbsimCounter.count} by ${lbsimCounter.userName}\n');
}