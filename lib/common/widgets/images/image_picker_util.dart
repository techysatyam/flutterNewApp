import 'package:image_picker/image_picker.dart';

class ImagePickerUtil {
  Future<XFile?> pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await ImagePicker().pickImage(source: source);

      if (pickedFile != null) {
        return pickedFile;
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
