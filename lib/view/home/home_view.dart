import 'package:fast_rhino/common_widget/tss_chart.dart';
import 'package:fast_rhino/view/main_tab/main_tab_view.dart';
import 'package:fast_rhino/view/profile/profile_view.dart';
import 'package:flutter/material.dart';
import '../../common_widget/performance_chart.dart';
import '../../common_widget/recent_activities.dart';
import '../../common_widget/training_status.dart';
import '../../common/colo_extension.dart';
class HomeViewScreen extends StatelessWidget {
  const HomeViewScreen({super.key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double paddingValue = screenWidth * 0.05;
    double maxWidth = screenWidth * 0.9;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: paddingValue, vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.05),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  backgroundImage: AssetImage('assets/img/user.png'),
                ),
                SizedBox(width: 10),
                Text("Welcome Hanine 👋", style: TextStyle(color: TColor.black, fontSize: 20, fontWeight: FontWeight.w700)),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            _buildCenteredWidget(TrainingStatus(), maxWidth),
            SizedBox(height: screenHeight * 0.02),
            _buildCenteredWidget(PerformanceChart(), maxWidth),
            SizedBox(height: screenHeight * 0.02),
            _buildCenteredWidget(TssChart(), maxWidth),
            SizedBox(height: screenHeight * 0.02),
            _buildCenteredWidget(
              const Text(
                'Recent Activities',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold  ),
              ),
              maxWidth,
            ),
            _buildCenteredWidget(
              RecentActivities(
                activityName: 'Cycling - 30 km',
                activityDate: 'Tuesday 01 pm',
                buttonColor: Color.fromARGB(255, 245, 235, 221),
                buttonLabel: 'Strava',
                textColor: Colors.orange,
                activityIcon: Icons.directions_bike_sharp,
              ),
              maxWidth,
            ),
            SizedBox(height: screenHeight * 0.015),
            _buildCenteredWidget(
              RecentActivities(
                activityName: 'Swimming',
                activityDate: 'Monday 10 am',
                buttonColor: Color.fromARGB(255, 232, 231, 228),
                buttonLabel: 'App',
                textColor: Colors.black54,
                activityIcon: Icons.pool,
              ),
              maxWidth,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCenteredWidget(Widget child, double maxWidth) {
    return Center(
      child: SizedBox(
        width: maxWidth,
        child: child,
      ),
    );
  }


}
