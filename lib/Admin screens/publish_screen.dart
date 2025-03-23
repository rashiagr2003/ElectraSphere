import 'package:electra_sphere/Admin%20screens/widgets/class_dropdown.dart';
import 'package:electra_sphere/Admin%20screens/widgets/imp_components.dart';
import 'package:flutter/material.dart';
import '../Common Screens/pie_chart_widget.dart';

class ResultsPublishScreen extends StatefulWidget {
  final List<Map<String, dynamic>> crList;

  const ResultsPublishScreen({super.key, required this.crList});

  @override
  State<ResultsPublishScreen> createState() => _ResultsPublishScreenState();
}

class _ResultsPublishScreenState extends State<ResultsPublishScreen>
    with SingleTickerProviderStateMixin {
  late List<CRData> crData;

  late String winner;
  bool isPublished = false;
  bool isExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    crData = _createCRData(widget.crList);
    winner = _getWinner(crData);

    // Setup animation for the publish button
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get responsive dimensions
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;
    final isSmallScreen = screenWidth < 360;
    final isLandscape = screenWidth > screenHeight;

    // Calculate responsive metrics
    final titleFontSize = isSmallScreen ? 18.0 : 20.0;
    final bodyFontSize = isSmallScreen ? 14.0 : 16.0;
    final spacing = screenWidth * 0.04;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/manipal_logo.png"),
        ),
        title: const Text('Election Results'),
        actions: [
          IconButton(
            icon: Icon(isExpanded ? Icons.fullscreen_exit : Icons.fullscreen),
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
          ),
        ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            return _buildLandscapeLayout(screenWidth, screenHeight, spacing,
                bodyFontSize, titleFontSize);
          } else {
            return _buildPortraitLayout(screenWidth, screenHeight, spacing,
                bodyFontSize, titleFontSize);
          }
        },
      ),
    );
  }

  Widget _buildPortraitLayout(double width, double height, double spacing,
      double bodyFontSize, double titleFontSize) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: spacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: spacing),

            // Header section with class and section info
            ClassSectionSelector(),
            // Chart section
            SizedBox(
              height: isExpanded ? height * 0.5 : height * 0.3,
              child: const PieChartWidget(),
            ),

            // Stats section
            _buildStatsCard(width, bodyFontSize),

            // CR List
            CRList(
              height: height * 0.35,
              fontSize: bodyFontSize,
              crData: crData, // Pass the generated CR list
              isPublished: isPublished,
              winner: winner,
            ),

            SizedBox(height: spacing),

            // Publish button
            _buildPublishButton(width, titleFontSize),

            SizedBox(height: spacing * 2),
          ],
        ),
      ),
    );
  }

  Widget _buildLandscapeLayout(double width, double height, double spacing,
      double bodyFontSize, double titleFontSize) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: spacing),
        child: Column(
          children: [
            SizedBox(height: spacing),

            // Header section
            ClassSectionSelector(),
            // Two-column layout for chart and results
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left column - Chart
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.5,
                        child: const PieChartWidget(),
                      ),
                      _buildStatsCard(width, bodyFontSize),
                    ],
                  ),
                ),

                SizedBox(width: spacing),

                // Right column - CR List
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      CRList(
                        height: height * 0.5,
                        fontSize: bodyFontSize,
                        crData: [],
                        isPublished: isPublished,
                        winner: winner,
                      ),
                      SizedBox(height: spacing),
                      _buildPublishButton(width * 0.45, titleFontSize),
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

  Widget _buildStatsCard(double width, double fontSize) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: width * 0.02),
      child: Padding(
        padding: EdgeInsets.all(width * 0.03),
        child: Column(
          children: [
            Text(
              'Total Students: 65',
              style: TextStyle(fontSize: fontSize),
            ),
            const SizedBox(height: 4),
            Text(
              'Total Votes: 55',
              style: TextStyle(fontSize: fontSize),
            ),
            const SizedBox(height: 8),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: isPublished ? null : 0,
              child: isPublished
                  ? Column(
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
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPublishButton(double width, double fontSize) {
    return GestureDetector(
      onTapDown: (_) {
        _animationController.forward();
      },
      onTapUp: (_) {
        _animationController.reverse();
        _publishResults();
      },
      onTapCancel: () {
        _animationController.reverse();
      },
      child: ScaleTransition(
        scale: _animation,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: width * 0.03),
          decoration: BoxDecoration(
            color: isPublished ? Colors.grey : const Color(0xffE76239),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Text(
              isPublished ? 'RESULTS PUBLISHED' : 'PUBLISH RESULTS',
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _publishResults() {
    if (!isPublished) {
      setState(() {
        isPublished = true;
      });

      // Show a confirmation dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Results Published'),
          content: Text(
              'The winner is $winner with ${_getWinningVotes()}% of the votes.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void _showCandidateDetails(BuildContext context, CR candidate) {
    final votes = (candidate.votes * 55 / 100).round();

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              candidate.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatColumn('Percentage', '${candidate.votes}%'),
                _buildStatColumn('Votes', votes.toString()),
                _buildStatColumn(
                    'Rank', '${_getCandidateRank(candidate)}/${crData.length}'),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffE76239),
                foregroundColor: Colors.white,
              ),
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  List<CRData> _createCRData(List<Map<String, dynamic>> crList) {
    return crList
        .map((cr) => CRData(name: cr['name'], votes: cr['votes']))
        .toList();
  }

  String _getWinner(List<CRData> crData) {
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

  int _getWinningVotes() {
    double maxVotes = 0;
    for (var cr in crData) {
      if (cr.votes.toDouble() > maxVotes) {
        maxVotes = cr.votes.toDouble();
      }
    }
    return maxVotes.round();
  }

  int _getCandidateRank(CR candidate) {
    // Sort CRs by votes in descending order
    final sortedCRs = List<CR>.from(crData)
      ..sort((a, b) => b.votes.compareTo(a.votes));

    // Find index (add 1 for rank)
    return sortedCRs.indexOf(candidate) + 1;
  }
}

class CR {
  final String name;
  final int votes;

  CR(this.name, this.votes);
}
