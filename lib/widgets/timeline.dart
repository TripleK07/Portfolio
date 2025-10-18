import 'package:flutter/material.dart';
import 'package:portfolio/widgets/icon_indicator.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineCard extends StatelessWidget {
  final String indexTitle;
  final String content;
  final String hoverIndex;

  TimelineCard({
    Key? key,
    required this.indexTitle,
    required this.content,
    required this.hoverIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color fillColor = hoverIndex == indexTitle
        ? Theme.of(context).primaryColor
        : Colors.white;
    Color textColor =
        hoverIndex == indexTitle ? Colors.white : Colors.grey.shade600;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: fillColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        content,
        style: Theme.of(context).textTheme.headline6?.copyWith(
              color: textColor,
            ),
      ),
    );
  }
}

class TimelineWithoutCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String dateTime;
  final CrossAxisAlignment alignment;

  TimelineWithoutCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.dateTime,
    required this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        crossAxisAlignment: alignment,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline3
                ?.copyWith(color: Colors.black.withOpacity(0.7)),
            textAlign: (alignment == CrossAxisAlignment.end)
                ? TextAlign.end
                : TextAlign.start,
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.headline6,
            textAlign: (alignment == CrossAxisAlignment.end)
                ? TextAlign.end
                : TextAlign.start,
          ),
          const SizedBox(height: 10),
          Text(
            dateTime,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}

class BuildTimeline extends StatelessWidget {
  final String indexTitle;
  final Widget startWidget;
  final Widget endWidget;
  final String hoverIndex;

  // Instead of ValueChanged<String>, use Function(String)
  final Function(String) onHoverChanged;

  BuildTimeline({
    Key? key,
    required this.indexTitle,
    required this.startWidget,
    required this.endWidget,
    required this.hoverIndex,
    required this.onHoverChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color fillColor = hoverIndex == indexTitle
        ? Theme.of(context).primaryColor
        : Colors.white;
    Color textColor = hoverIndex == indexTitle
        ? Colors.white
        : Theme.of(context).primaryColor;

    return MouseRegion(
      onEnter: (_) => onHoverChanged(indexTitle),
      onExit: (_) => onHoverChanged(""),
      child: Container(
        height: 220,
        width: 900,
        child: TimelineTile(
          axis: TimelineAxis.vertical,
          alignment: TimelineAlign.center,
          indicatorStyle: IndicatorStyle(
            color: Theme.of(context).primaryColor,
            indicator: IconIndicator(
              title: '',
              size: 20,
              fillColor: fillColor,
              textColor: textColor,
            ),
            height: 20,
            width: 20,
          ),
          beforeLineStyle: LineStyle(
            color: Theme.of(context).primaryColor,
            thickness: 2,
          ),
          startChild: startWidget,
          endChild: endWidget,
        ),
      ),
    );
  }
}
