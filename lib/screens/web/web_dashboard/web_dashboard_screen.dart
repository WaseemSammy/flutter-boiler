import 'package:flutter/material.dart';
import 'package:my_flutter/screens/mobile/allTable/ui/alltable_screen.dart';
import 'package:my_flutter/screens/mobile/running/ui/running_screen.dart';
import 'package:my_flutter/screens/web/web_dashboard/web_home_view.dart';
import 'package:my_flutter/utils/responsive.dart';
import 'package:my_flutter/widgets/tab_controller_handler.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../widgets/content_view.dart';
import '../../../widgets/custom_tab.dart';
import '../../../widgets/custom_tab_bar.dart';

class WebDashboardScreen extends StatefulWidget {
  const WebDashboardScreen({super.key});

  @override
  State<WebDashboardScreen> createState() => _WebDashboardScreenState();
}

class _WebDashboardScreenState extends State<WebDashboardScreen> with SingleTickerProviderStateMixin {

  late TabController tabController;
  late ItemScrollController itemScrollController;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  double screenHeight=0.0;
  double screenWidth=0.0;
  double topPadding =0.0;
  double bottomPadding= 0.0;
  double sidePadding =0.0;

  List<ContentView> contentViews = [
    ContentView(
      tab: const CustomTab(title: 'Home'),
      content: const WebHomeScreem(),
    ),
    ContentView(
      tab: const CustomTab(title: 'Ordes'),
      content: const AllTableScreen(),
    ),
    ContentView(
      tab: const CustomTab(title: 'Online'),
      content: const RunningOrders(),
    )
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex : 0 ,length: contentViews.length, vsync: this);
    itemScrollController = ItemScrollController();
  }
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    topPadding = screenHeight * 0.05;
    bottomPadding = screenHeight * 0.03;
    sidePadding = screenWidth * 0.05;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      key: scaffoldKey,
      endDrawer: drawer(),
      body: Responsive(
           mobile: mobileView(),
           tablet: getUi(),
           desktop: getUi()),
    );
  }


  Widget getUi(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Tab Bar
        Container(
          color: Colors.white,
          height: screenHeight * 0.05,
          child: CustomTabBar(
              controller: tabController,
              tabs: contentViews.map((e) => e.tab).toList()),
        ),

        /// Tab Bar View
        Expanded(
          child: Container(
            child: TabControllerHandler(
              tabController: tabController,
              child: TabBarView(
                controller: tabController,
                children: contentViews.map((e) => e.content).toList(),
              ),
            ),
          ),
        ),

        /// Bottom Bar

      ],
    );

    /**/
  }
  Widget mobileView() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          IconButton(
              iconSize: screenHeight * 0.05,
              icon: const Icon(Icons.menu_rounded),
              color: Colors.black,
              splashColor: Colors.transparent,
              onPressed: () {
                print("drawer");
                scaffoldKey.currentState?.openEndDrawer();
              }),
          const Expanded(child: WebHomeScreem())
        ],
      ),
    );
  }

  Widget drawer() {
    return SizedBox(
      width: screenWidth * 0.5,
      child: Drawer(
        child: ListView(
          children: [Container(height: screenHeight * 0.1)] +
              contentViews
                  .map((e) => Container(
                child: ListTile(
                  title: Text(
                    e.tab.title,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  onTap: () {
                    print("drwe");
                    itemScrollController.scrollTo(
                        index: contentViews.indexOf(e),
                        duration: const Duration(milliseconds: 300));
                    Navigator.pop(context);
                  },
                ),
              ))
                  .toList(),
        ),
      ),
    );
  }
}
