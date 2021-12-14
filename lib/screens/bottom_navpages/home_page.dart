import 'package:flutter/material.dart';
import 'package:flutter_cubit/theme/colors.dart';
import 'package:flutter_cubit/widgets/app_large_text.dart';

class Homepage extends StatefulWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///Menu Text
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20),
            child: Row(
              children: [
                const Icon(Icons.menu, size: 30, color: Colors.black54),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5)
                  )
                )
              ],
            )
          ),
          const SizedBox(height: 40,),
          ///Discover Text
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Discover")),
          ///Tabbar
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                controller: _tabController,
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                tabs: const [
                  Tab(text: 'Places',),
                  Tab(text: 'Inspiration',),
                  Tab(text: 'Emotions',),
                ],
              ),
            )
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                  return Container(
                    margin: const EdgeInsets.only(right: 15, top: 10),
                  width: 200,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage("img/mountain.jpeg"),
                      fit: BoxFit.cover
                    )
                  ));
                }),
                Text("There"),
                Text("Bye")
              ],
            )
          ),
          Row(
            children:[
              AppLargeText(text: "Explore More")
            ]
          )
        ],
      ),
    );
  }
}

///Dots TabBar
class CircleTabIndicator extends Decoration{
  
  final Color color;
  double radius;
  
  CircleTabIndicator({required this.color, required this.radius});
  
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]){
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter{

  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(configuration.size!.width/2 - radius/2, configuration.size!.height-radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }

}