import 'dart:io';

void main() {
  print("enter first number");
  int number1 = int.parse(stdin.readLineSync()!);
  print("choose +,-,*,/");
  String? operator = stdin.readLineSync();
  print("enter second number");
  int number2 = int.parse(stdin.readLineSync()!);

  switch(operator){
    case '+':
      print("result: ${number1 + number2}");
      break;
    case '-':
      print("result: ${number1 - number2}");
      break;
    case '*':
      print("result: ${number1 * number2}");
      break;
    case '/':
      print("result: ${number1 / number2}");
      break;
    default:
      print("Error: Invalid operator");


  }
}
