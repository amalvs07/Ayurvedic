import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/getPatientModel.dart';

class PatientListProvider extends ChangeNotifier {
  List<Patient> _patients = [];

  List<Patient> get patients => _patients;

  Future<void> fetchPatients() async {
    final url = Uri.parse('https://flutter-amr.noviindus.in/api/PatientList');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        _patients = responseData.map((data) => Patient.fromJson(data)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to fetch patient list');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}