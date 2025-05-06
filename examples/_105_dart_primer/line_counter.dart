// file: line_counter.dart
// This is an example .dart file, that can be run directly from the
// command line. It has no (Flutter) user interface.
import 'dart:io';

void main(List<String> args) async {
  if (args.isEmpty) {
    print('Usage: dart line_counter.dart <file_path>');
    exit(1);
  }

  final file = File(args[0]);
  if (!(await file.exists())) {
    print('File not found: ${args[0]}');
    exit(1);
  }

  final lines = await file.readAsLines();
  print('Line count: ${lines.length}');
}
