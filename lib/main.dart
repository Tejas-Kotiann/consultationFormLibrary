import 'package:consultation_form_library/forms/opd-consult-form.dart';
import 'package:flutter/material.dart';

import 'models/consult.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  final Consult consult =
      const Consult(firstName: "Tejas", lastName: "Kotian", phoneNumber: 123);
  void handleConsultSave(Consult newConsult) {
    // Handle the saved consult data here (e.g., save it to a database)
    print(
        'Consult saved: ${newConsult.firstName}, ${newConsult.lastName},${newConsult.phoneNumber}');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OPDConsultForm(consultModel: consult, onSave: handleConsultSave),
    );
  }
}
