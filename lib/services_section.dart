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
  late AnimationController _qualityAnimationController;
  late AnimationController _developmentAnimationController;
  late AnimationController _supportAnimationController;

  @override
  void initState() {
    super.initState();
    Duration _duration = Duration(milliseconds: 1000);
    _applicationAnimationController =
        new AnimationController(vsync: this, duration: _duration);
    _qualityAnimationController =
        new AnimationController(vsync: this, duration: _duration);
    _developmentAnimationController =
        new AnimationController(vsync: this, duration: _duration);
    _supportAnimationController =
        new AnimationController(vsync: this, duration: _duration);
  }

  animate() async {
    Duration _delayDuration = new Duration(milliseconds: 500);
    if (mounted) {
      _applicationAnimationController.forward();
    }

    await Future.delayed(_delayDuration, () {
      if (mounted) {
        _qualityAnimationController.forward();
      }
    });

    await Future.delayed(_delayDuration, () {
      if (mounted) {
        _developmentAnimationController.forward();
      }
    });

    await Future.delayed(_delayDuration, () {
      if (mounted) {
        _supportAnimationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _applicationAnimationController.dispose();
    _qualityAnimationController.dispose();
    _developmentAnimationController.dispose();
    _supportAnimationController.dispose();
    super.dispose();
  }

  Widget roundedCard(context, IconData icon, String title, String subtitle,
      AnimationController controller) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Container(
            height: 250,
            // width: 345,
            width: () {
              DeviceType deviceType = Responsive.getDeviceType(context);
              switch (deviceType) {
                case DeviceType.desktop:
                  //return (MediaQuery.of(context).size.width - 60) * 0.23;
                  return 250.0;
                case DeviceType.tablet:
                  return (MediaQuery.of(context).size.width - 20) * 0.4;
                case DeviceType.mobile:
                default:
                  return MediaQuery.of(context).size.width * 0.9;
              }
            }(),
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

  Widget applicationCard() {
    return roundedCard(
        context,
        Icons.desktop_windows_sharp,
        'Application',
        'Custom software solutions tailored to business requirements.',
        _applicationAnimationController);
  }

  Widget qualityCard() {
    return roundedCard(
        context,
        Icons.scatter_plot,
        'Quality',
        'Consistent delivery of high-quality, dependable applications.',
        _qualityAnimationController);
  }

  Widget developmentCard() {
    return roundedCard(
        context,
        Icons.code_sharp,
        'Development',
        'Efficient, maintainable code for scalable and robust software.',
        _developmentAnimationController);
  }

  Widget supportCard() {
    return roundedCard(
        context,
        Icons.supervisor_account_rounded,
        'Support',
        'Application maintenance, troubleshooting, and technical assistance.',
        _supportAnimationController);
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
                applicationCard(),
                SizedBox(
                  width: 20,
                ),
                qualityCard(),
                SizedBox(width: 20),
                developmentCard(),
                SizedBox(width: 20),
                supportCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget tabletLayout(context) {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                applicationCard(),
                SizedBox(
                  width: 20,
                ),
                qualityCard(),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                developmentCard(),
                SizedBox(width: 20),
                supportCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget mobileLayout(context) {
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
            applicationCard(),
            SizedBox(
              height: 30,
            ),
            qualityCard(),
            SizedBox(
              height: 30,
            ),
            developmentCard(),
            SizedBox(
              height: 30,
            ),
            supportCard(),
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
        tablet: tabletLayout(context),
        mobile: mobileLayout(context),
      ),
    );
  }
}
