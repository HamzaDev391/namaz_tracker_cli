// users.dart
import 'dart:io';
import 'globals.dart';

Future<void> handleUserLogin() async {
  File userFile = File('users.txt');
  if (!await userFile.exists()) {
    await userFile.create();
  }

  while (true) {
    stdout.write('Enter your name: ');
    String? input = stdin.readLineSync()?.trim();

    if (input != null && input.isNotEmpty) {
      userName = input;

      List<String> users = await userFile.readAsLines();
      if (users.contains(userName)) {
        print('🔓 Welcome back, $userName!');
      } else {
        await userFile.writeAsString('$userName\n', mode: FileMode.append);
        print('🆕 New user "$userName" registered.');
      }

      break;
    } else {
      print('❌ Name cannot be empty. Please enter again.');
    }
  }
}
