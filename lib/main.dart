import 'package:consultation_form_library/enums/form_type.dart';
import 'package:consultation_form_library/hoc/form_renderer.dart';
import 'package:flutter/material.dart';
import 'adapters/consult_adapter.dart';
import 'models/consult.dart';

void main() {
  runApp(MainApp());
}

class ConsultAdapter implements IConsultAdapter {
  // Private fields to hold the patient and consult IDs
  late String _patientId;
  late String _consultId;
  ConsultAdapter({required String patientId, required String consultId}) {
    _patientId = patientId;
    _consultId = consultId;
  }
  @override
  String get patientId => _patientId;

  @override
  set patientId(String value) {
    _patientId = value;
  }

  @override
  String get consultId => _consultId;

  @override
  set consultId(String value) {
    _consultId = value;
  }

  @override
  Future<Consult?> load() async {
    return Future.value(const Consult(
      firstName: 'John',
      lastName: 'Doe',
      phoneNumber: 1234567890,
      chiefComplaint: 'Fever',
      clinicalFindings: 'High Temperature',
      treatmentPlan: 'Paracetamol 500mg',
      pregnancyHistory: 'None',
      symptomsAndComplaints: 'Nausea, Fatigue',
      careRecommendations: 'Rest, Fluids, Monitor Temperature',
    ));
  }

  @override
  Future<void> save(Consult item) async {
    // Placeholder code to simulate saving a Consult object
    print('Saving Consult: ${item.toString()}, ');
  }

  @override
  Future<List<dynamic>> fetchCaseSheetTemplates() async {
    // Placeholder code to simulate fetching case sheet templates
    return Future.value([
      {'id': 'template1', 'name': 'Case Sheet Template 1'},
      {'id': 'template2', 'name': 'Case Sheet Template 2'}
    ]);
  }

  @override
  Future<String> getCaseSheetTemplate(String id) async {
    // Placeholder code to simulate retrieving a specific case sheet template
    return Future.value('Case Sheet Template Data for $id');
  }

  @override
  Future<dynamic> getCaseSheetTemplateData(String id) async {
    // Placeholder code for retrieving case sheet template data
    return Future.value({'id': id, 'data': 'Some case sheet data'});
  }

  @override
  Future<void> updateCaseSheetTemplate(
      dynamic caseSheetTemplate, String templateId) async {
    // Placeholder code for updating a case sheet template
    print('Updating Case Sheet Template $templateId');
  }

  @override
  Future<void> createNewCaseSheetTemplate(dynamic caseSheetTemplate) async {
    // Placeholder code for creating a new case sheet template
    print('Creating new Case Sheet Template');
  }

  @override
  Future<List<dynamic>> fetchMedicineTemplates() async {
    // Placeholder code to simulate fetching medicine templates
    return Future.value([
      {'id': 'medTemplate1', 'name': 'Medicine Template 1'},
      {'id': 'medTemplate2', 'name': 'Medicine Template 2'}
    ]);
  }

  @override
  Future<String> getMedicineTemplate(String id) async {
    // Placeholder code to simulate retrieving a specific medicine template
    return Future.value('Medicine Template Data for $id');
  }

  @override
  Future<dynamic> getMedicineTemplateData(String id) async {
    // Placeholder code for retrieving medicine template data
    return Future.value({'id': id, 'data': 'Some medicine template data'});
  }

  @override
  Future<void> updateMedicineTemplate(
      dynamic medicineTemplate, String templateId) async {
    // Placeholder code for updating a medicine template
    print('Updating Medicine Template $templateId');
  }

  @override
  Future<void> createNewMedicineTemplate(dynamic medicineTemplate) async {
    // Placeholder code for creating a new medicine template
    print('Creating new Medicine Template');
  }

  @override
  Future<List<dynamic>> fetchSymptomsTemplates() async {
    // Placeholder code to simulate fetching symptoms templates
    return Future.value([
      {'id': 'symptomTemplate1', 'name': 'Symptoms Template 1'},
      {'id': 'symptomTemplate2', 'name': 'Symptoms Template 2'}
    ]);
  }

  @override
  Future<String> getSymptomsTemplate(String id) async {
    // Placeholder code to simulate retrieving a specific symptoms template
    return Future.value('Symptoms Template Data for $id');
  }

  @override
  Future<dynamic> getSymptomsTemplateData(String id) async {
    // Placeholder code for retrieving symptoms template data
    return Future.value({'id': id, 'data': 'Some symptoms template data'});
  }

  @override
  Future<void> saveSymptomsTemplate(
      dynamic symptomsTemplate, String templateId) async {
    // Placeholder code for saving a symptoms template
    print('Saving Symptoms Template $templateId');
  }

  @override
  Future<void> createNewSymptomsTemplate(dynamic symptomsTemplate) async {
    // Placeholder code for creating a new symptoms template
    print('Creating new Symptoms Template');
  }

  @override
  Future<List<dynamic>> fetchDocuments() async {
    // Placeholder code to simulate fetching documents
    return Future.value([
      {'id': 'doc1', 'name': 'Document 1'},
      {'id': 'doc2', 'name': 'Document 2'}
    ]);
  }

  @override
  Future<void> uploadDocument(dynamic document) async {
    // Placeholder code for uploading a document
    print('Uploading Document');
  }
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final IConsultAdapter adapter =
      ConsultAdapter(consultId: "consult1", patientId: "patient1");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: FormRenderer(formType: FormType.opd, adapter: adapter));
  }
}
