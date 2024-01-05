class ImageModel {
  String? imagePath;

  ImageModel({this.imagePath});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imagePath'] = imagePath;
    return data;
  }
}
