import 'package:electra_sphere/Candidature%20Screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

class CRSignUpScreen extends StatefulWidget {
  @override
  _CRSignUpScreenState createState() => _CRSignUpScreenState();
}

class _CRSignUpScreenState extends State<CRSignUpScreen> {
  final _signUpFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _outlookIDController = TextEditingController();
  final _cgpaController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _createPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _acceptTermsAndConditions = false;

  late SingleValueDropDownController _cnt;
  late MultiValueDropDownController _cntMulti;

  @override
  void initState() {
    _cnt = SingleValueDropDownController();
    _cntMulti = MultiValueDropDownController();
    super.initState();
  }

  @override
  void dispose() {
    _cnt.dispose();
    _cntMulti.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive width and padding adjustments
        double containerWidth = constraints.maxWidth > 600
            ? 500
            : constraints.maxWidth * 0.9;
        double verticalPadding = constraints.maxHeight * 0.02;

        return Scaffold(
          backgroundColor: const Color(0xffE76239),
          appBar: AppBar(
            title: const Text('Sign Up'),
          ),
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: verticalPadding, horizontal: 16),
              child: SizedBox(
                width: containerWidth,
                child: Card(
                  elevation: 5,
                  surfaceTintColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: Form(
                          key: _signUpFormKey,
                          child: Column(
                            children: [
                              _buildTextFormField(
                                controller: _nameController,
                                label: 'Name',
                                validatorMsg: 'Please enter your name',
                              ),
                              _buildTextFormField(
                                controller: _outlookIDController,
                                label: 'Outlook Id',
                                validatorMsg: 'Please confirm your email',
                              ),
                              _buildTextFormField(
                                controller: _cgpaController,
                                label: 'CGPA',
                                validatorMsg: 'must be >=8.5',
                                isNumeric: true,
                              ),
                              DropDownTextField(
                                textFieldDecoration:
                                    const InputDecoration(labelText: "Select Class"),
                                controller: _cnt,
                                clearOption: true,
                                searchDecoration:
                                    const InputDecoration(hintText: "Class"),
                                validator: (value) {
                                  if (value == null) {
                                    return "Required field";
                                  }
                                  return null;
                                },
                                dropDownItemCount: 6,
                                dropDownList: const [
                                  DropDownValueModel(name: 'IT-6E', value: "value1"),
                                  DropDownValueModel(name: 'IT-6A', value: "IT-6B"),
                                  DropDownValueModel(name: 'IT-6C', value: "value5"),
                                  DropDownValueModel(name: 'IT-6D', value: "value6"),
                                ],
                                onChanged: (val) {},
                              ),
                              _buildTextFormField(
                                controller: _mobileNumberController,
                                label: 'Mobile Number',
                                validatorMsg: 'Please write the correct number',
                                isNumeric: true,
                                maxLength: 10,
                              ),
                              _buildTextFormField(
                                controller: _createPasswordController,
                                label: 'Create Password',
                                validatorMsg: 'Please enter at least 8 characters',
                                isPassword: true,
                              ),
                              _buildTextFormField(
                                controller: _confirmPasswordController,
                                label: 'Confirm Password',
                                validatorMsg: 'Please enter correct password',
                                isPassword: true,
                              ),
                              CheckboxListTile(
                                value: _acceptTermsAndConditions,
                                onChanged: (value) {
                                  setState(() {
                                    _acceptTermsAndConditions = value!;
                                  });
                                },
                                title: const Text(
                                    'I accept the Terms and Conditions'),
                                controlAffinity: ListTileControlAffinity.leading,
                                activeColor: const Color(0xffE76239),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (_signUpFormKey.currentState!.validate()) {
                                    // Perform sign-up logic here
                                  }
                                },
                                child: const Text('Sign Up'),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Already have an account?'),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CandidatureLoginScreen()));
                                    },
                                    child: const Text('Login'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Reusable text field builder for easy customization and consistency
  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    required String validatorMsg,
    bool isPassword = false,
    bool isNumeric = false,
    int? maxLength,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      validator: (value) {
        if (value == null || value.isEmpty) return validatorMsg;
        return null;
      },
      keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
      obscureText: isPassword,
      maxLength: maxLength,
    );
  }
}
