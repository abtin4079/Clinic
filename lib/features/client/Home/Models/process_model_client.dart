class ProcessModuleClient {
  List<Item> items;

  ProcessModuleClient({
    required this.items,
  });

  factory ProcessModuleClient.fromJson(Map<String, dynamic> json) => ProcessModuleClient(
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );


}

class Item {
  List<Operation> afterOperation;
  List<Operation> beforeOperation;
  String description;
  String endDate;
  String hairCount;
  int id;
  String operation;
  String pationtName;
  String pationtPhoneNumber;
  String startDate;
  String status;
  String technecianName;
  String visitDate;

  Item({
    required this.afterOperation,
    required this.beforeOperation,
    required this.description,
    required this.endDate,
    required this.hairCount,
    required this.id,
    required this.operation,
    required this.pationtName,
    required this.pationtPhoneNumber,
    required this.startDate,
    required this.status,
    required this.technecianName,
    required this.visitDate,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    afterOperation: (json['after_operation'] != null) ? List<Operation>.from(json['after_operation'].map((image) => Operation.fromJson(image))) : [],
    beforeOperation: (json['before_operation'] != null) ? List<Operation>.from(json['before_operation'].map((image) => Operation.fromJson(image))) : [],
    description: json["description"],
    endDate: json["end_date"],
    hairCount: json["hair_count"],
    id: json["id"],
    operation: json["operation"],
    pationtName: json["pationt_name"],
    pationtPhoneNumber: json["pationt_phone_number"],
    startDate: json["start_date"],
    status: json["status"],
    technecianName: json["technecian_name"],
    visitDate: json["visit_date"],
  );


}

class Operation {
  String fileName;

  Operation({
    required this.fileName,
  });

  factory Operation.fromJson(Map<String, dynamic> json) => Operation(
    fileName: json["file_name"],
  );

}
