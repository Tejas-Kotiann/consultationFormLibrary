import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../models/consult.dart';

class OPDConsultForm extends StatefulWidget {
  final Consult consultModel;
  final Function(Consult) onSave;

  const OPDConsultForm(
      {super.key, required this.consultModel, required this.onSave});

  @override
  State<OPDConsultForm> createState() => _OPDConsultFormState();
}

class _OPDConsultFormState extends State<OPDConsultForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> _handleSubmit(Map<String, dynamic>? formValues) async {
    try {
      final phoneNumber = int.tryParse(formValues?['phoneNumber'] ?? '');
      if (phoneNumber == null) {
        throw 'Invalid phone number';
      }

      final newConsult = Consult(
        firstName: formValues?['firstName'],
        lastName: formValues?['lastName'],
        phoneNumber: phoneNumber,
      );

      widget.onSave(newConsult);

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
        title: const Text('Save'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'firstName',
                initialValue: widget.consultModel.firstName,
                decoration: const InputDecoration(labelText: 'First Name'),
                validator: FormBuilderValidators.required(),
              ),
              FormBuilderTextField(
                name: 'lastName',
                initialValue: widget.consultModel.lastName,
                decoration: const InputDecoration(labelText: 'Last Name'),
                validator: FormBuilderValidators.required(),
              ),
              FormBuilderTextField(
                name: 'phoneNumber',
                initialValue: widget.consultModel.phoneNumber.toString(),
                decoration: const InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.number,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                ]),
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
      ),
    );
  }
}
