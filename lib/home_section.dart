import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/AnimationHelper/fade_slide_animated_widget.dart';
import 'package:portfolio/constant.dart';
import 'package:portfolio/responsive.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class HomeSection extends StatefulWidget {
  const HomeSection({Key? key}) : super(key: key);

  @override
  _HomeSectionState createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection>
    with TickerProviderStateMixin {
  late AnimationController _helloTextController;
  late AnimationController _nameTextController;
  late AnimationController _jobTextController;
  late AnimationController _introTextController;
  late AnimationController _buttonController;
  late AnimationController _imageController;

  @override
  void initState() {
    super.initState();
    debugPrint('home section build');

    Duration _duration = new Duration(milliseconds: 800);
    _helloTextController =
        new AnimationController(vsync: this, duration: _duration);
    _nameTextController =
        new AnimationController(vsync: this, duration: _duration);
    _jobTextController =
        new AnimationController(vsync: this, duration: _duration);
    _introTextController =
        new AnimationController(vsync: this, duration: _duration);
    _buttonController =
        new AnimationController(vsync: this, duration: _duration);
    _imageController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));

    animate();
  }

  animate() async {
    Duration _delayDuration = new Duration(milliseconds: 300);

    if (mounted) {
      _helloTextController.forward();
    }

    await Future.delayed(_delayDuration, () {
      if (mounted) {
        _nameTextController.forward();
      }
    });

    await Future.delayed(_delayDuration, () {
      if (mounted) {
        _jobTextController.forward();
      }
    });

    await Future.delayed(_delayDuration, () {
      if (mounted) {
        _introTextController.forward();
      }
    });

    await Future.delayed(_delayDuration, () {
      if (mounted) {
        _buttonController.forward();
      }
    });

    await Future.delayed(Duration(milliseconds: 700), () {
      if (mounted) {
        _imageController.forward();
      }
    });
  }

  @override
  void dispose() {
    _helloTextController.dispose();
    _nameTextController.dispose();
    _jobTextController.dispose();
    _introTextController.dispose();
    _buttonController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  void _launchMail() async {
    const mailUrl = 'mailto:triplek07@gmail.com';
    try {
      await launch(mailUrl);
    } catch (e) {
      print('error email');
    }
  }

  void downloadFile(String url) {
    // html.AnchorElement anchorElement = new html.AnchorElement(href: url);
    // anchorElement.download = url;
    // anchorElement.setAttribute("download", "ResumeOfKKK.docx");
    // anchorElement.click();

    //need import 'dart:js' as js;
    //js.context.callMethod('open', [url]);

    //need import 'dart:html' as html;
    html.window.open(url, 'new tab');
  }

  Widget button(String title, VoidCallback? callback) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: callback,
        child: Container(
          margin: const EdgeInsets.only(top: 10.0),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget profileText(context) {
    return Container(
      margin: EdgeInsets.only(top: Responsive.isDesktop(context) ? 280 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FadeSlideAnimatedWidget(
            controller: _helloTextController,
            direction: SLIDE_Direction.TOP,
            slideValue: 20,
            widget:
                Text("Hello I'm", style: Theme.of(context).textTheme.headline3),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: FadeSlideAnimatedWidget(
              controller: _nameTextController,
              direction: SLIDE_Direction.TOP,
              slideValue: 20,
              widget: const Text(
                'Khant Ko Ko',
                style: const TextStyle(
                  color: Color(0xff293651),
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20),
            child: FadeSlideAnimatedWidget(
              controller: _jobTextController,
              direction: SLIDE_Direction.TOP,
              slideValue: 20,
              widget: const Text(
                'Professional Software Engineer',
                style: const TextStyle(
                  color: Color(0xff293651),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          FadeSlideAnimatedWidget(
            controller: _introTextController,
            direction: SLIDE_Direction.TOP,
            slideValue: 20,
            widget: Text(
              'Innovative, task-driven professional with 7+ years of experience in \nWindows, Web, Mobile development across all site of industries.\nEquipped with a record of success in consistently identifying and providing the technological needs of companies through ingenious innovation.',
              style: const TextStyle(
                color: Color(0xff293651),
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1.7,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FadeSlideAnimatedWidget(
            controller: _buttonController,
            direction: SLIDE_Direction.TOP,
            slideValue: 20,
            widget: Row(
              children: [
                button('Hire me', _launchMail),
                SizedBox(
                  width: 10,
                ),
                button(
                  'Download CV',
                  () {
                    // downloadFile(
                    //     'https://triplek07.github.io/assets/assets/static/ResumeOfKKK.docx');
                    downloadFile(
                        "https://triplek07.github.io/assets/assets/static/Khant%20Ko%20Ko's%20Resume.pdf");
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget profileImage(context) {
    return FadeSlideAnimatedWidget(
      controller: _imageController,
      direction: SLIDE_Direction.NONE,
      slideValue: 0,
      widget: Container(
        margin: EdgeInsets.only(top: Responsive.isDesktop(context) ? 130 : 0),
        height: Responsive.isDesktop(context)
            ? (1007 -
                (130 + MediaQuery.of(context).padding.top + kToolbarHeight))
            : 600,
        child: Image.asset(
          'assets/images/hero.png',
          width: 550,
          height: 825,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }

  Widget desktopLayout(context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Theme.of(context).primaryColor,
            ],
            stops: [0.47, 0.47],
            //begin: Alignment.bottomLeft,
            //end: Alignment.topRight,
            begin: Alignment(-1, 0.3),
            end: Alignment(1, -1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 500,
              child: profileText(context),
            ),
            const SizedBox(
              width: 20,
            ),
            profileImage(context),
          ],
        ),
      ),
      if (MediaQuery.of(context).size.width >= 1280)
        Positioned(
          child: socialLinksGroup(),
          top: 290,
          left: 30,
        ),
    ]);
  }

  Widget otherLayout(context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          profileText(context),
          SizedBox(
            height: 30,
          ),
          profileImage(context),
        ],
      ),
    );
  }

  Widget socialLink(IconData icon, String linkUrl) {
    return GestureDetector(
      onTap: () async {
        if (!await launch(linkUrl)) throw 'Could not launch $linkUrl';
      },
      child: Container(
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Icon(
            icon,
            color: Colors.grey.shade400,
          ),
        ),
      ),
    );
  }

  Widget socialLinksGroup() {
    return FadeSlideAnimatedWidget(
      controller: _imageController,
      direction: SLIDE_Direction.NONE,
      slideValue: 0,
      widget: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent,
        ),
        child: Column(
          children: [
            socialLink(FontAwesomeIcons.facebookF, kFacebookLink),
            SizedBox(
              height: 40,
            ),
            socialLink(FontAwesomeIcons.instagram, kInstergramLink),
            SizedBox(
              height: 40,
            ),
            socialLink(FontAwesomeIcons.twitter, kTwitterLink),
            SizedBox(
              height: 40,
            ),
            socialLink(FontAwesomeIcons.linkedinIn, kLinkedinLink),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Responsive(
        desktop: desktopLayout(context),
        tablet: otherLayout(context),
        mobile: otherLayout(context),
      ),
    );
  }
}
