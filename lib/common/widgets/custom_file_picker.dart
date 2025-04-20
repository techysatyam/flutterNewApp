
import 'package:file_picker/file_picker.dart';

class CustomFilePicker {
  Future<PlatformFile?> pickFile(
      {required FileType fileType,
        required List<String>? allowedExtensions}) async {
    PlatformFile? file;
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: fileType, allowedExtensions: allowedExtensions);

    if (result != null) {
      file = result.files.first;
    }

    return file;
  }
}
