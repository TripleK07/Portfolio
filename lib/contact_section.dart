import 'package:flutter/material.dart';
import 'package:portfolio/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  _ContactSectionState createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  int _currentFocusItem = -1;

  void _launchMail() async {
    const mailUrl = 'mailto:triplek07@gmail.com';
    try {
      await launch(mailUrl);
    } catch (e) {
      print('error email');
    }
  }

  Widget infoCard({
    required int index,
    required title,
    required IconData icon,
  }) {
    Color textColor = index == _currentFocusItem
        ? Colors.white
        : Theme.of(context).primaryColor;

    Color fillColor = index == _currentFocusItem
        ? Theme.of(context).primaryColor
        : Colors.white;

    return GestureDetector(
      onTap: index == 0 ? _launchMail : () {},
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
          //padding: const EdgeInsets.symmetric(horizontal: 20),
          //margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(
              color: Colors.grey.shade400,
            ),
          ),
          width: 345,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 50,
                color: textColor,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: textColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget desktopLayout() {
    return Column(
      children: [
        Text(
          'Contact',
          style: Theme.of(context).textTheme.headline3,
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            infoCard(
                index: 0, title: "triplek07@gmail.com", icon: Icons.mail_sharp),
            SizedBox(
              width: 20,
            ),
            infoCard(
              index: 1,
              title: "+65 88904036",
              icon: Icons.phone_sharp,
            ),
            SizedBox(
              width: 20,
            ),
            infoCard(
                index: 2,
                title: "Blk 52, Bukit Batok East Ave 5, Singapore",
                icon: Icons.place_sharp),
          ],
        ),
      ],
    );
  }

  Widget otherLayout() {
    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(
        children: [
          Text(
            'Contact',
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(
            height: 30,
          ),
          infoCard(
              index: 0, title: "triplek07@gmail.com", icon: Icons.mail_sharp),
          SizedBox(
            height: 30,
          ),
          infoCard(
            index: 1,
            title: "+65 88904036",
            icon: Icons.phone_sharp,
          ),
          SizedBox(
            height: 30,
          ),
          infoCard(
              index: 2,
              title: "Blk 101 Bukit Batok Ave 6, Singapore",
              icon: Icons.place_sharp),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      width: double.infinity,
      child: Responsive(
        desktop: desktopLayout(),
        tablet: otherLayout(),
        mobile: otherLayout(),
      ),
    );
  }
}
