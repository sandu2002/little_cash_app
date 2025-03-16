import 'package:cash_app/screens/home/activity_history.dart';
import 'package:cash_app/screens/home/balance_and_category.dart';
import 'package:cash_app/screens/home/home_appbar.dart';
import 'package:cash_app/screens/home/menu_drawer.dart';
import 'package:cash_app/screens/home/promo_banner.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: MenuDrawer(),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF0399a7),
              Color(0xFF5abb39),
            ],
          ),
        ),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            HomeAppBar(scaffoldKey: _scaffoldKey),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  BalanceAndCategory(scrollController: _scrollController),
                  PromoBanner(),
                  ActivityHistory(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}