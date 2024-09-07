import 'dart:convert';
import 'dart:developer';

class Log {
  static show(data) {
    log(
      data.toString(),
      // stackTrace: StackTrace.current,
    );
  }

  static json(data) {
    final prettyString = const JsonEncoder.withIndent('  ').convert(data);
    log(prettyString);
  }
}
