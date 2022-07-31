import 'package:eztime/eztime.dart';

const help =
    "eztime-cli\nEasily calculate time sums and differences\n  Usage: eztime <HH:MM:SS> [+, -] <HH:MM:SS>";

void main(List<String> arguments) {
  if (arguments.length != 3) {
    print(help);
    return;
  }

  final a = Time.fromString(arguments.first);
  final b = Time.fromString(arguments.last);
  if (a == null || b == null) {
    print(help);
    return;
  }

  switch (arguments[1]) {
    case '+':
      print(a + b);
      break;
    case '-':
      print(a - b);
      break;
  }
}
