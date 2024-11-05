// Adapter Interface
import '../models/consult.dart';

abstract class IConsultAdapter {
  Future<Consult?> load();
  Future<void> save(Consult item);

  // Getter methods to access the identifiers
  String getPatientId();
  String getConsultId();

  // Case Sheet Template Methods
  Future<dynamic> fetchCaseSheetTemplates();
  Future<String> getCaseSheetTemplate(String id);
  Future<dynamic> getCaseSheetTemplateData(String id);
  Future<dynamic> saveCaseSheetTemplate(
      dynamic caseSheetTemplate, String templateId);

  // Medicine Template Methods
  Future<dynamic> fetchMedicineTemplates();
  Future<String> getMedicineTemplate(String id);
  Future<dynamic> getMedicineTemplateData(String id);
  Future<dynamic> saveMedicineTemplate(
      dynamic medicineTemplate, String templateId);

  // Symptoms Template Methods
  Future<dynamic> fetchSymptomsTemplates();
  Future<String> getSymptomsTemplate(String id);
  Future<dynamic> getSymptomsTemplateData(String id);
  Future<dynamic> saveSymptomsTemplate(
      dynamic symptomsTemplate, String templateId);

  // Document Methods
  Future<dynamic> fetchDocuments();
}
