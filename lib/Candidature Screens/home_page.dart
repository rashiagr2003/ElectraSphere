import 'package:flutter/material.dart';
import '../Common Screens/notification_page.dart';
import '../Common Screens/result_screen1.dart';
import '../constants/shared_pref.dart';

class CandidatureHomePage extends StatefulWidget {
  final String name;
  final String promises;
  final bool hasVoted; // New property to track if user has voted

  CandidatureHomePage({
    super.key,
    required this.name,
    required this.promises,
    this.hasVoted = false, // Default to false
  });

  @override
  State<CandidatureHomePage> createState() => _CandidatureHomePageState();
}

class _CandidatureHomePageState extends State<CandidatureHomePage> {
  late List<CR> crData = [];
  late List<String> _candidateNames = [];
  late List<String> _candidatePromises = [];

  @override
  void initState() {
    super.initState();

    // Save current candidate data to SharedPreferences
    SharedPreferencesUtil.setString('name', widget.name);
    SharedPreferencesUtil.setString('promises', widget.promises);

    // Also save voting status
    SharedPreferencesUtil.setBool('hasVoted', widget.hasVoted);

    // Load data from SharedPreferences
    loadDataFromSharedPrefs();
  }

  void loadDataFromSharedPrefs() {
    // Get the stored names and promises as comma-separated strings
    String namesString =
        SharedPreferencesUtil.getString('name', defaultValue: widget.name);
    String promisesString = SharedPreferencesUtil.getString('promises',
        defaultValue: widget.promises);
    bool hasVoted = SharedPreferencesUtil.getBool('hasVoted',
        defaultValue: widget.hasVoted);

    // Convert them to lists
    _candidateNames = namesString.split(',');
    _candidatePromises = promisesString.split(',');

    // Ensure both lists have the same length
    if (_candidatePromises.length < _candidateNames.length) {
      int diff = _candidateNames.length - _candidatePromises.length;
      for (int i = 0; i < diff; i++) {
        _candidatePromises.add("No promises available");
      }
    }

    // Create CR objects with vote percentages only if user has voted
    crData = List.generate(_candidateNames.length, (index) {
      int votePercentage = hasVoted ? (10 + (index * 20) % 80) : 0;
      return CR(
          _candidateNames[index], votePercentage, _candidatePromises[index]);
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Text(''),
        backgroundColor: Colors.white,
        title: const Center(child: Text('Home')),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationsScreen()),
              );
            },
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.orange,
                  Color(0xffE76239),
                  Colors.orange, // End Color
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: constraints.maxHeight * 0.02,
                  horizontal: constraints.maxWidth * 0.05),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Display current candidate info

                    // Header for all candidates
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(constraints.maxWidth * 0.03),
                      margin:
                          EdgeInsets.only(bottom: constraints.maxHeight * 0.01),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'All Candidates',
                        style: TextStyle(
                          fontSize: constraints.maxWidth * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    // List of all candidates
                    Expanded(
                      child: ListView.builder(
                        itemCount: crData.length,
                        itemBuilder: (context, index) {
                          final candidate = crData[index];
                          final bool isVotingComplete =
                              SharedPreferencesUtil.getBool('hasVoted',
                                  defaultValue: false);

                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            margin: EdgeInsets.only(
                                bottom: constraints.maxHeight * 0.02),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResultScreen1()),
                                );
                              },
                              child: Padding(
                                padding:
                                    EdgeInsets.all(constraints.maxWidth * 0.04),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Candidate Name
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          candidate.name,
                                          style: TextStyle(
                                            fontSize:
                                                constraints.maxWidth * 0.05,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        // Only show vote percentage if voting is complete
                                        if (isVotingComplete)
                                          Text(
                                            '${candidate.votes}% votes',
                                            style: TextStyle(
                                              fontSize:
                                                  constraints.maxWidth * 0.045,
                                              color: Colors.black54,
                                            ),
                                          ),
                                      ],
                                    ),

                                    // Only show progress bar if voting is complete
                                    if (isVotingComplete) ...[
                                      SizedBox(
                                          height: constraints.maxHeight * 0.01),
                                      // Progress Bar
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: LinearProgressIndicator(
                                          value: candidate.votes / 100,
                                          minHeight: 8,
                                          backgroundColor: Colors.grey[300],
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.orange),
                                        ),
                                      ),
                                    ],

                                    SizedBox(
                                        height: constraints.maxHeight * 0.02),

                                    // Promises Section - Single container for promises
                                    Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(
                                          vertical:
                                              constraints.maxHeight * 0.01,
                                          horizontal:
                                              constraints.maxWidth * 0.03),
                                      decoration: BoxDecoration(
                                        color: const Color(0xffEEEEEE),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Promises:',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(
                                              height:
                                                  constraints.maxHeight * 0.01),
                                          Text(
                                            candidate.promises,
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CR {
  final String name;
  final int votes;
  final String promises;

  CR(this.name, this.votes, this.promises);
}
