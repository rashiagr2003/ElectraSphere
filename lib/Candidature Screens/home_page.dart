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
    List<CR> crData = _createCRData(crList);
    // ...

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
                          builder: (context) => const NotificationsScreen()));
                },
                icon: const Icon(Icons.notifications))
          ],
        ),
        drawer: const DrawerPage(),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ResultScreen1()))),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: SizedBox(
                                          height: 50,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 6,
                                                      horizontal: 10),
                                                  color:
                                                      const Color(0xffE76239),
                                                  child: const Text('Class')),
                                              Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 6,
                                                      horizontal: 10),
                                                  color:
                                                      const Color(0xffE76239),
                                                  child: const Text('Sec')),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16, horizontal: 8),
                                        child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemCount: 3,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 17),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                          'C.R. ${index + 1} '),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                                '${crData[index].votes} % votes'),
                                                            Text(
                                                                '[Number of votes]'),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height: 60,
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 6,
                                                          horizontal: 10),
                                                      color: const Color(
                                                          0xffEEEEEE),
                                                      child: const Text(
                                                        'Promises',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 24),
                                                      )),
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
                              ))),
                    ),
                  ],
                ))));
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
