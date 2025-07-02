// viewer.dart
import 'dart:io';
import 'globals.dart';

Future<void> viewSalahHistory() async {
  File file = File('namaz_log.txt');

  if (!await file.exists()) {
    print('⚠️ No Salah logs found.');
    return;
  }

  List<String> lines = await file.readAsLines();
  List<String> userLogs = lines.where((line) => line.contains('User: $userName')).toList();

  if (userLogs.isEmpty) {
    print('📭 No logs found for user: $userName');
  } else {
    print('\n📖 Salah History for $userName:');
    print('------------------------------------');
    for (var log in userLogs) {
      print(log);
    }

    int offeredCount = userLogs.where((line) => line.contains('Status: offered')).length;
    int missedCount = userLogs.where((line) => line.contains('Status: missed')).length;
    int lateCount   = userLogs.where((line) => line.contains('Status: late')).length;

    print('\n📊 Salah Count Summary:');
    print('✅ Offered: $offeredCount');
    print('❌ Missed:  $missedCount');
    print('⌛ Late:    $lateCount');
    print('📌 Total:   ${userLogs.length}');
  }
}

Future<void> filterLogsByDate() async {
  File file = File('namaz_log.txt');

  if (!await file.exists()) {
    print('⚠️ No Salah logs found.');
    return;
  }

  stdout.write('Enter date to filter (DD/MM/YYYY): ');
  String? inputDate = stdin.readLineSync()?.trim();

  if (inputDate == null || inputDate.isEmpty) {
    print('❌ Invalid input. Aborting filter.');
    return;
  }

  List<String> lines = await file.readAsLines();
  List<String> filteredLogs = lines.where((line) =>
      line.contains('User: $userName') && line.contains('[$inputDate')).toList();

  if (filteredLogs.isEmpty) {
    print('\n📭 No Salah records found for $userName on $inputDate.');
  } else {
    print('\n📅 Salah Logs for $userName on $inputDate:');
    print('----------------------------------------------');
    for (var log in filteredLogs) {
      print(log);
    }
    print('📌 Total logs on $inputDate: ${filteredLogs.length}');
  }
}
