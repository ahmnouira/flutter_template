import 'package:flutter_template/src/utils/logger.dart';

class Convert {
  Convert();

  static List<T> toList<T>(
    dynamic map,
    T Function(Map<String, dynamic> map) parser,
  ) {
    final list = <T>[];
    if (map != null) {
      for (final element in map) {
        try {
          list.add(parser(element));
        } catch (e) {
          Logger.map({'error:': e, 'item': element});
          // return the empty array
          list.clear();
        }
      }
    }

    return list;
  }

  static T toObject<T>(
    dynamic map,
    T Function(Map<String, dynamic> map) parser,
  ) {
    try {
      return parser(map);
    } catch (e) {
      Logger.map({
        'error:': e,
      });
      rethrow;
    }
  }

  static List<String> toStringList(dynamic map) {
    List<String> list = [];
    if (map != null) {
      list = List.from(map).cast<String>();
    }

    return list;
  }
}
