import 'package:image_picker/image_picker.dart';
import 'package:receipe_app/app/app.logger.dart';

class ImagePickerService {
  Future<XFile?> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final logger = getLogger('ImagePickerService');

    final XFile? pickedGalleryImage =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedGalleryImage == null) {
      logger.d('Null Image path from gallery:::${pickedGalleryImage!.path}');
      //return File('Empty path');
    }

    logger.i('Image name from gallery:::${pickedGalleryImage.name}');
    logger.i('Image path from gallery:::${pickedGalleryImage.path}');

    return XFile(pickedGalleryImage.path);
  }
}
