import 'package:flutter/material.dart';
import 'package:portfolio/Providers/item_scroll_provider.dart';
import 'package:portfolio/responsive.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    Key? key,
    required this.itemScrollController,
  }) : super(key: key);

  final ItemScrollController itemScrollController;

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _hoverIndex = -1;

  void _animateToIndex(int index) {
    widget.itemScrollController.scrollTo(
      index: index,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  Widget _hSpacer() {
    return SizedBox(
      width: 40,
    );
  }

  Widget _vSpacer() {
    return SizedBox(
      height: 20,
    );
  }

  Widget otherNavbar(context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          menuItem(index: 0, text: 'Home'),
          _vSpacer(),
          menuItem(index: 1, text: 'About'),
          _vSpacer(),
          menuItem(index: 2, text: 'Education'),
          _vSpacer(),
          menuItem(index: 3, text: 'Experience'),
          _vSpacer(),
          menuItem(index: 4, text: 'Contact'),
        ],
      ),
    );
  }

  onMenuItemClick(int index) {
    _animateToIndex(index);
  }

  onHover(int index, bool isHover) {
    setState(() {
      if (isHover)
        _hoverIndex = index;
      else
        _hoverIndex = -1;
    });
  }

  Widget menuItem(
      {required String text, required int index, Function? callback}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (e) {
        onHover(index, true);
      },
      onExit: (e) {
        onHover(index, false);
      },
      child: GestureDetector(
        onTap: () {
          onMenuItemClick(index);
        },
        child: Text(
          text,
          style: (_hoverIndex == index ||
                  Provider.of<ItemScrollProvider>(context, listen: true)
                          .getFirstItem() ==
                      index)
              ? Theme.of(context).textTheme.headline6
              : Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Color(0xff293651)),
        ),
      ),
    );
  }

  Widget desktopAndTabletNavbar(context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          menuItem(index: 0, text: 'Home'),
          _hSpacer(),
          menuItem(index: 1, text: 'About'),
          _hSpacer(),
          menuItem(index: 2, text: 'Education'),
          _hSpacer(),
          menuItem(index: 3, text: 'Experience'),
          _hSpacer(),
          menuItem(index: 4, text: 'Contact'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: desktopAndTabletNavbar(context),
      tablet: otherNavbar(context),
      mobile: otherNavbar(context),
    );
  }
}
