import '../../ZibajoyanMan/models/each_approved_appointment.dart';

class MainTechModel {
  Approved approved;
  Pending pending;

  MainTechModel({
    required this.approved,
    required this.pending,
  });

  factory MainTechModel.fromJson(Map<String, dynamic> json) => MainTechModel(
    approved: Approved.fromJson(json["approved"]),
    pending: Pending.fromJson(json["pending"]),
  );

}

class Approved {
  List<EachApprovedAppointments> items;

  Approved({
    required this.items,
  });

  factory Approved.fromJson(Map<String, dynamic> json) => Approved(
    items: List<EachApprovedAppointments>.from(json["items"].map((x) => EachApprovedAppointments.fromJson(x))),
  );

}

class ApprovedItem {
  List<ProcessImage> afterProcessImages;
  List<ProcessImage> beforeProcessImages;
  String hairCount;
  int id;
  String operation;
  String patientName;
  String patientPhoneNumber;
  String status;
  String visitDate;

  ApprovedItem({
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

  factory ApprovedItem.fromJson(Map<String, dynamic> json) => ApprovedItem(
    afterProcessImages: (json['after_process_images'] != null) ? List<ProcessImage>.from(json['after_process_images'].map((image) => ProcessImage.fromJson(image))) : [],
    beforeProcessImages: (json['before_process_images'] != null) ? List<ProcessImage>.from(json['before_process_images'].map((image) => ProcessImage.fromJson(image))) : [],
    hairCount: json["hair_count"],
    id: json["id"],
    operation: json["operation"],
    patientName: json["pationt_name"],
    patientPhoneNumber: json["pationt_phone_number"],
    status: json["status"],
    visitDate: json["visit_date"],
  );
}

class ProcessImage {
  String filename;

  ProcessImage({
    required this.filename,
  });

  factory ProcessImage.fromJson(Map<String, dynamic> json) => ProcessImage(
    filename: json["filename"],
  );


}

class Pending {
  List<PendingItem> items;

  Pending({
    required this.items,
  });

  factory Pending.fromJson(Map<String, dynamic> json) => Pending(
    items: List<PendingItem>.from(json["items"].map((x) => PendingItem.fromJson(x))),
  );


}

class PendingItem {
  int id;
  String operation;
  String pationtName;
  String visitDate;

  PendingItem({
    required this.id,
    required this.operation,
    required this.pationtName,
    required this.visitDate,
  });

  factory PendingItem.fromJson(Map<String, dynamic> json) => PendingItem(
    id: json["id"],
    operation: json["operation"],
    pationtName: json["pationt_name"],
    visitDate: json["visit_date"],
  );


}
