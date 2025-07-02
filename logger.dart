// logger.dart
import 'dart:io';
import 'globals.dart';

Future<void> recordSalah() async {
  String salah = '';
  while (true) {
    print('\nWhich Salah did you offer?');
    print('1. Fajr');
    print('2. Dhuhr');
    print('3. Asr');
    print('4. Maghrib');
    print('5. Isha');
    stdout.write('Enter option (1-5): ');
    String? choice = stdin.readLineSync()?.trim();
    switch (choice) {
      case '1': salah = 'Fajr'; break;
      case '2': salah = 'Dhuhr'; break;
      case '3': salah = 'Asr'; break;
      case '4': salah = 'Maghrib'; break;
      case '5': salah = 'Isha'; break;
      default:
        print(' Invalid option. Please try again.');
        continue;
    }
    break;
  }

  String status = '';
  while (true) {
    stdout.write('Enter status (offered / missed / late): ');
    String? input = stdin.readLineSync()?.trim().toLowerCase() ?? "";
    if (input == "offered" || input == "missed" || input == "late") {
      status = input;
      break;
    }
    print(' Invalid status. Try again.');
  }

  DateTime now = DateTime.now();
  String timestamp =
      '[${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year} '
      '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}]';

  String log = '$timestamp   User: $userName - Salah: $salah - Status: $status\n';

  try {
    File file = File('namaz_log.txt');
    await file.writeAsString(log, mode: FileMode.append);
    print(' Salah logged successfully!');
  } catch (e) {
    print(' Failed to log Salah. Error: $e');
  }
}
