import 'package:flutter/material.dart';

import '../../constants/shared_pref.dart';

class ChooseCRWidget extends StatefulWidget {
  final Function(Set<String>) onSelectionChanged;
  final Set<String> selectedCR;

  const ChooseCRWidget({
    super.key,
    required this.onSelectionChanged,
    required this.selectedCR,
  });

  @override
  State<ChooseCRWidget> createState() => _ChooseCRWidgetState();
}

class _ChooseCRWidgetState extends State<ChooseCRWidget> {
  late List<String> _classRepresentative;
  late List<String> _promises;

  @override
  void initState() {
    super.initState();
    loadDataFromSharedPrefs();
  }

  void loadDataFromSharedPrefs() {
    // Get the stored names and promises as comma-separated strings
    String namesString =
        SharedPreferencesUtil.getString('names', defaultValue: 'Naman,Dhakad');
    String promisesString = SharedPreferencesUtil.getString('promises',
        defaultValue: 'I will give my best.,I will try to maintain discipline');

    // Convert them to lists
    _classRepresentative = namesString.split(',');
    _promises = promisesString.split(',');

    // Ensure both lists have the same length
    if (_promises.length < _classRepresentative.length) {
      int diff = _classRepresentative.length - _promises.length;
      for (int i = 0; i < diff; i++) {
        _promises.add("No promises available");
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _classRepresentative.length,
      itemBuilder: (context, index) {
        String crName = _classRepresentative[index];
        bool isSelected = widget.selectedCR.contains(crName);

        return GestureDetector(
          onTap: () {
            setState(() {
              if (isSelected) {
                widget.selectedCR.remove(crName);
              } else {
                widget.selectedCR.add(crName);
              }
              widget.onSelectionChanged(widget.selectedCR);
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue[100] : Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
              border: Border.all(
                color: isSelected ? Colors.blue : Colors.grey[300]!,
                width: 2,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: isSelected,
                      onChanged: (value) {
                        setState(() {
                          if (value!) {
                            widget.selectedCR.add(crName);
                          } else {
                            widget.selectedCR.remove(crName);
                          }
                          widget.onSelectionChanged(widget.selectedCR);
                        });
                      },
                    ),
                    Text(
                      crName,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _promises[index],
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
