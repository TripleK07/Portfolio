import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/responsive.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SkillSection extends StatefulWidget {
  const SkillSection({Key? key}) : super(key: key);

  @override
  _SkillSectionState createState() => _SkillSectionState();
}

class _SkillSectionState extends State<SkillSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _skillAnimationController;

  final List<Map<String, dynamic>> skills = [
    {"name": ".Net Core", "percent": 80},
    {"name": "Spring Boot", "percent": 55},
    {"name": "Vue", "percent": 65},
    {"name": "Flutter", "percent": 60},
    {"name": "Angular", "percent": 50},
    {"name": "Sql / Plsql", "percent": 75},
  ];

  @override
  void initState() {
    super.initState();

    Duration _duration = Duration(milliseconds: 1500);
    _skillAnimationController =
        new AnimationController(vsync: this, duration: _duration);
    // _animation = new Tween(begin: 0, end: 1).animate(_skillAnimationController);
  }

  @override
  void dispose() {
    super.dispose();
    //_skillAnimationController.dispose();
  }

  Widget skillTitle(String title, {double? textWidth = double.infinity}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: textWidth,
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Color(0xff293651),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget skillPercentBar(context, double percent, double barWidth) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (VisibilityInfo info) {
        // var visiblePercentage = info.visibleFraction * 100;
        // debugPrint('Widget ${info.key} is $visiblePercentage% visible');
        if (mounted) {
          _skillAnimationController.forward();
        }
      },
      child: AnimatedBuilder(
        animation: _skillAnimationController,
        builder: (BuildContext context, Widget? child) {
          return FittedBox(
            child: Stack(
              children: [
                Container(
                  width: barWidth,
                  height: 13,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Container(
                  width: ((percent * _skillAnimationController.value) / 100) *
                      barWidth,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Positioned(
                  left: barWidth / 2,
                  child: Text(
                    '${(percent * _skillAnimationController.value).toStringAsFixed(0)}%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget skillPercent(context, String title, double percent) {
    double width = Responsive.isTablet(context) ? 350 : 350;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, //remove
      children: [
        skillTitle(title, textWidth: 150),
        skillPercentBar(context, percent, width),
      ],
    );
  }

  Widget skillPercentMobile(context, title, double percent) {
    var mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center, //remove
      children: [
        skillTitle(title),
        skillPercentBar(context, percent, width),
      ],
    );
  }

  Widget expertItem(context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            FontAwesomeIcons.circleCheck,
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color(0xff293651),
              fontSize: Responsive.isMobile(context) ? 16 : 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget expertItemGroup1(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        expertItem(context, 'Fullstack Development'),
        expertItem(context, 'RESTful API'),
        expertItem(context, 'MSSQL & Oracle DB'),
        expertItem(context, 'Data Migration & ETL'),
        expertItem(context, 'Replication & Mirroring'),
        expertItem(context, 'Azure Cloud'),
      ],
    );
  }

  Widget expertItemGroup2(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        expertItem(context, 'Git'),
        expertItem(context, 'Power BI'),
        expertItem(context, 'Containerization'),
        expertItem(context, '3rd-party Integration'),
        expertItem(context, 'Software Lifecycle'),
        expertItem(context, 'Problem Solving'),
      ],
    );
  }

  Widget expertizeWidget(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Expertize',
          style: Theme.of(context).textTheme.headline3!.copyWith(
                letterSpacing: 4,
              ),
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            expertItemGroup1(context),
            SizedBox(
              width: 50,
            ),
            expertItemGroup2(context),
          ],
        ),
      ],
    );
  }

  Widget desktopLayout(context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Skills',
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      letterSpacing: 4,
                    ),
              ),
              SizedBox(
                height: 30,
              ),
              ...skills
                  .map((skill) =>
                      skillPercent(context, skill["name"], skill["percent"]))
                  .toList(),
            ],
          ),
          SizedBox(
            width: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: expertizeWidget(context),
          ),
        ],
      ),
    );
  }

  Widget tabletLayout(context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, //s
        children: [
          Text(
            'Skills',
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  letterSpacing: 4,
                ),
          ),
          SizedBox(
            height: 30,
          ),
          ...skills
              .map((skill) =>
                  skillPercent(context, skill["name"], skill["percent"]))
              .toList(),
          SizedBox(
            height: 30,
          ),
          Text(
            'Expertize',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 4,
                ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              expertItemGroup1(context),
              SizedBox(
                width: 80,
              ),
              expertItemGroup2(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget mobileLayout(context) {
    debugPrint("rebuild : skill mobile");
    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, //s
        children: [
          Text(
            'Skills',
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  letterSpacing: 4,
                ),
          ),
          SizedBox(
            height: 30,
          ),
          ...skills
              .map((skill) =>
                  skillPercent(context, skill["name"], skill["percent"]))
              .toList(),
          SizedBox(
            height: 30,
          ),
          Text(
            'Expertize',
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  letterSpacing: 4,
                ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: expertItemGroup1(context),
            width: 400,
          ),
          SizedBox(
            width: 80,
          ),
          Container(
            child: expertItemGroup2(context),
            width: 400,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Color(0xfff9f9f9),
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: Responsive(
        desktop: desktopLayout(context),
        tablet: tabletLayout(context),
        mobile: mobileLayout(context),
      ),
    );
  }
}
