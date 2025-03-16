import 'package:cash_app/data/data.dart';
import 'package:flutter/material.dart';

class BalanceAndCategory extends StatelessWidget {
  const BalanceAndCategory({
    Key? key,
    required ScrollController scrollController,
  }) : _scrollController = scrollController, super(key: key);

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.only(top: 90),
            color: Colors.white,
            child: ShaderMask(
              blendMode: BlendMode.modulate,
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFF0399a7),
                    Color(0xFF5abb39),
                  ],
                ).createShader(bounds);
              },
              child: Theme(
                data: Theme.of(context).copyWith(
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  ),
                ),
                child: GridView.count(
                  controller: _scrollController,
                  clipBehavior: Clip.none,
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  children: categories
                      .map(
                        (e) => Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: e.icon,
                                  ),
                                ),
                                Text(
                                  e.title,
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
          Container(
            width: 300,
            height: 150,
            alignment: Alignment.center,
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 5.0,
                  spreadRadius: 0.2,
                  offset: Offset(0, 3.0),
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 80,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'PHP',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.normal,
                          fontSize: 25,
                        ),
                      ),
                      Flexible(
                        flex: 80,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            'P609.05',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: Text(
                    'Available Balance',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}