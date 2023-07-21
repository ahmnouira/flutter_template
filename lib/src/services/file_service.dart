import 'dart:io';
import 'dart:typed_data';

class FileService {
  Future<Uint8List> fileAsBytes(String path) async {
    final file = File(path);

    return file.readAsBytes();
  }
}
