import 'package:flutter/material.dart';

import '../Common Screens/pie_chart_widget.dart';

// ignore: must_be_immutable
class ResultsPublishScreen extends StatelessWidget {
  final List<Map<String, dynamic>> crList;

  const ResultsPublishScreen({super.key, required this.crList});

  @override
  Widget build(BuildContext context) {
    List<CR> crData = _createCRData(crList);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: const Image(image: AssetImage("assets/manipal_logo.png")),
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: screenWidth * 0.04, horizontal: screenWidth * 0.04),
              child: SizedBox(
                height: screenWidth * 0.13,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(
                            vertical: screenWidth * 0.02,
                            horizontal: screenWidth * 0.03),
                        color: const Color(0xffE76239),
                        child: const Text('Class')),
                    Container(
                        padding: EdgeInsets.symmetric(
                            vertical: screenWidth * 0.02,
                            horizontal: screenWidth * 0.03),
                        color: const Color(0xffE76239),
                        child: const Text('Sec')),
                  ],
                ),
              ),
            ),
            const PieChartWidget(),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.02),
              child: const Text(
                'Total Students: 65\nTotal Votes: 55',
                style: TextStyle(fontSize: 16),
              ),
            ),
            ListViewBuilder(crData: crData),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: screenWidth * 0.03, horizontal: screenWidth * 0.04),
              width: screenWidth * 0.8,
              height: screenWidth * 0.15,
              color: const Color(0xffE76239),
              child: const Center(
                child: Text(
                  'PUBLISH RESULT',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<CR> _createCRData(List<Map<String, dynamic>> crList) {
    List<CR> crData = [];
    for (var cr in crList) {
      crData.add(CR(cr['name'], cr['votes']));
    }
    return crData;
  }

  String _getWinner(List<CR> crData) {
    double maxVotes = 0;
    String winner = '';
    for (var cr in crData) {
      if (cr.votes.toDouble() > maxVotes) {
        maxVotes = cr.votes.toDouble();
        winner = cr.name;
      }
    }
    return winner;
  }
}

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({
    super.key,
    required this.crData,
  });

  final List<CR> crData;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.3,
      child: ListView.builder(
        itemCount: crData.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(screenHeight * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: Text('${crData[index].name}')),
                Column(
                  children: [
                    Text('${crData[index].votes}%'),
                    const Text('[Number of votes]'),
                  ],
                )
              ],
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
