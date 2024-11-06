import 'package:equatable/equatable.dart';

class Consult extends Equatable {
  final String firstName;
  final String lastName;
  final int phoneNumber;

  // Additional fields for OPD and ANC Consult
  final String chiefComplaint; // OPD Consult
  final String clinicalFindings; // OPD Consult
  final String treatmentPlan; // OPD Consult
  final String pregnancyHistory; // ANC Consult
  final String symptomsAndComplaints; // ANC Consult
  final String careRecommendations; // ANC Consult

  const Consult({
    this.firstName = '',
    this.lastName = '',
    this.phoneNumber = 0,
    this.chiefComplaint = '',
    this.clinicalFindings = '',
    this.treatmentPlan = '',
    this.pregnancyHistory = '',
    this.symptomsAndComplaints = '',
    this.careRecommendations = '',
  });

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        phoneNumber,
        chiefComplaint,
        clinicalFindings,
        treatmentPlan,
        pregnancyHistory,
        symptomsAndComplaints,
        careRecommendations,
      ];

  @override
  String toString() =>
      'Consult(firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, chiefComplaint: $chiefComplaint, clinicalFindings: $clinicalFindings, treatmentPlan: $treatmentPlan, pregnancyHistory: $pregnancyHistory, symptomsAndComplaints: $symptomsAndComplaints, careRecommendations: $careRecommendations)';
}
