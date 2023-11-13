import 'dart:convert';

import 'package:flutter/material.dart';

class NotificationModel {
  final String processId;
  final String notificationType;
  final String massage;
  bool? hasButtonOption;
  Color? color;
  String? title;

  NotificationModel({
    required this.processId,
    required this.notificationType,
    required this.massage,
    this.hasButtonOption,
    this.color,
    this.title,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    var model = NotificationModel(
      processId: json['process_id'],
      notificationType: json['notification_type'],
      massage: json['massage'],
    );
    switch (model.notificationType) {
      case "accept":
        model.color = Color(0xff5B89E0);
        model.hasButtonOption = false;
        model.title = 'نوبت شما قبول شد';
        break;
      case "reject":
        model.color = Color(0xffF34363);
        model.hasButtonOption = true;
        model.title = 'نوبت شما رد شد';
        break;
      case "start":
        model.color = Color(0xffFF9211);
        model.hasButtonOption = false;
        model.title = 'تغییر وضیعت نوبت';
        break;
      case "end":
        model.color = Color(0xffFF9211);
        model.hasButtonOption = false;
        model.title = 'تغییر وضیعت نوبت';
        break;
    }

    return model;
  }
}

NotificationModel convertJsonModel(String jsonString) {
  // Decode the JSON string
  var decodedObject = json.decode(jsonString) as Map<String, dynamic>;

  return NotificationModel.fromJson(decodedObject);
}
