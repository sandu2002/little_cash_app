import 'package:cash_app/utils/math_helper.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
    required GlobalKey<ScaffoldState> scaffoldKey,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      pinned: true,
      expandedHeight: 90,
      flexibleSpace: LayoutBuilder(builder: (context, constraints) {
        double collapsedSize = MediaQuery.of(context).padding.top + kToolbarHeight;
        double opacityHeight = MathHelper.valToNewRange(
            currentValue: constraints.biggest.height,
            oldMin: collapsedSize,
            oldMax: 90 + MediaQuery.of(context).padding.top,
            newMin: 0.0,
            newMax: 1.0);
        bool isCollapsed = constraints.biggest.height == collapsedSize;
        return Container(
          decoration: isCollapsed
              ? BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFF0399a7),
                      Color(0xFF5abb39),
                    ],
                  ),
                )
              : BoxDecoration(),
          child: isCollapsed
              ? FlexibleSpaceBar(
                  centerTitle: true,
                  title: Icon(
                    Icons.no_backpack_rounded,
                    color: Colors.white,
                  ),
                )
              : Opacity(
                  opacity: opacityHeight,
                  child: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      'SUAV E-Cash',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
        );
      }),
      leading: IconButton(
        onPressed: () {
          _scaffoldKey.currentState!.openDrawer();
        },
        icon: Icon(Icons.account_circle_outlined),
      ),
      actions: [
        Center(
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.white,
                    style: BorderStyle.solid,
                    width: 1.0,
                  ),
                  left: BorderSide(
                    color: Colors.white,
                    style: BorderStyle.solid,
                    width: 1.0,
                  ),
                  bottom: BorderSide(
                    color: Colors.white,
                    style: BorderStyle.solid,
                    width: 1.0,
                  ),
                  right: BorderSide.none,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.bakery_dining),
                  Text('Rewards'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}