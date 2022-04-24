class VideoModel {
  String? categoryName;
  String? filename;
  String? url;

  VideoModel({
    required this.categoryName,
    required this.filename,
    required this.url,
  });

  VideoModel.fromJson(Map<String, dynamic> mapData) {
    categoryName = mapData['Categoryname'];
    filename = mapData['filename'];
    url = mapData['url'];


    
  }
}
