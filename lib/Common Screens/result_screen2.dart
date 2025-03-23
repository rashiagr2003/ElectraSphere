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
          width: screenWidth * 0.1,
        ),
        title: Text(
          'CR Elections Results',
          style: TextStyle(fontSize: screenWidth * 0.05),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.015, horizontal: screenWidth * 0.04),
            child: SizedBox(
              height: screenHeight * 0.06,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.01,
                        horizontal: screenWidth * 0.04),
                    color: const Color(0xffE76239),
                    child: const Text('IT'),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.01,
                        horizontal: screenWidth * 0.04),
                    color: const Color(0xffE76239),
                    child: const Text('A'),
                  ),
                ],
              ),
            ),
          ),

          // Responsive pie chart that uses actual data
          ResponsiveInteractivePieChart(crData: crData),

          // Total students and votes section
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Text(
              'Total Students: 65\nTotal Votes: ${_getTotalVotes(crData)}',
              style: TextStyle(fontSize: screenWidth * 0.045),
            ),
          ),

          // Results list
          Expanded(
            child: ListView.builder(
              itemCount: crData.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(screenWidth * 0.03),
                  margin: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.01,
                    horizontal: screenWidth * 0.03,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: const Color(0xffE76239), width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${crData[index].name}',
                          style: TextStyle(fontSize: screenWidth * 0.045)),
                      Column(
                        children: [
                          Text(
                              '${_calculatePercentage(crData[index].votes, _getTotalVotes(crData))}%',
                              style: TextStyle(fontSize: screenWidth * 0.04)),
                          Text('${crData[index].votes} votes',
                              style: TextStyle(fontSize: screenWidth * 0.035)),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),

          // Winner announcement
          Container(
            padding: EdgeInsets.all(screenWidth * 0.04),
            color: const Color(0xffE76239).withOpacity(0.1),
            margin: EdgeInsets.only(bottom: screenHeight * 0.02),
            child: Text(
              'WINNER:  ${_getWinner(crData)}',
              style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xffE76239)),
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
    int maxVotes = 0;
    String winner = '';

    for (var cr in crData) {
      if (cr.votes > maxVotes) {
        maxVotes = cr.votes;
        winner = cr.name;
      }
    }

    return winner;
  }

  int _getTotalVotes(List<CR> crData) {
    int total = 0;
    for (var cr in crData) {
      total += cr.votes;
    }
    return total;
  }

  int _calculatePercentage(int votes, int totalVotes) {
    if (totalVotes == 0) return 0;
    return ((votes / totalVotes) * 100).round();
  }
}

class CR {
  final String name;
  final int votes;

  CR(this.name, this.votes);
}

class ResponsiveInteractivePieChart extends StatefulWidget {
  final List<CR> crData;

  const ResponsiveInteractivePieChart({super.key, required this.crData});

  @override
  State<ResponsiveInteractivePieChart> createState() =>
      _ResponsiveInteractivePieChartState();
}

class _ResponsiveInteractivePieChartState
    extends State<ResponsiveInteractivePieChart> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    // Calculate screen dimensions for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Chart size based on screen dimensions
    double chartSize =
        screenWidth < 600 ? screenWidth * 0.8 : screenWidth * 0.5;

    // Create data map for pie chart
    Map<String, double> dataMap = {};
    for (int i = 0; i < widget.crData.length; i++) {
      dataMap[widget.crData[i].name] = widget.crData[i].votes.toDouble();
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
      height: screenHeight * 0.35,
      child: Column(
        children: [
          Text(
            'Vote Distribution',
            style: TextStyle(
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Expanded(
            child: PieChart(
              dataMap: dataMap,
              chartType: ChartType.ring,
              baseChartColor: Colors.grey[50]!.withOpacity(0.15),
              colorList: const [
                Colors.redAccent,
                Colors.blueAccent,
                Colors.greenAccent,
                Colors.orangeAccent,
                Colors.purpleAccent,
                Colors.tealAccent,
                Colors.pinkAccent,
                Colors.amberAccent,
              ],
              chartValuesOptions: ChartValuesOptions(
                showChartValuesInPercentage: true,
                chartValueStyle: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              legendOptions: LegendOptions(
                showLegends: true,
                legendPosition: screenWidth < 600
                    ? LegendPosition.bottom
                    : LegendPosition.right,
                legendTextStyle: TextStyle(fontSize: screenWidth * 0.035),
              ),
              chartRadius: chartSize,
              ringStrokeWidth: 30,
              animationDuration: const Duration(milliseconds: 800),
              chartLegendSpacing: 32,
              initialAngleInDegree: 0,
              centerText: selectedIndex != null
                  ? "${widget.crData[selectedIndex!].name}\n${widget.crData[selectedIndex!].votes} votes"
                  : "",
              centerTextStyle: TextStyle(
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.bold,
              ),
              totalValue:
                  widget.crData.fold(0, (sum, cr) => sum + cr.votes).toDouble(),
            ),
          ),
        ],
      ),
    );
  }
}
