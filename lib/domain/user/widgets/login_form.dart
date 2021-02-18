import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../widgets/default_text_field.dart';
import '../widgets/submit_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key key}) : super(key: key);

  final String email = 'email';
  final String password = 'password';

  @override
  Widget build(BuildContext context) {
    final form = FormGroup({
      email: FormControl<String>(
          validators: [Validators.required, Validators.email]),
      password: FormControl<String>(validators: [Validators.required])
    });

    final _defaultSpacing = SizedBox(height: 1 / 20 * Get.height);
    return ReactiveForm(
      formGroup: form,
      child: ListView(
        children: [
          _defaultSpacing,
          Center(
            child: Container(
              height: 0.4 * Get.height,
              width: 0.8 * Get.width,
              color: Colors.greenAccent,
            ),
          ),
          _defaultSpacing,
          DefaultTextField(
            formControlName: email,
            label: 'EMAIL',
          ),
          _defaultSpacing,
          DefaultTextField(
            formControlName: password,
            label: 'PASSWORD',
          ),
          _defaultSpacing,
          const SubmitButton(),
        ],
      ),
    );
  }
}
