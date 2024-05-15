// home_page.dart
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'dart:math' as math;

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PieChartWidgetState createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  // ...

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        if (constraints.maxWidth >= 600) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: _buildChart(),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: _buildSettings(),
              )
            ],
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 32),
                  child: _buildChart(),
                ),
                _buildSettings(),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildChart() {
    return PieChart(
      dataMap: const {
        "CR1": 17,
        "CR2": 18,
        "CR3": 20,
      },
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 32,
      chartRadius: math.min(MediaQuery.of(context).size.width / 3.2, 300),
      colorList: const [
        const Color(0xff000000),
        const Color(0xffEEEEEE),
        const Color(0xffE76239),
      ],
      // ...
    );
  }

  Widget _buildSettings() {
    return const Card(
      margin: EdgeInsets.all(12),
      child: Column(
        children: [
          // ...
        ],
      ),
    );
  }
}

class PieChartWidget2 extends StatelessWidget {
  const PieChartWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pie Chart 1"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: PieChart(
          dataMap: const {"Flutter": 5},
          chartType: ChartType.ring,
          baseChartColor: Colors.grey[50]!.withOpacity(0.15),
          colorList: const [Colors.greenAccent],
          chartValuesOptions: const ChartValuesOptions(
            showChartValuesInPercentage: true,
          ),
          totalValue: 20,
        ),
      ),
    );
  }
}
