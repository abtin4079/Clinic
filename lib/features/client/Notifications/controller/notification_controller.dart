// import 'package:get/get.dart';
// import 'package:sse/sse.dart';

// class SseService extends GetxController {
//   SseClient? _sseClient;

//   void initializeConnection() {
//     _sseClient = SseClient('your_sse_endpoint');

//     _sseClient!.stream.listen((data) {
//       // Handle SSE data
//       print('Message: $data');
//     });

//     _sseClient!.errors.listen((error) {
//       // Handle SSE errors
//       print('Error: $error');
//     });

//     _sseClient!.done.then((_) {
//       // Handle SSE connection closed
//       print('Connection closed');
//     });
//   }

//   SseClient? get sseClient => _sseClient;
// }
