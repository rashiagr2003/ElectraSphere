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
  List<Map<String, String>> _candidates = [];

  @override
  void initState() {
    super.initState();
    _loadCandidatesFromPrefs();
  }

  Future<void> _loadCandidatesFromPrefs() async {
    // Get candidate data from SharedPreferences
    String? namesString = SharedPreferencesUtil.getString('name');
    String? promisesString = SharedPreferencesUtil.getString('promises');

    if (namesString != null && promisesString != null) {
      // Split the strings into lists
      List<String> names = namesString.split(',');
      List<String> promises = promisesString.split(',');

      // Create candidate maps
      List<Map<String, String>> loadedCandidates = [];
      for (int i = 0; i < names.length && i < promises.length; i++) {
        loadedCandidates.add({
          "name": names[i],
          "promises": promises[i],
        });
      }

      // Update state
      setState(() {
        _candidates = loadedCandidates;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_candidates.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return ListView.builder(
      itemCount: _candidates.length,
      itemBuilder: (context, index) {
        String crName = _candidates[index]["name"]!;
        String promise = _candidates[index]["promises"]!;
        bool isSelected = widget.selectedCR.contains(crName);

        return GestureDetector(
          onTap: () {
            setState(() {
              // Toggle selection
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
                    promise,
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
