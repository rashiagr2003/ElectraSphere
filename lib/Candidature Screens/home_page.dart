import 'package:flutter/material.dart';
import '../Common Screens/notification_page.dart';
import '../Common Screens/result_screen1.dart';
import '../constants/shared_pref.dart' show SharedPreferencesUtil;

class CandidatureHomePage extends StatefulWidget {
  final String name;
  final String promises;
  CandidatureHomePage({
    super.key,
    required this.name,
    required this.promises,
  });

  @override
  State<CandidatureHomePage> createState() => _CandidatureHomePageState();
}

class _CandidatureHomePageState extends State<CandidatureHomePage> {
  static final List<Map<String, dynamic>> crList = [];

  late List<CR> crData;

  @override
  void initState() {
    super.initState();
    crData = _createCRData(crList);
    SharedPreferencesUtil.setString('name', widget.name);
    SharedPreferencesUtil.setString('promises', widget.promises);
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
                    // Display name passed from previous screen
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(constraints.maxWidth * 0.04),
                      margin:
                          EdgeInsets.only(bottom: constraints.maxHeight * 0.02),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' ${widget.name}',
                            style: TextStyle(
                              fontSize: constraints.maxWidth * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: constraints.maxHeight * 0.01),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                vertical: constraints.maxHeight * 0.01,
                                horizontal: constraints.maxWidth * 0.03),
                            decoration: BoxDecoration(
                              color: const Color(0xffEEEEEE),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Promises:',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: constraints.maxHeight * 0.01),
                                Text(
                                  widget.promises,
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
                    Expanded(
                      child: ListView.builder(
                        itemCount: crData.length,
                        itemBuilder: (context, index) {
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
                                    // Candidate Name and Vote Percentage
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          crData[index].name,
                                          style: TextStyle(
                                            fontSize:
                                                constraints.maxWidth * 0.05,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '${crData[index].votes}% votes',
                                          style: TextStyle(
                                            fontSize:
                                                constraints.maxWidth * 0.045,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                        height: constraints.maxHeight * 0.01),

                                    // Progress Bar
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: LinearProgressIndicator(
                                        value: crData[index].votes / 100,
                                        minHeight: 8,
                                        backgroundColor: Colors.grey[300],
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.orange),
                                      ),
                                    ),

                                    SizedBox(
                                        height: constraints.maxHeight * 0.02),

                                    // Promises Section
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
                                      child: const Text(
                                        'Promises',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
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

  CR(this.name, this.votes);
}

List<CR> _createCRData(List<Map<String, dynamic>> crList) {
  return crList.map((cr) => CR(cr['name'], cr['votes'])).toList();
}
