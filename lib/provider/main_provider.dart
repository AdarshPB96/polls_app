import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:poll_app/constants/constants.dart';
import 'package:poll_app/models/poll_model.dart';

class MainProvider with ChangeNotifier {
  int _selectedValue = 1; // Initial selected value

  int get selectedValue => _selectedValue;

  void setSelectedValue(int value) {
    _selectedValue = value;
    notifyListeners(); // Notify listeners about the change
  }

/////addpollsScreen
  final TextEditingController topicController = TextEditingController();
  final TextEditingController statementController = TextEditingController();
  final TextEditingController options1Controller = TextEditingController();
  final TextEditingController options2Controller = TextEditingController();
  final TextEditingController options3Controller = TextEditingController();
  final TextEditingController options4Controller = TextEditingController();

  Future<void> createPoll(BuildContext context) async {
     if (topicController.text.isEmpty ||
      statementController.text.isEmpty ||
      options1Controller.text.isEmpty ||
      options2Controller.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Please fill in all fields, including at least two options')),
    );
    return;
  }
    Map<String, dynamic> pollData = {
      "topic": topicController.text,
      "statement": statementController.text,
      "is_anonymous": "false",
      "poll_type": "text",
      "text_options": [
        options1Controller.text,
        options2Controller.text,
        options3Controller.text,
        options4Controller.text,
      ]
    };

    try {
      final response = await http.post(
        Uri.parse(ApiConstants.api),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(pollData),
      );

      if (response.statusCode == 200) {
        topicController.clear();
        statementController.clear();
        options1Controller.clear();
        options2Controller.clear();
        options3Controller.clear();
        options4Controller.clear();
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Poll created successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create poll. Please try again.')),
        );
      }
    } catch (error) {
      print('Error creating poll: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred. Please try again later.')),
      );
    }
  }

List<Poll> _polls = [];

  List<Poll> get polls => _polls;

  Future<void> fetchPolls() async {
    try {
      final response = await http.get(
        Uri.parse(ApiConstants.api),
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['data'];
        _polls = data.map((json) => Poll.fromJson(json)).toList();
        notifyListeners(); 
      } else {
        throw Exception('Failed to load polls');
      }
    } catch (error) {
      print('Error fetching polls: $error');
      throw Exception('Failed to load polls');
    }
  }
}
