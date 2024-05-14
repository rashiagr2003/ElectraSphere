import 'package:electra_sphere/Common%20Screens/result_screen1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Common Screens/notification_page.dart';
import '../Voter screens/widgets/drawer_page.dart';

class CandidatureHomePage extends StatefulWidget {
  const CandidatureHomePage({super.key});

  @override
  State<CandidatureHomePage> createState() => _CandidatureHomePageState();
}

class _CandidatureHomePageState extends State<CandidatureHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE76239),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Center(child: Text('Home')),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationsScreen()));
                },
                icon: const Icon(Icons.notifications))
          ],
        ),
        drawer: DrawerPage(),
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
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 6,
                                                      horizontal: 10),
                                                  color: Color(0xffE76239),
                                                  child: Text('Class')),
                                              Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 6,
                                                      horizontal: 10),
                                                  color: Color(0xffE76239),
                                                  child: Text('Sec')),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16, horizontal: 8),
                                        child: ListView.builder(
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
                                                        child: const Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text('45% votes'),
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
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 6,
                                                              horizontal: 10),
                                                      color: Color(0xffEEEEEE),
                                                      child: Text(
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
