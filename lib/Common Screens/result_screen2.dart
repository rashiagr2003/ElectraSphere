import 'package:flutter/material.dart';

import 'pie_chart_widget.dart';

// ignore: must_be_immutable
class ResultsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> crList;

  ResultsScreen({super.key, required this.crList});

  @override
  Widget build(BuildContext context) {
    List<CR> crData = _createCRData(crList);

    return Scaffold(
      appBar: AppBar(
        leading: const Image(image: AssetImage("assets/manipal_logo.png")),
        title: const Text('CR Elections Results'),
      ),
      body: Column(
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
          Expanded(
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
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              'WINNER:  ${_getWinner(crData)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
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

class CR {
  final String name;
  final int votes;

  CR(this.name, this.votes);
}
