import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ResultsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> crList;

  ResultsScreen({required this.crList});

  @override
  Widget build(BuildContext context) {
    List<CR> crData = _createCRData(crList);

    return Scaffold(
      appBar: AppBar(
        title: Text('CR Elections Results'),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            child: charts.PieChart(
              _createSeriesData(crData),
              animate: true,
              animationDuration: Duration(seconds: 5),
            ),
          ),
          Text(
            'Total Students: 65\nTotal Votes: 55',
            style: TextStyle(fontSize: 16),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: crData.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('C.R. ${crData[index].name}'),
                      Text('${crData[index].votes}%'),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'WINNER: C.R. ${_getWinner(crData)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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

  List<charts.Series<CR, String>> _createSeriesData(List<CR> crData) {
    final List<charts.Series<CR, String>> seriesData = [];

    seriesData.add(
      charts.Series(
        domainFn: (CR cr, _) => cr.name,
        measureFn: (CR cr, _) => cr.votes,
        id: 'CR Votes',
        data: crData,
        labelAccessorFn: (CR row, _) => '${row.votes}%',
      ),
    );

    return seriesData;
  }

  String _getWinner(List<CR> crData) {
    double maxVotes = 0;
    String winner = '';

    for (var cr in crData) {
      if (cr.votes > maxVotes) {
        maxVotes = cr.votes as double;
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
