import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/Providers/item_scroll_provider.dart';
import 'package:portfolio/contact_section.dart';
import 'package:portfolio/education_section.dart';
import 'package:portfolio/experience_section.dart';
import 'package:portfolio/footer_section.dart';
import 'package:portfolio/project_section.dart';
import 'package:portfolio/widgets/responsive.dart';
import 'package:portfolio/services_section.dart';
import 'package:portfolio/skill_section.dart';
import 'package:portfolio/home_section.dart';
import 'package:portfolio/widgets/navbar.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ItemScrollProvider()),
      ],
      child: MaterialApp(
        title: "Khant Ko Ko's Portfolio",
        theme: ThemeData(
          //primarySwatch: Colors.blue,
          primaryColor: Color(0xff00a78e),
          textTheme: TextTheme(
            headline3: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600,
              fontSize: 30,
              color: Color(0xff00a78e),
            ),
            headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Color(0xff00a78e),
            ),
          ),
        ),
        home: MyHomePage(title: 'Khant Ko Ko'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ItemScrollController _itemScrollController = new ItemScrollController();
  final _itemPositionListener = ItemPositionsListener.create();
  bool _isCollapse = true;

  Widget scrollablePositionList() {
    return Container(
      child: ScrollablePositionedList.builder(
        itemScrollController: _itemScrollController,
        itemPositionsListener: _itemPositionListener,
        itemCount: 6,
        itemBuilder: (_, i) {
          if (i == 0) return const HomeSection();
          if (i == 1)
            return Container(
              width: double.infinity,
              child: Column(
                children: [
                  const SkillSection(),
                  const ServicesSection(),
                ],
              ),
            );
          if (i == 2) return const EducationSection();
          if (i == 3) return const ExperienceSection();
          if (i == 4) return const ProjectSection();
          if (i == 5) return const FooterSection();
          return Container();
        },
      ),
    );
  }

  Widget collapseMenuState() {
    return Responsive.isDesktop(context) == false
        ? Container(
            padding: const EdgeInsets.only(right: 20, top: 8),
            alignment: Alignment.topRight,
            child: InkWell(
              hoverColor: Colors.transparent,
              child: Container(
                height: 50,
                alignment: Alignment.topRight,
                child: Icon(
                  _isCollapse ? Icons.menu_outlined : Icons.close_sharp,
                  size: 40,
                  color: Color(0xff293651),
                ),
              ),
              onTap: () {
                setState(() {
                  _isCollapse = !_isCollapse;
                });
              },
            ),
          )
        : Container();
  }

  Widget expandMenuState() {
    return Responsive.isDesktop(context) == false && !_isCollapse
        ? Positioned(
            top: 0,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 250,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: NavBar(
                itemScrollController: _itemScrollController,
              ),
            ),
          )
        : Container();
  }

  Widget body() {
    return Stack(
      children: [
        scrollablePositionList(),
        expandMenuState(),
      ],
    );
  }

  @override
  void initState() {
    _itemPositionListener.itemPositions.addListener(positionListScrollListener);
    super.initState();
  }

  @override
  void dispose() {
    // _itemPositionListener.itemPositions
    //     .removeListener(positionListScrollListener);
    super.dispose();
  }

  positionListScrollListener() {
    var index =
        _itemPositionListener.itemPositions.value.map((e) => e.index).toList();

    var recentIndex =
        Provider.of<ItemScrollProvider>(context, listen: false).visibleItems;

    if (listEquals(index, recentIndex) == false) {
      Provider.of<ItemScrollProvider>(context, listen: false)
          .setVisibleItems(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var lrMargin = mediaQuery.width / 5;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: mediaQuery.width >= 1100
          ? AppBar(
              backgroundColor: Colors.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: lrMargin * 1.3,
                  ),
                  // SizedBox(
                  //   child: Text(
                  //     mediaQuery.width.toString(),
                  //     style: Theme.of(context).textTheme.headline6!,
                  //   ),
                  // ),
                  NavBar(
                    itemScrollController: _itemScrollController,
                  ),
                  Container(
                    width: lrMargin,
                  ),
                ],
              ),
            )
          : AppBar(
              actions: [
                collapseMenuState(),
              ],
              backgroundColor: Colors.white,
            ),
      body: SafeArea(
        child: body(),
      ),
      floatingActionButton:
          Provider.of<ItemScrollProvider>(context).getLastItem() != 0
              ? FloatingActionButton(
                  child: Icon(Icons.arrow_upward, color: Colors.white),
                  backgroundColor: Theme.of(context).primaryColor,
                  onPressed: () {
                    _itemScrollController.scrollTo(
                      index: 0,
                      duration: Duration(seconds: 1),
                      curve: Curves.fastOutSlowIn,
                    );
                  },
                )
              : null,
    );
  }
}
