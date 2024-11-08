import 'package:electra_sphere/Common%20Screens/result_screen1.dart';
import 'package:flutter/material.dart';
import '../Common Screens/notification_page.dart';
import '../Voter screens/widgets/drawer_page.dart';

class CandidatureHomePage extends StatefulWidget {
  const CandidatureHomePage({super.key});

  @override
  State<CandidatureHomePage> createState() => _CandidatureHomePageState();
}

class _CandidatureHomePageState extends State<CandidatureHomePage> {
  static final List<Map<String, dynamic>> crList = [
    {'name': 'C.R. 1', 'votes': 45},
    {'name': 'C.R. 2', 'votes': 60},
    {'name': 'C.R. 3', 'votes': 50},
  ];

  late List<CR> crData;

  @override
  void initState() {
    super.initState();
    crData = _createCRData(crList);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xffE76239),
      appBar: AppBar(
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
      drawer: const DrawerPage(),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.01, horizontal: screenWidth * 0.04),
        child: SizedBox(
          height: screenHeight * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: ((context) => ResultScreen1())),
                ),
                child: Card(
                  surfaceTintColor: Colors.white,
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.02),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02,
                          horizontal: screenWidth * 0.04,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.02),
                              child: SizedBox(
                                height: screenHeight * 0.07,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: screenHeight * 0.008,
                                        horizontal: screenWidth * 0.025,
                                      ),
                                      color: const Color(0xffE76239),
                                      child: const Text('Class'),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: screenHeight * 0.008,
                                        horizontal: screenWidth * 0.025,
                                      ),
                                      color: const Color(0xffE76239),
                                      child: const Text('Sec'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.02,
                                horizontal: screenWidth * 0.02,
                              ),
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: crData.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        bottom: screenHeight * 0.02),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              crData[index].name,
                                              style: TextStyle(
                                                fontSize: screenHeight * 0.02,
                                              ),
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.5,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    '${crData[index].votes} % votes',
                                                    style: TextStyle(
                                                        fontSize: screenHeight *
                                                            0.018),
                                                  ),
                                                  Text(
                                                    '[Number of votes]',
                                                    style: TextStyle(
                                                        fontSize: screenHeight *
                                                            0.016),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: screenWidth,
                                          height: screenHeight * 0.08,
                                          padding: EdgeInsets.symmetric(
                                            vertical: screenHeight * 0.008,
                                            horizontal: screenWidth * 0.025,
                                          ),
                                          color: const Color(0xffEEEEEE),
                                          child: const Text(
                                            'Promises',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                shrinkWrap: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
  List<CR> crData = [];

  for (var cr in crList) {
    crData.add(CR(cr['name'], cr['votes']));
  }

  return crData;
}
