import 'package:flutter/material.dart';
import 'package:flutter_template/src/services/http_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class DownloadProvider with ChangeNotifier {
  var _progress = 0.0;

  var _loading = false;

  bool get loading => _loading;

  double get progress => _progress;

  Future<String> start({required String url, required String filename}) async {
    // Reset the percentage in case it isn't at zero
    _start();
    _resetProgress();

    // Path amd name

    final directory = await getTemporaryDirectory();
    // final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/$filename';

    // Download
    final service = HttpService();
    await service.download(
      url: url,
      path: path,
      onProgress: _updateProgress,
    );

    return path;
  }

  void _start() {
    _loading = true;
    notifyListeners();
  }

  void _stop() {
    _loading = false;
    notifyListeners();
  }

  void _resetProgress() {
    if (progress != 0) {
      _progress = 0;
      notifyListeners();
    }
  }

  void _updateProgress(double value) {
    _progress = value;
    notifyListeners();
    if (value == 100) {
      _stop();
    }
  }

  static DownloadProvider of(BuildContext context, {bool listen = false}) {
    return Provider.of<DownloadProvider>(context, listen: listen);
  }
}

class DownloadConsumer extends StatelessWidget {
  final Widget Function(DownloadProvider provider) builder;

  const DownloadConsumer({super.key, required this.builder});

  @override
  Widget build(BuildContext context) => Consumer<DownloadProvider>(
        builder: (_, provider, __) => builder(provider),
      );
}
