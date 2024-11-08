// home_page.dart
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'dart:math' as math;

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({super.key});

  @override
  _PieChartWidgetState createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        double width = constraints.maxWidth;

        // Define a factor based on screen width for scaling
        double chartRadiusFactor = width > 600
            ? 0.3
            : 0.4; // For larger screens, reduce the chart size
        double cardMargin =
            width > 600 ? 12.0 : 8.0; // Adjust margin for smaller screens

        if (width >= 600) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: _buildChart(chartRadiusFactor),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: _buildSettings(cardMargin),
              ),
            ],
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 32),
                  child: _buildChart(chartRadiusFactor),
                ),
                _buildSettings(cardMargin),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildChart(double chartRadiusFactor) {
    return PieChart(
      dataMap: const {
        "CR1": 17,
        "CR2": 18,
        "CR3": 20,
      },
      animationDuration: const Duration(milliseconds: 800),
      chartLegendSpacing: 32,
      chartRadius:
          math.min(MediaQuery.of(context).size.width * chartRadiusFactor, 300),
      colorList: const [
        Color(0xff000000),
        Color(0xffEEEEEE),
        Color(0xffE76239),
      ],
    );
  }

  Widget _buildSettings(double cardMargin) {
    return Card(
      margin: EdgeInsets.all(cardMargin),
      child: Column(
        children: const [
          // Add other settings UI elements as needed
        ],
      ),
    );
  }
}

class PieChartWidget2 extends StatelessWidget {
  const PieChartWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Use a factor to scale the chart based on screen width
    double chartRadiusFactor =
        screenWidth > 600 ? 0.25 : 0.35; // Adjust for small/large screens

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pie Chart 1"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04), // Add some dynamic padding
        child: PieChart(
          dataMap: const {"Flutter": 5},
          chartType: ChartType.ring,
          baseChartColor: Colors.grey[50]!.withOpacity(0.15),
          colorList: const [Colors.greenAccent],
          chartValuesOptions: const ChartValuesOptions(
            showChartValuesInPercentage: true,
          ),
          totalValue: 20,
          chartRadius: math.min(screenWidth * chartRadiusFactor,
              250), // Ensure the chart size is appropriate
        ),
      ),
    );
  }
}
