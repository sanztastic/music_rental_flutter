import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_rental_flutter/network/network_service.dart';
import 'package:music_rental_flutter/pages/login/login_page.dart';
import 'package:music_rental_flutter/pages/static/static_values.dart';

class PageOneProvider with ChangeNotifier{
  void verifyEmail({
    required TextEditingController email,
    required BuildContext context,
  }) async{
    if (email.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email field is empty"),
        ),
      );
    }else{
      final response = await NetworkService.sendRequest(
        requestType: RequestType.post,
        url: StaticValues.apiUrlUser + "/forgot",
        body: {
          'email': email.text,
        },
      );
      final resMap = json.decode(response!.body);
      print(resMap);
      if (resMap["success"] == 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(resMap["message"]),
          ),
        );
      }else if((resMap["success"] == 1)){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const LoginPage()));
      } 
    }
  }
}