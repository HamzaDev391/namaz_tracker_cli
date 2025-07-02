// clear_logs.dart
import 'dart:io';
import 'globals.dart';

Future<void> clearLogs() async {
  File file = File('namaz_log.txt');

  if (!await file.exists()) {
    print('⚠️ No logs found to clear.');
    return;
  }

  stdout.write('Are you sure you want to delete all your logs? (yes/no): ');
  String? confirm = stdin.readLineSync()?.trim().toLowerCase() ?? "no";

  if (confirm.startsWith('n')) {
    print(' Operation cancelled. No logs deleted.');
    return;
  }

  List<String> lines = await file.readAsLines();
  List<String> remainingLogs = lines.where((line) => !line.contains('User: $userName')).toList();

  try {
    await file.writeAsString(remainingLogs.join('\n') + (remainingLogs.isNotEmpty ? '\n' : ''));
    print(' All your Salah logs have been deleted successfully.');
  } catch (e) {
    print(' Failed to clear logs. Error: $e');
  }
}
