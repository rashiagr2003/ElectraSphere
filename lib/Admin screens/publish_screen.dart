import 'package:flutter/material.dart';

import '../Common Screens/pie_chart_widget.dart';

// ignore: must_be_immutable
class ResultsPublishScreen extends StatelessWidget {
  final List<Map<String, dynamic>> crList;

  ResultsPublishScreen({super.key, required this.crList});

  @override
  Widget build(BuildContext context) {
    List<CR> crData = _createCRData(crList);

    return Scaffold(
      appBar: AppBar(
        leading: const Image(image: AssetImage("assets/manipal_logo.png")),
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 10),
                        color: const Color(0xffE76239),
                        child: const Text('Class')),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 10),
                        color: const Color(0xffE76239),
                        child: const Text('Sec')),
                  ],
                ),
              ),
            ),
            const PieChartWidget(),
            const Text(
              'Total Students: 65\nTotal Votes: 55',
              style: TextStyle(fontSize: 16),
            ),
            listview_buider(crData: crData),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 60,
              color: const Color(0xffE76239),
              child: Center(
                child: Text(
                  'PUBLISH RESULT',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
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

class listview_buider extends StatelessWidget {
  const listview_buider({
    super.key,
    required this.crData,
  });

  final List<CR> crData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Expanded(
        child: ListView.builder(
          itemCount: crData.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${crData[index].name}'),
                  Column(
                    children: [
                      Text('${crData[index].votes}%'),
                      Text('[Number of votes]'),
                    ],
                  )
                ],
              ),
            );
          },
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
