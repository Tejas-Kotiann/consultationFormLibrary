import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../adapters/consult_adapter.dart';
import '../models/consult.dart';

class ANCConsultForm extends StatefulWidget {
  final IConsultAdapter adapter;

  const ANCConsultForm({super.key, required this.adapter});

  @override
  State<ANCConsultForm> createState() => _ANCConsultFormState();
}

class _ANCConsultFormState extends State<ANCConsultForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  Future<Consult?>? _existingConsult;

  @override
  void initState() {
    super.initState();
    _loadExistingConsult();
  }

  Future<void> _loadExistingConsult() async {
    setState(() {
      _existingConsult = widget.adapter.load();
    });
  }

  Future<void> _handleSubmit(Map<String, dynamic>? formValues) async {
    try {
      final newConsult = Consult(
        firstName: formValues?['firstName'],
        lastName: formValues?['lastName'],
        phoneNumber: int.parse(formValues?['phoneNumber']),
        pregnancyHistory: formValues?['pregnancyHistory'],
        symptomsAndComplaints: formValues?['symptomsAndComplaints'],
        careRecommendations: formValues?['careRecommendations'],
      );
      await widget.adapter.save(newConsult);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Consult Saved')),
      );
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ANC CONSULTATION FORM'),
      ),
      body: FutureBuilder<Consult?>(
        future: _existingConsult,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final existingConsult = snapshot.data;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: FormBuilder(
              key: _formKey,
              child: ListView(
                children: [
                  FormBuilderTextField(
                    name: 'firstName',
                    initialValue: existingConsult?.firstName ?? '',
                    decoration: const InputDecoration(
                        labelText: 'ANC Patient First Name'),
                    validator: FormBuilderValidators.required(),
                  ),
                  FormBuilderTextField(
                    name: 'lastName',
                    initialValue: existingConsult?.lastName ?? '',
                    decoration: const InputDecoration(
                        labelText: 'ANC Patient Last Name'),
                    validator: FormBuilderValidators.required(),
                  ),
                  FormBuilderTextField(
                    name: 'phoneNumber',
                    initialValue: existingConsult?.phoneNumber.toString() ?? '',
                    decoration: const InputDecoration(
                        labelText: 'ANC Patient Phone Number'),
                    keyboardType: TextInputType.number,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(),
                    ]),
                  ),
                  FormBuilderTextField(
                    name: 'pregnancyHistory',
                    initialValue: existingConsult?.pregnancyHistory ?? '',
                    decoration: const InputDecoration(
                        labelText: 'Pregnancy History'),
                    maxLines: 3,
                    validator: FormBuilderValidators.required(),
                  ),
                  FormBuilderTextField(
                    name: 'symptomsAndComplaints',
                    initialValue: existingConsult?.symptomsAndComplaints ?? '',
                    decoration: const InputDecoration(
                        labelText: 'Symptoms and Complaints'),
                    maxLines: 3,
                    validator: FormBuilderValidators.required(),
                  ),
                  FormBuilderTextField(
                    name: 'careRecommendations',
                    initialValue: existingConsult?.careRecommendations ?? '',
                    decoration: const InputDecoration(
                        labelText: 'Care Recommendations'),
                    maxLines: 3,
                    validator: FormBuilderValidators.required(),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.saveAndValidate() ?? false) {
                        final formValues = _formKey.currentState?.value;
                        _handleSubmit(formValues);
                      }
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
