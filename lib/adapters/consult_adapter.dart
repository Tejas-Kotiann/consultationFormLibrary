// Adapter Interface
import '../models/consult.dart';

abstract class IConsultAdapter {
  // Load and Save methods for Consult
  Future<Consult?> load();
  Future<void> save(Consult item);

  // Getter and Setter to access the identifiers
  String get patientId;
  String get consultId;
  set patientId(String value);
  set consultId(String value);

  // Case Sheet Template Methods
  Future<List<dynamic>> fetchCaseSheetTemplates();
  Future<String> getCaseSheetTemplate(String id);
  Future<dynamic> getCaseSheetTemplateData(String id);
  Future<void> updateCaseSheetTemplate(
      dynamic caseSheetTemplate, String templateId);
  Future<void> createNewCaseSheetTemplate(dynamic caseSheetTemplate);

  // Medicine Template Methods
  Future<List<dynamic>> fetchMedicineTemplates();
  Future<String> getMedicineTemplate(String id);
  Future<dynamic> getMedicineTemplateData(String id);
  Future<void> updateMedicineTemplate(
      dynamic medicineTemplate, String templateId);
  Future<void> createNewMedicineTemplate(dynamic medicineTemplate);

  // Symptoms Template Methods
  Future<List<dynamic>> fetchSymptomsTemplates();
  Future<String> getSymptomsTemplate(String id);
  Future<dynamic> getSymptomsTemplateData(String id);
  Future<void> saveSymptomsTemplate(
      dynamic symptomsTemplate, String templateId);
  Future<void> createNewSymptomsTemplate(dynamic symptomsTemplate);

  // Document Methods
  Future<List<dynamic>> fetchDocuments();
  Future<void> uploadDocument(dynamic document);
}
