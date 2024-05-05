import 'package:flutter/material.dart';

class ChooseCRWidget extends StatefulWidget {
  const ChooseCRWidget({super.key});

  @override
  State<ChooseCRWidget> createState() => _ChooseCRWidgetState();
}

class _ChooseCRWidgetState extends State<ChooseCRWidget> {
  List<String> _classRepresentative = ['Naman', 'Dhakad'];
  List<String> _promises = [
    'I will give my best ',
    'Try to maintain discipline'
  ];
  List<String> _selectedCR = [];
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: _classRepresentative.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  CheckboxListTile(
                      title: Text(_classRepresentative[index]),
                      value: _selectedCR.contains(_classRepresentative[index]),
                      onChanged: (value) {
                        setState(() {
                          if (value!) {
                            _selectedCR.add(_classRepresentative[index]);
                          } else {
                            _selectedCR.remove(_classRepresentative[index]);
                          }
                        });
                      }),
                  Container(
                    padding: EdgeInsets.all(4),
                    color: Colors.black26,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Center(
                      child: Text(
                        _promises[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              );
            }));
  }
}
