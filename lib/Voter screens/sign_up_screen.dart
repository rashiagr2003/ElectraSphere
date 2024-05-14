import 'package:electra_sphere/Voter%20screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

class VoterSignUpScreen extends StatefulWidget {
  @override
  _VoterSignUpScreenState createState() => _VoterSignUpScreenState();
}

class _VoterSignUpScreenState extends State<VoterSignUpScreen> {
  // late String _selectedClass;
  final _nameController = TextEditingController();
  final _outlookIDController = TextEditingController();
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
                          child: Column(
                            children: [
                              TextField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                  labelText: 'Name',
                                ),
                              ),
                              TextField(
                                controller: _outlookIDController,
                                decoration: InputDecoration(
                                  labelText: 'Outlook ID',
                                ),
                              ),
                              DropDownTextField(
                                textFieldDecoration:
                                    InputDecoration(labelText: "Select Class"),
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
                              TextField(
                                controller: _mobileNumberController,
                                decoration: InputDecoration(
                                  labelText: 'Mobile No.',
                                ),
                                keyboardType: TextInputType.phone,
                              ),
                              TextField(
                                controller: _createPasswordController,
                                decoration: InputDecoration(
                                  labelText: 'Create Password',
                                ),
                                obscureText: true,
                              ),
                              TextField(
                                controller: _confirmPasswordController,
                                decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                ),
                                obscureText: true,
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
                                onPressed: () {},
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
                                                  LoginScreen())));
                                    },
                                    child: Text('Login'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )))));
  }
}
