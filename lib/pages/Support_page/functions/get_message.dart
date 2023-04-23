// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:set_of_service_app/pages/Support_page/models/support_models.get.dart';

// class SupportMessage {
//   static Future<List<support_get>> fetchMessage() async {
//     const uri = "http://185.196.213.43:7088/support-chats/get-all-dialog/1";
//     final url = Uri.parse(uri);

//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final body = response.body;
//         final json = jsonDecode(body);
//         print(json);
//         final result = json["object"] as List<dynamic>;
//         final messages = result
//             .map((e) => support_get(
//                   id: e["id"] as int,
//                   createdAt: e["createdAt"] as DateTime,
//                   userId: e["userId"] as int,
//                   dialogs: Dialogs(
//                     userId: e["dialogs"]["userId"] as int,
//                     message: e["dialogs"]["message"],
//                     accountType: e["dialogs"]["accountType"],
//                   ),
//                 ))
//             .toList();
//         return messages;
//       } else {
//         throw Exception("Failed to fetch data");
//       }
//     } catch (e) {
//       print("Error: $e");
//       rethrow;
//     }
//   }
// }
