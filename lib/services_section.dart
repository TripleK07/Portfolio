import 'package:flutter/material.dart';
import 'package:portfolio/responsive.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ServicesSection extends StatefulWidget {
  const ServicesSection({Key? key}) : super(key: key);

  @override
  _ServicesSectionState createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection>
    with TickerProviderStateMixin {
  late AnimationController _applicationAnimationController;
  late AnimationController _promisesAnimationController;
  late AnimationController _cleanCodeAnimationController;

  @override
  void initState() {
    super.initState();
    Duration _duration = Duration(milliseconds: 1000);
    _applicationAnimationController =
        new AnimationController(vsync: this, duration: _duration);
    _promisesAnimationController =
        new AnimationController(vsync: this, duration: _duration);
    _cleanCodeAnimationController =
        new AnimationController(vsync: this, duration: _duration);
  }

  animate() async {
    Duration _delayDuration = new Duration(milliseconds: 500);
    if (mounted) {
      _applicationAnimationController.forward();
    }

    await Future.delayed(_delayDuration, () {
      if (mounted) {
        _promisesAnimationController.forward();
      }
    });

    await Future.delayed(_delayDuration, () {
      if (mounted) {
        _cleanCodeAnimationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _applicationAnimationController.dispose();
    _promisesAnimationController.dispose();
    _cleanCodeAnimationController.dispose();
    super.dispose();
  }

  Widget roundedCard(context, IconData icon, String title, String subtitle,
      AnimationController controller) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Container(
            height: 250,
            width: 345,
            margin: EdgeInsets.only(top: (100 - (100 * controller.value))),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.grey.shade500,
                  size: 40,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 4,
                      ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Color(0xff293651),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        });
  }

  Widget desktopLayout(context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (info) {
        animate();
      },
      child: Container(
        child: Column(
          children: [
            Text(
              'Services',
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                roundedCard(
                    context,
                    Icons.desktop_windows_sharp,
                    'Application',
                    'Fresh and responsive design for all devices.',
                    _applicationAnimationController),
                SizedBox(
                  width: 20,
                ),
                roundedCard(
                    context,
                    Icons.scatter_plot,
                    'Promises',
                    'Reliablity, durabilty and customer satisfaction.',
                    _promisesAnimationController),
                SizedBox(width: 20),
                roundedCard(
                    context,
                    Icons.code_sharp,
                    'Clean Code',
                    'Easier to understand, change and maintain with no complexity.',
                    _cleanCodeAnimationController),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget otherLayout(context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (info) {
        animate();
      },
      child: Container(
        margin: const EdgeInsets.all(30),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, //s
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Services',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 4,
                  ),
            ),
            SizedBox(
              height: 30,
            ),
            roundedCard(
              context,
              Icons.desktop_windows_sharp,
              'Application',
              'Fresh and responsive design for all devices.',
              _applicationAnimationController,
            ),
            SizedBox(
              height: 30,
            ),
            roundedCard(
              context,
              Icons.scatter_plot,
              'Promises',
              'Reliablity, durabilty and customer satisfaction.',
              _promisesAnimationController,
            ),
            SizedBox(
              height: 30,
            ),
            roundedCard(
              context,
              Icons.code_sharp,
              'Clean Code',
              'Easier to understand, change and maintain with no complexity.',
              _cleanCodeAnimationController,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: Responsive(
        desktop: desktopLayout(context),
        tablet: otherLayout(context),
        mobile: otherLayout(context),
      ),
    );
  }
}
