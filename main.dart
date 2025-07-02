// main.dart
// A simple Dart program to track Salah (Namaz) logs with user interaction
import 'logger.dart';
import 'viewer.dart';
import 'clear_logs.dart';
import 'greetings.dart';
import 'users.dart';
import 'dart:io';

void main() async {
  await handleUserLogin();
  greetUser();

  while (true) {
    print('\n\n\n1. Log a Salah (Namaz)');
    print('2. View Salah (Namaz) History');
    print('3. Clear all logs');
    print('4. Filter logs by date');
    print('5. Exit\n');
    print('Choose an option:');

    String? choice = stdin.readLineSync()?.trim();

    switch (choice) {
      case '1':
        print('Logging Salah (Namaz)...');
        await recordSalah();
        break;
      case '2':
        print('Viewing Salah (Namaz) history...');
        await viewSalahHistory();
        break;
      case '3':
        print('Clearing all Salah (Namaz) logs...');
        await clearLogs();
        break;
      case '4':
        print('Filtering Salah (Namaz) logs by date...');
        await filterLogsByDate();
        break;
      case '5':
        print('Exiting the Salah Tracker. Goodbye!');
        return;
      default:
        print('Invalid choice, please try again.');
    }
  }
}
