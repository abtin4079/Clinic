import 'package:clinic/features/client/Home/Controller/remote_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../Models/list_of_process.dart';

class ProcessController extends GetxController {

 // var ProcessList = List<Item>().obs;
  RxList<Item> items = <Item>[].obs;
    final FlutterSecureStorage secureStorage = Get.put(FlutterSecureStorage());

    void fetchprocesses() async {

      var processes = await RemoteService.fetchProcesses();

      print(processes);
      if(processes != null){
        items.value = processes as List<Item>;
      }
    }
}