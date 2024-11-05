import 'package:consultation_form_library/enums/form_type.dart';
import 'package:consultation_form_library/hoc/form_renderer.dart';
import 'package:flutter/material.dart';
import 'adapters/consult-adapter.dart';
import 'models/consult.dart';

void main() {
  runApp(MainApp());
}

class ConsultAdapter implements IConsultAdapter {
  // Private identifiers
  late String _patientId;
  late String _consultId;

  // Constructor to initialize patientId and consultId, if needed
  ConsultAdapter({required String patientId, required String consultId}) {
    _patientId = patientId;
    _consultId = consultId;
  }

  @override
  String getPatientId() {
    return _patientId;
  }

  @override
  String getConsultId() {
    return _consultId;
  }

  @override
  Future fetchCaseSheetTemplates() {
    // TODO: implement fetchCaseSheetTemplates
    throw UnimplementedError();
  }

  @override
  Future fetchDocuments() {
    // TODO: implement fetchDocuments
    throw UnimplementedError();
  }

  @override
  Future fetchMedicineTemplates() {
    // TODO: implement fetchMedicineTemplates
    throw UnimplementedError();
  }

  @override
  Future fetchSymptomsTemplates() {
    // TODO: implement fetchSymptomsTemplates
    throw UnimplementedError();
  }

  @override
  Future<String> getCaseSheetTemplate(String id) {
    // TODO: implement getCaseSheetTemplate
    throw UnimplementedError();
  }

  @override
  Future getCaseSheetTemplateData(String id) {
    // TODO: implement getCaseSheetTemplateData
    throw UnimplementedError();
  }

  @override
  Future<String> getMedicineTemplate(String id) {
    // TODO: implement getMedicineTemplate
    throw UnimplementedError();
  }

  @override
  Future getMedicineTemplateData(String id) {
    // TODO: implement getMedicineTemplateData
    throw UnimplementedError();
  }

  @override
  Future<String> getSymptomsTemplate(String id) {
    // TODO: implement getSymptomsTemplate
    throw UnimplementedError();
  }

  @override
  Future getSymptomsTemplateData(String id) {
    // TODO: implement getSymptomsTemplateData
    throw UnimplementedError();
  }

  @override
  Future<Consult?> load() {
    return Future.value(
        const Consult(firstName: "abc", lastName: "xyz", phoneNumber: 122344));
  }

  @override
  Future<void> save(Consult item) async {
    // TODO: implement save
    print(
        'FirstName: ${item.firstName} LastName: ${item.lastName} PhoneNumber: ${item.phoneNumber}');
  }

  @override
  Future saveCaseSheetTemplate(caseSheetTemplate, String templateId) {
    // TODO: implement saveCaseSheetTemplate
    throw UnimplementedError();
  }

  @override
  Future saveMedicineTemplate(medicineTemplate, String templateId) {
    // TODO: implement saveMedicineTemplate
    throw UnimplementedError();
  }

  @override
  Future saveSymptomsTemplate(symptomsTemplate, String templateId) {
    // TODO: implement saveSymptomsTemplate
    throw UnimplementedError();
  }
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final IConsultAdapter adapter =
      ConsultAdapter(consultId: "s223", patientId: "qwe");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: FormRenderer(formType: FormType.opd, adapter: adapter));
  }
}
