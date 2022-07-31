import 'dart:io';

import 'package:eztime/eztime.dart';

const help = "eztime-cli - Easily calculate time sums and differences\n"
    "Usage: eztime <time> [+, -] <time>\n\n"
    "<time> can be in 2 formats: HH:MM or HH:MM:SS"
    " second(s)]\n"
    "A few examples are 12:00:00, 12:30, 16:40, 9:20:40 and 00:30:15";

Time? parse(String t) {
  List<String> parts = t.split(':');
  if (parts.length != 2 && parts.length != 3) return null;
  final h = int.tryParse(parts[0]);
  final m = int.tryParse(parts[1]);
  double s = 0.0;
  if (parts.length == 3) s = double.tryParse(parts[2]) ?? 0;
  if (h == null || m == null) return null;
  return Time(h, m, s);
}

void main(List<String> arguments) {
  // check if help
  if (arguments.length != 3) {
    print(help);
    return;
  }
  final a = parse(arguments.first);
  final b = parse(arguments.last);
  if (a == null || b == null) {
    stderr.writeln(help);
    return;
  }

  switch (arguments[1]) {
    case '+':
      print(a + b);
      return;
    case '-':
      print(a - b);
      return;
    default:
      stderr.writeln(help);
  }
}
