import 'package:flutter/material.dart';
import 'package:portfolio/widgets/responsive.dart';
import 'package:portfolio/widgets/timeline.dart';
import 'package:visibility_detector/visibility_detector.dart';

class EducationSection extends StatefulWidget {
  const EducationSection({Key? key}) : super(key: key);

  @override
  _EducationSectionState createState() => _EducationSectionState();
}

class _EducationSectionState extends State<EducationSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
  }

  String _hoverIndex = "";

  Widget desktopLayout() {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (info) {
        if (mounted) {
          _animationController.forward();
        }
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Opacity(
            opacity: _animationController.value,
            child: Column(
              children: [
                Text('Education', style: Theme.of(context).textTheme.headline3),
                // BuildTimeline(
                //   indexTitle: "1",
                //   hoverIndex: _hoverIndex,
                //   onHoverChanged: (value) {
                //     setState(() {
                //       _hoverIndex = value;
                //     });
                //   },
                //   startWidget: TimelineCard(
                //     indexTitle: "1",
                //     content:
                //         "Graduated from University of Computer Studies, Yangon (UCSY).",
                //     hoverIndex: _hoverIndex,
                //   ),
                //   endWidget: TimelineWithoutCard(
                //       title: "Computer Science",
                //       subtitle: "B.C.Sc",
                //       dateTime: "4th May 2013",
                //       alignment: CrossAxisAlignment.start),
                // ),
                BuildTimeline(
                  indexTitle: "2",
                  hoverIndex: _hoverIndex,
                  onHoverChanged: (value) {
                    setState(() {
                      _hoverIndex = value;
                    });
                  },
                  startWidget: TimelineWithoutCard(
                      title: "Computer Science",
                      subtitle: "Bachelor of Computer Science (Hons.)",
                      dateTime: "Feb 2014",
                      alignment: CrossAxisAlignment.end),
                  endWidget: TimelineCard(
                    indexTitle: "2",
                    content:
                        "Graduated from University of Computer Studies, Yangon (UCSY) with great honor.",
                    hoverIndex: _hoverIndex,
                  ),
                ),
                // BuildTimeline(
                //   indexTitle: "3",
                //   hoverIndex: _hoverIndex,
                //   onHoverChanged: (value) {
                //     setState(() {
                //       _hoverIndex = value;
                //     });
                //   },
                //   startWidget: TimelineCard(
                //     indexTitle: "3",
                //     content:
                //         "After Graduating from University, received professional web developer certificate at devnet Solution Provider.",
                //     hoverIndex: _hoverIndex,
                //   ),
                //   endWidget: TimelineWithoutCard(
                //       title: "Professional Web Developer",
                //       subtitle: "ASP.NET Web Development",
                //       dateTime: "Jan 2014",
                //       alignment: CrossAxisAlignment.start),
                // ),
                // BuildTimeline(
                //   indexTitle: "4",
                //   hoverIndex: _hoverIndex,
                //   onHoverChanged: (value) {
                //     setState(() {
                //       _hoverIndex = value;
                //     });
                //   },
                //   startWidget: TimelineWithoutCard(
                //       title: "Domain Driven Design Architecture",
                //       subtitle: "ASP.NET Web Development",
                //       dateTime: "July 2016",
                //       alignment: CrossAxisAlignment.end),
                //   endWidget: TimelineCard(
                //     indexTitle: "4",
                //     content:
                //         "Another Web, (Frontend & Backend) development with Domain Driven Design Architecture, certificate awarded by MCPA Yangon.",
                //     hoverIndex: _hoverIndex,
                //   ),
                // ),
                BuildTimeline(
                  indexTitle: "5",
                  hoverIndex: _hoverIndex,
                  onHoverChanged: (value) {
                    setState(() {
                      _hoverIndex = value;
                    });
                  },
                  startWidget: TimelineCard(
                    indexTitle: "5",
                    content:
                        "Achieved Microsoft SQL Server Database Administration certificate at Gusto Institute.",
                    hoverIndex: _hoverIndex,
                  ),
                  endWidget: TimelineWithoutCard(
                      title: "Database Administration",
                      subtitle: "Microsoft SQL Server",
                      dateTime: "August 2019",
                      alignment: CrossAxisAlignment.start),
                ),
                BuildTimeline(
                  indexTitle: "6",
                  hoverIndex: _hoverIndex,
                  onHoverChanged: (value) {
                    setState(() {
                      _hoverIndex = value;
                    });
                  },
                  startWidget: TimelineWithoutCard(
                      title: "Azure Developer Associate",
                      subtitle: "Microsoft",
                      dateTime: "March 2024",
                      alignment: CrossAxisAlignment.end),
                  endWidget: TimelineCard(
                    indexTitle: "6",
                    content:
                        "Achieved Microsoft Certified Azure Developer Associate AZ-204.",
                    hoverIndex: _hoverIndex,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget mobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child:
              Text('Education', style: Theme.of(context).textTheme.headline3),
        ),
        // TimelineWithoutCard(
        //     title: "Computer Science",
        //     subtitle: "B.C.Sc",
        //     dateTime: "4th May 2013",
        //     alignment: CrossAxisAlignment.start),
        // TimelineCard(
        //   indexTitle: "1",
        //   content:
        //       "Graduated from University of Computer Studies, Yangon (UCSY)",
        //   hoverIndex: "0",
        // ),
        // const SizedBox(
        //   height: 30,
        // ),
        TimelineWithoutCard(
            title: "Computer Science",
            subtitle: "Bachelor of Computer Science (Hons.)",
            dateTime: "8th Feb 2014",
            alignment: CrossAxisAlignment.start),
        TimelineCard(
          indexTitle: "2",
          content:
              "Graduated from University of Computer Studies, Yangon (UCSY) with great honor",
          hoverIndex: "0",
        ),
        const SizedBox(
          height: 30,
        ),
        // TimelineWithoutCard(
        //     title: "Professional Web Developer",
        //     subtitle: "ASP.NET Web Development",
        //     dateTime: "Jan 2014",
        //     alignment: CrossAxisAlignment.start),
        // TimelineCard(
        //   indexTitle: "3",
        //   content:
        //       "After Graduating from University, received professional web developer certificate at devnet Solution Provider.",
        //   hoverIndex: "0",
        // ),
        // const SizedBox(
        //   height: 30,
        // ),
        // TimelineWithoutCard(
        //     title: "Domain Driven Design Architecture",
        //     subtitle: "ASP.NET Web Development",
        //     dateTime: "July 2016",
        //     alignment: CrossAxisAlignment.start),
        // TimelineCard(
        //   indexTitle: "4",
        //   content:
        //       "Another Web, (Frontend & Backend) development with Domain Driven Design Architecture, certificate awarded by MCPA Yangon",
        //   hoverIndex: "0",
        // ),
        // const SizedBox(
        //   height: 30,
        // ),
        TimelineWithoutCard(
            title: "Database Administration",
            subtitle: "Microsoft SQL Server",
            dateTime: "August 2019",
            alignment: CrossAxisAlignment.start),
        TimelineCard(
          indexTitle: "5",
          content:
              "Achieved Microsoft SQL Server Database Administration certificate at Gusto Institute.",
          hoverIndex: "0",
        ),
        const SizedBox(
          height: 30,
        ),
        TimelineWithoutCard(
            title: "Azure Developer Associate",
            subtitle: "Microsoft",
            dateTime: "March 2024",
            alignment: CrossAxisAlignment.start),
        TimelineCard(
          indexTitle: "6",
          content:
              "Achieved Microsoft Certified Azure Developer Associate AZ-204.",
          hoverIndex: "0",
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      width: double.infinity,
      child: Responsive(
        mobile: mobileLayout(),
        tablet: desktopLayout(),
        desktop: desktopLayout(),
      ),
    );
  }
}
