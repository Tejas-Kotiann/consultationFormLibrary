import 'package:consultation_form_library/enums/form_type.dart';
import 'package:consultation_form_library/hoc/form_renderer.dart';
import 'package:flutter/material.dart';
import 'adapters/consult-adapter.dart';
import 'models/consult.dart';

void main() {
  runApp(MainApp());
}

class ConsultAdapter implements IConsultAdapter {
  @override
  Future<void> fetchTemplates() {
    // TODO: implement fetchTemplates
    throw UnimplementedError();
  }

  @override
  Future<String> getConsultId() {
    // TODO: implement getConsultId
    throw UnimplementedError();
  }

  @override
  Future<String> getPatientId() {
    // TODO: implement getPatientId
    throw UnimplementedError();
  }

  @override
  Future<Consult?> load() async {
    // TODO: implement load
    return Future.value(
        const Consult(firstName: "abc", lastName: "xyz", phoneNumber: 122344));
    // throw UnimplementedError();
  }

  @override
  Future<void> save(Consult item) async {
    // TODO: implement save
    print(
        'FirstName: ${item.firstName} LastName: ${item.lastName} PhoneNumber: ${item.phoneNumber}');
    // throw UnimplementedError();
  }

  @override
  Future<void> saveTemplate() {
    // TODO: implement saveTemplate
    throw UnimplementedError();
  }
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final IConsultAdapter adapter = ConsultAdapter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: FormRenderer(formType: FormType.anc, adapter: adapter));
  }
}
