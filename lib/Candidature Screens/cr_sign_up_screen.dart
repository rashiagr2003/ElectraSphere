import 'package:electra_sphere/Candidature%20Screens/claim_screen.dart';
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
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  late SingleValueDropDownController _cnt;
  late MultiValueDropDownController _cntMulti;
  bool _acceptTermsAndConditions = false;

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
    return Scaffold(
        backgroundColor: Color(0xffE76239),
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.85,
                child: Card(
                    surfaceTintColor: Colors.white,
                    elevation: 5,
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
                                TextFormField(
                                  controller: _nameController,
                                  decoration:
                                      const InputDecoration(labelText: 'Name'),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: _outlookIDController,
                                  decoration: const InputDecoration(
                                      labelText: 'Outlook Id'),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please confirm your email';
                                    }

                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: _cgpaController,
                                  decoration:
                                      const InputDecoration(labelText: 'CGPA'),
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        double.parse(_cgpaController.text) <
                                            8.5) {
                                      return 'must be >=8.5';
                                    }

                                    return null;
                                  },
                                ),
                                DropDownTextField(
                                  textFieldDecoration: InputDecoration(
                                      labelText: "Select Class"),
                                  controller: _cnt,
                                  clearOption: true,
                                  searchDecoration:
                                      const InputDecoration(hintText: "Class"),
                                  validator: (value) {
                                    if (value == null) {
                                      return "Required field";
                                    } else {
                                      return null;
                                    }
                                  },
                                  dropDownItemCount: 6,
                                  dropDownList: const [
                                    DropDownValueModel(
                                        name: 'IT-6E', value: "value1"),
                                    DropDownValueModel(
                                        name: 'IT-6A',
                                        value: "IT-6B",
                                        toolTipMsg:
                                            "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                                    DropDownValueModel(
                                        name: 'IT-6C', value: "value5"),
                                    DropDownValueModel(
                                        name: 'IT-6D', value: "value6"),
                                  ],
                                  onChanged: (val) {},
                                ),
                                TextFormField(
                                  controller: _mobileNumberController,
                                  decoration: const InputDecoration(
                                      labelText: 'Mobile Number'),
                                  validator: (value) {
                                    if (value == null ||
                                        _mobileNumberController.text.length !=
                                            10 ||
                                        value.isEmpty) {
                                      return 'Please write the correct number';
                                    }

                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: _createPasswordController,
                                  decoration: const InputDecoration(
                                      labelText: 'Create Password'),
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        double.parse(_createPasswordController
                                                .text) <
                                            8) {
                                      return 'Please enter at least 8 characters';
                                    }

                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: _confirmPasswordController,
                                  decoration: const InputDecoration(
                                      labelText: 'Confirm Password'),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter correct password';
                                    }

                                    return null;
                                  },
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: CheckboxListTile(
                                    value: _acceptTermsAndConditions,
                                    onChanged: (value) {
                                      setState(() {
                                        _acceptTermsAndConditions = value!;
                                      });
                                    },
                                    title: const Text(
                                        'I accept the Terms and Conditions'),
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    activeColor: const Color(0xffE76239),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ClaimScreen()));
                                    if (_signUpFormKey.currentState!
                                        .validate()) {}
                                  },
                                  child: Text('SignUp'),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Already have an account?'),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    CandidatureLoginScreen())));
                                      },
                                      child: Text('Login'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )))));
  }
}
