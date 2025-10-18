import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatefulWidget {
  const FooterSection({Key? key}) : super(key: key);

  @override
  _FooterSectionState createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FooterSection> {
  int _currentFocusItem = -1;

  Widget socialLink(IconData icon, String url, int index) {
    return GestureDetector(
      onTap: () async {
        if (!await launch(url)) throw 'Could not launch $url';
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) {
          setState(() {
            _currentFocusItem = index;
          });
        },
        onExit: (event) {
          setState(() {
            _currentFocusItem = -1;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentFocusItem == index
                ? Theme.of(context).primaryColor
                : Colors.grey.shade300,
          ),
          child: Icon(
            icon,
            color: _currentFocusItem == index
                ? Colors.white
                : Colors.grey.shade700,
          ),
        ),
      ),
    );
  }

  void _launchMail() async {
    const mailUrl = 'mailto:triplek07@gmail.com';
    try {
      await launch(mailUrl);
    } catch (e) {
      print('error email');
    }
  }

  Widget email() {
    return InkWell(
      hoverColor: Colors.transparent,
      //highlightColor: Colors.transparent,
      onTap: () {
        _launchMail();
      },
      child: Text(
        'triplek07@gmail.com',
        style: Theme.of(context).textTheme.headline6!.copyWith(
              fontSize: 16,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              socialLink(FontAwesomeIcons.github, kGithubLink, 0),
              SizedBox(
                width: 30,
              ),
              socialLink(FontAwesomeIcons.linkedinIn, kLinkedinLink, 3),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          email(),
          SizedBox(
            height: 30,
          ),
          Text(
            '©2022 - All Right Reserved By Khant Ko Ko',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.grey.shade700,
                ),
          )
        ],
      ),
    );
  }
}
