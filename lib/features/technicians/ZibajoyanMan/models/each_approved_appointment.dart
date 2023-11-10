class EachApprovedAppointments {
  List<ProcessedImage> afterProcessImages;
  List<ProcessedImage> beforeProcessImages;
  String hairCount;
  int id;
  String operation;
  String patientName;
  String patientPhoneNumber;
  String status;
  String visitDate;

  EachApprovedAppointments({
    required this.afterProcessImages,
    required this.beforeProcessImages,
    required this.hairCount,
    required this.id,
    required this.operation,
    required this.patientName,
    required this.patientPhoneNumber,
    required this.status,
    required this.visitDate,
  });

  factory EachApprovedAppointments.fromJson(Map<String, dynamic> json) {
    return EachApprovedAppointments(
      afterProcessImages: (json['after_process_images'] != null)
          ? List<ProcessedImage>.from(json['after_process_images']
              .map((image) => ProcessedImage.fromJson(image)))
          : [],
      beforeProcessImages: (json['before_process_images'] != null)
          ? List<ProcessedImage>.from(json['before_process_images']
              .map((image) => ProcessedImage.fromJson(image)))
          : [],
      hairCount: json['hair_count'],
      id: json['id'],
      operation: json['operation'],
      patientName: json['pationt_name'],
      patientPhoneNumber: json['pationt_phone_number'],
      status: json['status'],
      visitDate: json['visit_date'],
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
      filename: json['filename'],
    );
  }
}
