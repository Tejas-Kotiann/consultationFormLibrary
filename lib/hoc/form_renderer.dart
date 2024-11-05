import 'package:consultation_form_library/adapters/consult-adapter.dart';
import 'package:consultation_form_library/forms/_anc_consult_form.dart';
import 'package:consultation_form_library/forms/_opd_consult_form.dart';
import 'package:flutter/material.dart';
import '../enums/form_type.dart';

class FormRenderer extends StatelessWidget {
  final FormType formType;
  final IConsultAdapter adapter;

  const FormRenderer({
    super.key,
    required this.formType,
    required this.adapter,
  });

  @override
  Widget build(BuildContext context) {
    switch (formType) {
      case FormType.anc:
        return ANCConsultForm(
          adapter: adapter,
        );
      case FormType.opd:
        return OPDConsultForm(
          adapter: adapter,
        );
      default:
        return const Center(child: Text('Invalid form type.'));
    }
  }
}
