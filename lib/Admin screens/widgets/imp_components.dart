import 'package:electra_sphere/Admin%20screens/widgets/class_dropdown.dart';
import 'package:flutter/material.dart';

import '../../Common Screens/pie_chart_widget.dart';

class LandscapeLayout extends StatelessWidget {
  final double width;
  final double height;
  final double spacing;
  final double bodyFontSize;
  final double titleFontSize;
  final bool isPublished;
  final String winner;
  final List<CRData> crData;

  const LandscapeLayout({
    Key? key,
    required this.width,
    required this.height,
    required this.spacing,
    required this.bodyFontSize,
    required this.titleFontSize,
    required this.isPublished,
    required this.winner,
    required this.crData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: spacing),
        child: Column(
          children: [
            SizedBox(height: spacing),
            ClassSectionSelector(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.5,
                        child: const PieChartWidget(),
                      ),
                      StatsCard(
                        width: width,
                        fontSize: bodyFontSize,
                        isPublished: isPublished,
                        winner: winner,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: spacing),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      CRList(
                        height: height * 0.5,
                        fontSize: bodyFontSize,
                        isPublished: isPublished,
                        winner: winner,
                        crData: crData,
                      ),
                      SizedBox(height: spacing),
                      PublishButton(
                          width: width * 0.45, fontSize: titleFontSize),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: spacing * 2),
          ],
        ),
      ),
    );
  }
}

class StatsCard extends StatelessWidget {
  final double width;
  final double fontSize;
  final bool isPublished;
  final String winner;

  const StatsCard({
    Key? key,
    required this.width,
    required this.fontSize,
    required this.isPublished,
    required this.winner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: width * 0.02),
      child: Padding(
        padding: EdgeInsets.all(width * 0.03),
        child: Column(
          children: [
            Text('Total Students: 65', style: TextStyle(fontSize: fontSize)),
            const SizedBox(height: 4),
            Text('Total Votes: 55', style: TextStyle(fontSize: fontSize)),
            const SizedBox(height: 8),
            if (isPublished)
              Column(
                children: [
                  const Divider(),
                  Text(
                    'Winner: $winner',
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffE76239),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class CRList extends StatelessWidget {
  final double height;
  final double fontSize;
  final bool isPublished;
  final String winner;
  final List<CRData> crData;

  const CRList({
    Key? key,
    required this.height,
    required this.fontSize,
    required this.isPublished,
    required this.winner,
    required this.crData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: SizedBox(
        height: height,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Candidate',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: fontSize)),
                  Text('Votes',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: fontSize)),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: crData.length,
                itemBuilder: (context, index) {
                  return CRListItem(
                    crData: crData[index],
                    fontSize: fontSize,
                    isPublished: isPublished,
                    winner: winner,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CRListItem extends StatelessWidget {
  final CRData crData;
  final double fontSize;
  final bool isPublished;
  final String winner;

  const CRListItem({
    Key? key,
    required this.crData,
    required this.fontSize,
    required this.isPublished,
    required this.winner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle tap action
      },
      child: Container(
        decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.grey[300]!, width: 1)),
          color: isPublished && crData.name == winner
              ? Colors.amber.withOpacity(0.2)
              : null,
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Text(crData.name, style: TextStyle(fontSize: fontSize))),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('${crData.votes}%',
                    style: TextStyle(
                        fontSize: fontSize, fontWeight: FontWeight.bold)),
                Text('(${(crData.votes * 55 / 100).round()} votes)',
                    style: TextStyle(
                        fontSize: fontSize - 2, color: Colors.grey[600])),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CRData {
  final String name;
  final int votes;

  CRData({required this.name, required this.votes});
}

class PublishButton extends StatelessWidget {
  final double width;
  final double fontSize;

  const PublishButton({Key? key, required this.width, required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text('Publish Results', style: TextStyle(fontSize: fontSize)),
    );
  }
}
