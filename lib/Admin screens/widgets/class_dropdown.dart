import 'dart:math';
import 'package:flutter/material.dart';

class ClassSectionSelector extends StatefulWidget {
  @override
  _ClassSectionSelectorState createState() => _ClassSectionSelectorState();
}

class _ClassSectionSelectorState extends State<ClassSectionSelector> {
  List<String> classList = ['Class 1', 'Class 2', 'Class 3'];
  List<String> sectionList = ['A', 'B', 'C'];

  String selectedClass = 'Class 1';
  String selectedSection = 'A';

  void _onClassChanged(String? newClass) {
    if (newClass != null) {
      setState(() {
        selectedClass = newClass;
        _shuffleSections();
        selectedSection = sectionList.first;
      });
    }
  }

  void _shuffleSections() {
    setState(() {
      sectionList.shuffle(Random());
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double spacing = 10.0;

    return Container(
      margin: EdgeInsets.only(bottom: spacing),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(spacing),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: width * 0.02,
                  horizontal: width * 0.03,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffE76239),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedClass,
                    items: classList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                    onChanged: _onClassChanged,
                    dropdownColor: const Color(0xffE76239),
                    icon:
                        const Icon(Icons.arrow_drop_down, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(width: spacing),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: width * 0.02,
                  horizontal: width * 0.03,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffE76239),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedSection,
                    items: sectionList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedSection = newValue!;
                      });
                    },
                    dropdownColor: const Color(0xffE76239),
                    icon:
                        const Icon(Icons.arrow_drop_down, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
