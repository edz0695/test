import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  static final ImagePicker _picker = ImagePicker();
  static bool _isPickerActive = false;

  ImagePickerService._(); // Private constructor for Singleton

  // Pick multiple images
  static Future<List<XFile>?> pickImages() async {
    if (_isPickerActive) {
      print("Picker is already active, please wait.");
      return null;
    }

    _isPickerActive = true;

    try {
      // Ensure we reset _isPickerActive after the operation is completed
      List<XFile>? images = await _picker.pickMultiImage();
      if (images.isEmpty) {
        return null;
      }
      return images;
    } catch (e) {
      print('Error picking images: $e');
      return null;
    } finally {
      // Reset _isPickerActive flag after the operation
      _isPickerActive = false;
    }
  }

  // Pick multiple videos
  static Future<List<XFile>?> pickVideos() async {
    if (_isPickerActive) {
      print("Picker is already active, please wait.");
      return null;
    }

    _isPickerActive = true;

    try {
      // Ensure we reset _isPickerActive after the operation is completed
      List<XFile>? videos = await _picker.pickMultipleMedia();
      if (videos.isEmpty) {
        return null;
      }
      return videos;
    } catch (e) {
      print('Error picking videos: $e');
      return null;
    } finally {
      // Reset _isPickerActive flag after the operation
      _isPickerActive = false;
    }
  }

  // Pick a single image
  static Future<XFile?> pickSingleImage(
      {ImageSource source = ImageSource.gallery}) async {
    if (_isPickerActive) {
      print("Picker is already active, please wait.");
      return null;
    }
    _isPickerActive = true;
    try {
      XFile? image = await _picker.pickImage(source: source);
      if (image == null) {
        return null;
      }
      return image;
    } catch (e) {
      print('Error picking a single image: $e');
      return null;
    } finally {
      // Reset _isPickerActive flag after the operation
      _isPickerActive = false;
    }
  }
}
