// Adapter Interface
import '../models/consult.dart';

abstract class IConsultAdapter {
  Future<Consult?> load();
  Future<void> save(Consult item);
  Future<String> getPatientId();
  Future<String> getConsultId();
  Future<void> fetchTemplates();
  Future<void> saveTemplate();
}
