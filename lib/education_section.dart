import 'package:flutter/material.dart';
import 'package:portfolio/icon_indicator.dart';
import 'package:portfolio/responsive.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:visibility_detector/visibility_detector.dart';

class EducationSection extends StatefulWidget {
  const EducationSection({Key? key}) : super(key: key);

  @override
  _EducationSectionState createState() => _EducationSectionState();
}

class _EducationSectionState extends State<EducationSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  String _hoverIndex = "";

  @override
  void initState() {
    super.initState();

    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
  }

  Widget _buildTimeline(
    context, {
    required String indexTitle,
    required Widget startWidget,
    required Widget endWidget,
  }) {
    Color fillColor = _hoverIndex == indexTitle
        ? Theme.of(context).primaryColor
        : Colors.white;
    Color textColor = _hoverIndex == indexTitle
        ? Colors.white
        : Theme.of(context).primaryColor;

    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _hoverIndex = indexTitle;
        });
      },
      onExit: (event) {
        setState(() {
          _hoverIndex = "";
        });
      },
      child: Container(
        height: 220,
        width: 900,
        child: TimelineTile(
          axis: TimelineAxis.vertical,
          alignment: TimelineAlign.center,
          indicatorStyle: IndicatorStyle(
            color: Theme.of(context).primaryColor,
            indicator: IconIndicator(
              title: indexTitle,
              size: 20,
              fillColor: fillColor,
              textColor: textColor,
            ),
            height: 60,
            width: 60,
          ),
          beforeLineStyle:
              LineStyle(color: Theme.of(context).primaryColor, thickness: 2),
          startChild: Container(
            color: Colors.transparent,
            child: startWidget,
          ),
          endChild: Container(
            constraints: const BoxConstraints(
              minWidth: 200,
            ),
            color: Colors.transparent,
            child: endWidget,
          ),
        ),
      ),
    );
  }

  Widget timelineCard({
    required String indexTitle,
    required String content,
  }) {
    Color fillColor = _hoverIndex == indexTitle
        ? Theme.of(context).primaryColor
        : Colors.white;
    Color textColor =
        _hoverIndex == indexTitle ? Colors.white : Colors.grey.shade600;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.all(20),
      child: Text(
        content,
        style: Theme.of(context).textTheme.headline6!.copyWith(
              color: textColor,
            ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: fillColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }

  Widget timelineWithoutCard(context,
      {required String title,
      required String subtitle,
      required String dateTime,
      required CrossAxisAlignment alignment}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        crossAxisAlignment: alignment,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: Colors.black.withOpacity(0.7)),
            textAlign: (alignment == CrossAxisAlignment.end)
                ? TextAlign.end
                : TextAlign.start,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.headline6,
            textAlign: (alignment == CrossAxisAlignment.end)
                ? TextAlign.end
                : TextAlign.start,
          ),
          SizedBox(
            height: 10,
          ),
          Text(dateTime,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.grey.shade600)),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

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
                _buildTimeline(
                  context,
                  indexTitle: "1",
                  startWidget: timelineCard(
                    content:
                        "Graduated from University of Computer Studies, Yangon (UCSY).",
                    indexTitle: "1",
                  ),
                  endWidget: timelineWithoutCard(context,
                      title: "Computer Science",
                      subtitle: "B.C.Sc",
                      dateTime: "4th May 2013",
                      alignment: CrossAxisAlignment.start),
                ),
                _buildTimeline(
                  context,
                  indexTitle: "2",
                  startWidget: timelineWithoutCard(context,
                      title: "Computer Science",
                      subtitle: "B.C.Sc (Hons.)",
                      dateTime: "8th Feb 2014",
                      alignment: CrossAxisAlignment.end),
                  endWidget: timelineCard(
                    content:
                        "Graduated from University of Computer Studies, Yangon (UCSY) with great honor.",
                    indexTitle: "2",
                  ),
                ),
                _buildTimeline(
                  context,
                  indexTitle: "3",
                  startWidget: timelineCard(
                    content:
                        "After Graduating from University, received professional web developer certificate at devnet Solution Provider.",
                    indexTitle: "3",
                  ),
                  endWidget: timelineWithoutCard(context,
                      title: "Professional Web Developer",
                      subtitle: "ASP.NET Web Development",
                      dateTime: "Jan 2014",
                      alignment: CrossAxisAlignment.start),
                ),
                _buildTimeline(
                  context,
                  indexTitle: "4",
                  startWidget: timelineWithoutCard(context,
                      title: "Domain Driven Design Architecture",
                      subtitle: "ASP.NET Web Development",
                      dateTime: "July 2016",
                      alignment: CrossAxisAlignment.end),
                  endWidget: timelineCard(
                    content:
                        "Another Web, (Frontend & Backend) development with Domain Driven Design Architecture, certificate awarded by MCPA Yangon.",
                    indexTitle: "4",
                  ),
                ),
                _buildTimeline(
                  context,
                  indexTitle: "5",
                  startWidget: timelineCard(
                    content:
                        "Achieved Microsoft SQL Server Database Administration certificate at Gusto Institute.",
                    indexTitle: "5",
                  ),
                  endWidget: timelineWithoutCard(context,
                      title: "Database Administration",
                      subtitle: "Microsoft SQL Server",
                      dateTime: "August 2019",
                      alignment: CrossAxisAlignment.start),
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
        timelineWithoutCard(context,
            title: "Computer Science",
            subtitle: "B.C.Sc",
            dateTime: "4th May 2013",
            alignment: CrossAxisAlignment.start),
        timelineCard(
          content:
              "Graduated from University of Computer Studies, Yangon (UCSY)",
          indexTitle: "01",
        ),
        SizedBox(
          height: 30,
        ),
        timelineWithoutCard(context,
            title: "Computer Science",
            subtitle: "B.C.Sc (Hons.)",
            dateTime: "8th Feb 2014",
            alignment: CrossAxisAlignment.start),
        timelineCard(
          content:
              "Graduated from University of Computer Studies, Yangon (UCSY) with great honor",
          indexTitle: "02",
        ),
        SizedBox(
          height: 30,
        ),
        timelineWithoutCard(context,
            title: "Professional Web Developer",
            subtitle: "ASP.NET Web Development",
            dateTime: "Jan 2014",
            alignment: CrossAxisAlignment.start),
        timelineCard(
          content:
              "After Graduating from University, received professional web developer certificate at devnet Solution Provider.",
          indexTitle: "03",
        ),
        SizedBox(
          height: 30,
        ),
        timelineWithoutCard(context,
            title: "Domain Driven Design Architecture",
            subtitle: "ASP.NET Web Development",
            dateTime: "July 2016",
            alignment: CrossAxisAlignment.start),
        timelineCard(
          content:
              "Another Web, (Frontend & Backend) development with Domain Driven Design Architecture, certificate awarded by MCPA Yangon",
          indexTitle: "04",
        ),
        SizedBox(
          height: 30,
        ),
        timelineWithoutCard(context,
            title: "Database Administration",
            subtitle: "Microsoft SQL Server",
            dateTime: "August 2019",
            alignment: CrossAxisAlignment.start),
        timelineCard(
          content:
              "Achieved Microsoft SQL Server Database Administration certificate at Gusto Institute.",
          indexTitle: "05",
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
