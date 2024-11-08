import 'package:electra_sphere/Voter%20screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

class VoterSignUpScreen extends StatefulWidget {
  const VoterSignUpScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VoterSignUpScreenState createState() => _VoterSignUpScreenState();
}

class _VoterSignUpScreenState extends State<VoterSignUpScreen> {
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
    // Get screen width and height for responsive design
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffE76239),
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.02, // Adjust vertical padding
          horizontal: screenWidth * 0.05, // Adjust horizontal padding
        ),
        child: SizedBox(
          height: screenHeight * 0.85, // Adjust height relative to screen size
          child: Card(
            surfaceTintColor: Colors.white,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02, // Adjust vertical padding
                    horizontal: screenWidth * 0.05, // Adjust horizontal padding
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                        ),
                      ),
                      TextField(
                        controller: _outlookIDController,
                        decoration: const InputDecoration(
                          labelText: 'Outlook ID',
                        ),
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
                          } else {
                            return null;
                          }
                        },
                        dropDownItemCount: 6,
                        dropDownList: const [
                          DropDownValueModel(name: 'IT-6E', value: "value1"),
                          DropDownValueModel(
                              name: 'IT-6A',
                              value: "IT-6B",
                              toolTipMsg:
                                  "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                          DropDownValueModel(name: 'IT-6C', value: "value5"),
                          DropDownValueModel(name: 'IT-6D', value: "value6"),
                        ],
                        onChanged: (val) {},
                      ),
                      TextField(
                        controller: _mobileNumberController,
                        decoration: const InputDecoration(
                          labelText: 'Mobile No.',
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                      TextField(
                        controller: _createPasswordController,
                        decoration: const InputDecoration(
                          labelText: 'Create Password',
                        ),
                        obscureText: true,
                      ),
                      TextField(
                        controller: _confirmPasswordController,
                        decoration: const InputDecoration(
                          labelText: 'Confirm Password',
                        ),
                        obscureText: true,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical:
                                screenHeight * 0.02), // Adjust vertical padding
                        child: CheckboxListTile(
                          value: _acceptTermsAndConditions,
                          onChanged: (value) {
                            setState(() {
                              _acceptTermsAndConditions = value!;
                            });
                          },
                          title:
                              const Text('I accept the Terms and Conditions'),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: const Color(0xffE76239),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('SignUp'),
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
                                  builder: (context) => VoterLoginScreen(),
                                ),
                              );
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
    );
  }
}
