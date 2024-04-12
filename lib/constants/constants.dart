import 'package:flutter/material.dart';

class GlobalVariables {
  static Widget height30 = const SizedBox(
    height: 30,
  );
  static Widget height10 = const SizedBox(
    height: 10,
  );
  static Widget height20 = const SizedBox(
    height: 20,
  );
  static Widget height40 = const SizedBox(
    height: 40,
  );
    static Widget width10 = const SizedBox(
    width: 10,
  );
    static Widget width40 = const SizedBox(
    width: 40,
  );
  static Color borderColor = Colors.grey.withOpacity(0.5);
  static Color mainColor = const Color(0xFFEA7605);

  static String svgMessage = 'assets/message.svg';
    static String svgProfile = 'assets/profile.svg';
      static String svgSent = 'assets/sent.svg';
        static String svgAddpolls =  'assets/addpoll.svg';
          static String svgallpolls = 'assets/allposts.svg';

  static AppBar appBar(String text) {
    return AppBar(
      centerTitle: true,
      title: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(245, 134, 0, 1),
              Color.fromRGBO(198, 66, 22, 1),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
      ),
    );
  }
}

class ApiConstants {
  static const String baseUrl = 'https://dev.stance.live/api';
  static const String api = '$baseUrl/test-polls/';
}

