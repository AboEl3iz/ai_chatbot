import 'dart:convert';
import 'dart:developer';

import 'package:ai_chatbot/core/constant.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class AiChatApiService {
  getdatafromchat({required String text}) async {
    var response = await http.post(Uri.parse(Api_AI),
        body: jsonEncode(
          {
            "contents": [
              {
                "parts": [
                  {"text": "{$text}"},
                  
                ],
              }
            ]
          },
        ),
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      log("==============succes===========");

      final Map<String, dynamic> data = jsonDecode(response.body);
      return data['candidates']?[0]?['content']?['parts']?[0]?['text'] ??
          "not Found";
    } else {
      log("error");
      return null;
    }
  }
}
