class FullProcess {
  List<ProcessedImage> afterProcessImages;
  List<ProcessedImage> beforeProcessImages;
  int id;
  String description;
  String end_date;
  String hair_count;
  String operation;
  String pationt_name;
  String pationt_phone_number;
  String start_date;
  String status;
  String technecian_name;
  String visit_date;

  FullProcess({
    required this.afterProcessImages,
    required this.beforeProcessImages,
    required this.id,
    required this.description,
    required this.end_date,
    required this.hair_count,
    required this.operation,
    required this.pationt_name,
    required this.pationt_phone_number,
    required this.start_date,
    required this.status,
    required this.technecian_name,
    required this.visit_date,
  });

  factory FullProcess.fromJson(Map<String, dynamic> json) {
    return FullProcess(
      afterProcessImages: (json['after_operation'] != null) ? List<ProcessedImage>.from(json['after_operation'].map((image) => ProcessedImage.fromJson(image))) : [],
      beforeProcessImages: (json['before_operation'] != null) ? List<ProcessedImage>.from(json['before_operation'].map((image) => ProcessedImage.fromJson(image))) : [],
      description: json['description'],
      id: json['id'],
      end_date: json['end_date'],
      hair_count: json['hair_count'],
      operation: json['operation'],
      pationt_name: json['pationt_name'],
      pationt_phone_number: json['pationt_phone_number'],
      start_date: json['start_date'],
      status: json['status'],
      technecian_name: json['technecian_name'],
      visit_date: json['visit_date'],
    );
  }
}

class ProcessedImage {
  String filename;

  ProcessedImage({
    required this.filename,
  });

  factory ProcessedImage.fromJson(Map<String, dynamic> json) {
    return ProcessedImage(
      filename: json['file_name'],
    );
  }
}
