import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../adapters/consult_adapter.dart';
import '../models/consult.dart';

class OPDConsultForm extends StatefulWidget {
  final IConsultAdapter adapter;

  const OPDConsultForm({super.key, required this.adapter});

  @override
  State<OPDConsultForm> createState() => _OPDConsultFormState();
}

class _OPDConsultFormState extends State<OPDConsultForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  Future<Consult?>? _existingConsult;

  @override
  void initState() {
    super.initState();
    _loadExistingConsult();
  }

  Future<void> _loadExistingConsult() async {
    print(widget.adapter.consultId);
    widget.adapter.consultId = "updatedconsultId";
    print(widget.adapter.consultId);
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
        chiefComplaint: formValues?['chiefComplaint'],
        clinicalFindings: formValues?['clinicalFindings'],
        treatmentPlan: formValues?['treatmentPlan'],
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
        title: const Text('OPD CONSULTATION FORM'),
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
                        labelText: 'OPD Patient First Name'),
                    validator: FormBuilderValidators.required(),
                  ),
                  FormBuilderTextField(
                    name: 'lastName',
                    initialValue: existingConsult?.lastName ?? '',
                    decoration: const InputDecoration(
                        labelText: 'OPD Patient Last Name'),
                    validator: FormBuilderValidators.required(),
                  ),
                  FormBuilderTextField(
                    name: 'phoneNumber',
                    initialValue: existingConsult?.phoneNumber.toString() ?? '',
                    decoration: const InputDecoration(
                        labelText: 'OPD Patient Phone Number'),
                    keyboardType: TextInputType.number,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(),
                    ]),
                  ),
                  // Chief Complaint TextArea
                  FormBuilderTextField(
                    name: 'chiefComplaint',
                    initialValue: existingConsult?.chiefComplaint ?? '',
                    decoration:
                        const InputDecoration(labelText: 'Chief Complaint'),
                    maxLines: 3,
                    validator: FormBuilderValidators.required(),
                  ),
                  // Clinical Findings TextArea
                  FormBuilderTextField(
                    name: 'clinicalFindings',
                    initialValue: existingConsult?.clinicalFindings ?? '',
                    decoration:
                        const InputDecoration(labelText: 'Clinical Findings'),
                    maxLines: 3,
                    validator: FormBuilderValidators.required(),
                  ),
                  // Treatment Plan TextArea
                  FormBuilderTextField(
                    name: 'treatmentPlan',
                    initialValue: existingConsult?.treatmentPlan ?? '',
                    decoration:
                        const InputDecoration(labelText: 'Treatment Plan'),
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
