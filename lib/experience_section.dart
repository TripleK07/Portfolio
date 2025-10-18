import 'package:flutter/material.dart';
import 'package:portfolio/widgets/responsive.dart';
import 'package:portfolio/widgets/timeline.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({Key? key}) : super(key: key);

  @override
  _ExperienceSectionState createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection>
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
                  Text('Experience',
                      style: Theme.of(context).textTheme.headline3),
                  BuildTimeline(
                    indexTitle: "1",
                    hoverIndex: _hoverIndex,
                    onHoverChanged: (value) {
                      setState(() {
                        _hoverIndex = value;
                      });
                    },
                    startWidget: TimelineWithoutCard(
                        title: "System Analyst",
                        subtitle: "Creative Technology Ltd., Singapore",
                        dateTime: "May 2024 – Current",
                        alignment: CrossAxisAlignment.end),
                    endWidget: TimelineCard(
                      indexTitle: "1",
                      content:
                          "Own and manage the full lifecycle of the enterprise Return Merchandise Authorization (RMA) system — including development, maintenance, integration, and user support for both internal and external customers. Also contribute to the development and support of other in-house systems, ensuring seamless integration between internal systems.",
                      hoverIndex: _hoverIndex,
                    ),
                  ),
                  BuildTimeline(
                    indexTitle: "2",
                    hoverIndex: _hoverIndex,
                    onHoverChanged: (value) {
                      setState(() {
                        _hoverIndex = value;
                      });
                    },
                    startWidget: TimelineCard(
                      indexTitle: "2",
                      content:
                          "Support for MOH (Ministry of Health) HALP system – Analyzing issues, providing RCA, reviewing codes, fixing bugs and managing deployments by taking care of data privacy with standardized rules.",
                      hoverIndex: _hoverIndex,
                    ),
                    endWidget: TimelineWithoutCard(
                        title: "Senior Software Developer",
                        subtitle: "Toppan Ecquaria, Singapore",
                        dateTime: "Dec 2023 – APR 2024",
                        alignment: CrossAxisAlignment.start),
                  ),
                  BuildTimeline(
                    indexTitle: "3",
                    hoverIndex: _hoverIndex,
                    onHoverChanged: (value) {
                      setState(() {
                        _hoverIndex = value;
                      });
                    },
                    startWidget: TimelineWithoutCard(
                        title: "Software Developer",
                        subtitle: "YTL PowerSeraya, Singapore",
                        dateTime: "Dec 2022 - Dec 2023",
                        alignment: CrossAxisAlignment.end),
                    endWidget: TimelineCard(
                      indexTitle: "3",
                      content:
                          "Customize and maintain Oracle Utilities Customer Care and Billing (CC&B) system to support GENECO’s business operations. Collaborate closely with business users on billing, credit control, and batch processing activities.",
                      hoverIndex: _hoverIndex,
                    ),
                  ),
                  BuildTimeline(
                    indexTitle: "4",
                    hoverIndex: _hoverIndex,
                    onHoverChanged: (value) {
                      setState(() {
                        _hoverIndex = value;
                      });
                    },
                    startWidget: TimelineCard(
                      indexTitle: "4",
                      content:
                          "Develop and support inhouse banking products. Migration to Oracle Banking Digital Experience (OBDX) and integration with payment gateway system.",
                      hoverIndex: _hoverIndex,
                    ),
                    endWidget: TimelineWithoutCard(
                        title: "Senior Software Engineer",
                        subtitle: "Myanma Apex Bank",
                        dateTime: "Jan 2021 - Nov 2022",
                        alignment: CrossAxisAlignment.start),
                  ),
                  BuildTimeline(
                    indexTitle: "5",
                    hoverIndex: _hoverIndex,
                    onHoverChanged: (value) {
                      setState(() {
                        _hoverIndex = value;
                      });
                    },
                    startWidget: TimelineWithoutCard(
                        title: "Senior Software Engineer",
                        subtitle: "Myanmar Information Technology",
                        dateTime: "Nov 2016 - Dec 2020",
                        alignment: CrossAxisAlignment.end),
                    endWidget: TimelineCard(
                      indexTitle: "5",
                      content:
                          "Handle and support reliable solutions through innovative technologies for large local retail systems and ERP.\nProvide business insight, sales forecasting using Azure, Power BI and Power Apps",
                      hoverIndex: _hoverIndex,
                    ),
                  ),
                  BuildTimeline(
                    indexTitle: "6",
                    hoverIndex: _hoverIndex,
                    onHoverChanged: (value) {
                      setState(() {
                        _hoverIndex = value;
                      });
                    },
                    startWidget: TimelineCard(
                      indexTitle: "6",
                      content:
                          "Develop, maintain and support the customized ERP, retail systems and websites.",
                      hoverIndex: _hoverIndex,
                    ),
                    endWidget: TimelineWithoutCard(
                        title: "Junior Software Developer",
                        subtitle: "Devnet Solution Provider",
                        dateTime: "Jan 2014 - Mar 2016",
                        alignment: CrossAxisAlignment.start),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget mobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child:
              Text('Experience', style: Theme.of(context).textTheme.headline3),
        ),
        TimelineWithoutCard(
            title: "System Analyst",
            subtitle: "Creative Technology Ltd., Singapore",
            dateTime: "May 2024 – Current",
            alignment: CrossAxisAlignment.start),
        TimelineCard(
          indexTitle: "1",
          content:
              "Own and manage the full lifecycle of the enterprise Return Merchandise Authorization (RMA) system — including development, maintenance, integration, and user support for both internal and external customers. Also contribute to the development and support of other in-house systems, ensuring seamless integration between internal systems.",
          hoverIndex: "0",
        ),
        const SizedBox(
          height: 30,
        ),
        TimelineWithoutCard(
            title: "Senior Software Engineer",
            subtitle: "Toppan Ecquaria, Singapore",
            dateTime: "Dec 2023 – Apr 2024",
            alignment: CrossAxisAlignment.start),
        TimelineCard(
          indexTitle: "2",
          content:
              "Support for MOH (Ministry of Health) HALP system – Analyzing issues, providing RCA, reviewing codes, fixing bugs and managing deployments by taking care of data privacy with standardized rules.",
          hoverIndex: "0",
        ),
        const SizedBox(
          height: 30,
        ),
        TimelineWithoutCard(
            title: "Software Developer",
            subtitle: "YTL PowerSeraya - Singapore",
            dateTime: "Dec 2022 - Dec 2023",
            alignment: CrossAxisAlignment.start),
        TimelineCard(
          indexTitle: "3",
          content:
              "Customize and maintain Oracle Utilities Customer Care and Billing (CC&B) system to support GENECO’s business operations. Collaborate closely with business users on billing, credit control, and batch processing activities.",
          hoverIndex: "0",
        ),
        const SizedBox(
          height: 30,
        ),
        TimelineWithoutCard(
            title: "Senior Software Engineer",
            subtitle: "Myanma Apex Bank",
            dateTime: "Jan 2021 - Nov 2022",
            alignment: CrossAxisAlignment.start),
        TimelineCard(
          indexTitle: "4",
          content:
              "Develop and support inhouse banking products. Migration to Oracle Banking Digital Experience (OBDX) and integration with payment gateway system.",
          hoverIndex: "0",
        ),
        const SizedBox(
          height: 30,
        ),
        TimelineWithoutCard(
            title: "Senior Software Engineer",
            subtitle: "Myanmar Information Technology",
            dateTime: "Nov 2016 - Dec 2020",
            alignment: CrossAxisAlignment.start),
        TimelineCard(
          indexTitle: "5",
          content:
              "Handle and support reliable solutions through innovative technologies for large local retail systems and ERP.\nProvide business insight, sales forecasting using Azure, Power BI and Power Apps",
          hoverIndex: "0",
        ),
        const SizedBox(
          height: 30,
        ),
        TimelineWithoutCard(
            title: "Junior Software Developer",
            subtitle: "Devnet Solution Provider",
            dateTime: "Jan 2014 - Mar 2016",
            alignment: CrossAxisAlignment.start),
        TimelineCard(
          indexTitle: "6",
          content:
              "Develop, maintain and support the customized ERP, retail systems and websites.",
          hoverIndex: "0",
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
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
