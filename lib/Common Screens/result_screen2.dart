import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class ResultsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> crList;

  ResultsScreen({super.key, required this.crList});

  @override
  Widget build(BuildContext context) {
    List<CR> crData = _createCRData(crList);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "assets/manipal_logo.png",
          width: screenWidth * 0.1, // Adjust logo size dynamically
        ),
        title: Text(
          'CR Elections Results',
          style: TextStyle(fontSize: screenWidth * 0.05), // Adjust title size
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.015, horizontal: screenWidth * 0.04),
            child: SizedBox(
              height: screenHeight * 0.06, // Adjust row height
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.01,
                        horizontal: screenWidth * 0.04),
                    color: const Color(0xffE76239),
                    child: const Text('Class'),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.01,
                        horizontal: screenWidth * 0.04),
                    color: const Color(0xffE76239),
                    child: const Text('Sec'),
                  ),
                ],
              ),
            ),
          ),
          const PieChartWidget(),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Text(
              'Total Students: 65\nTotal Votes: 55',
              style:
                  TextStyle(fontSize: screenWidth * 0.045), // Adjust font size
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: crData.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(screenWidth * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${crData[index].name}',
                          style: TextStyle(fontSize: screenWidth * 0.045)),
                      Column(
                        children: [
                          Text('${crData[index].votes}%',
                              style: TextStyle(fontSize: screenWidth * 0.04)),
                          Text('[Number of votes]',
                              style: TextStyle(fontSize: screenWidth * 0.035)),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Text(
              'WINNER:  ${_getWinner(crData)}',
              style: TextStyle(
                  fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
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

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: const {
        "CR1": 17,
        "CR2": 18,
        "CR3": 20,
      },
      chartType: ChartType.ring,
      baseChartColor: Colors.grey[50]!.withOpacity(0.15),
      colorList: const [Colors.blue, Colors.green, Colors.red],
      chartValuesOptions: const ChartValuesOptions(
        showChartValuesInPercentage: true,
      ),
      totalValue: 100,
    );
  }
}
