import 'package:flutter/foundation.dart';
import 'package:flutter_template/src/constants/app_data.dart';
import 'package:url_launcher/url_launcher.dart';

class Links {
  Future<bool> terms() async {
    final link = Uri.parse(AppData.legalPage);

    return _launchUrlSafe(url: link, fallback: link);
  }

  Future<bool> _launchUrlSafe({
    required Uri url,
    required Uri fallback,
  }) async {
    var success = false;
    if (kIsWeb) {
      success = await launchUrl(fallback);
    } else {
      try {
        success = await launchUrl(url);
      } catch (e) {
        success = false;
      }
      if (!success) {
        try {
          success = await launchUrl(fallback);
        } catch (e) {
          success = false;
        }
      }
    }

    return success;
  }
}
