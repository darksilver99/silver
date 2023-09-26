import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:page_transition/page_transition.dart';
import 'package:silver/flutter_flow/flutter_flow_expanded_image_view.dart';
import 'package:silver/flutter_flow/flutter_flow_theme.dart';
class DataPost extends StatefulWidget {
  const DataPost({Key? key}) : super(key: key);

  @override
  State<DataPost> createState() => _DataPostState();
}

class _DataPostState extends State<DataPost> {

  CarouselController? carouselController;

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      getData();
    });
  }



  List<Widget> carouselItems = [];
  int _currentIndex = 0;

  getData() {
    carouselItems = [
      InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: FlutterFlowExpandedImageView(
                image: Image.network(
                  'https://images.unsplash.com/photo-1551815470-2a7a8ce73ded?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw4fHxiYW5mZnxlbnwwfHx8fDE2OTU2NDE0NDl8MA&ixlib=rb-4.0.3&q=80&w=1080',
                  fit: BoxFit.contain,
                ),
                allowRotation: false,
                tag: 'imageTag1',
                useHeroAnimation: true,
              ),
            ),
          );
        },
        child: Hero(
          tag: 'imageTag1',
          transitionOnUserGestures: true,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Image.network(
              'https://images.unsplash.com/photo-1551815470-2a7a8ce73ded?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw4fHxiYW5mZnxlbnwwfHx8fDE2OTU2NDE0NDl8MA&ixlib=rb-4.0.3&q=80&w=1080',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: FlutterFlowExpandedImageView(
                image: Image.network(
                  'https://picsum.photos/seed/279/600',
                  fit: BoxFit.contain,
                ),
                allowRotation: false,
                tag: 'imageTag2',
                useHeroAnimation: true,
              ),
            ),
          );
        },
        child: Hero(
          tag: 'imageTag2',
          transitionOnUserGestures: true,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Image.network(
              'https://picsum.photos/seed/279/600',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: FlutterFlowExpandedImageView(
                image: Image.network(
                  'https://images.unsplash.com/photo-1602096922439-c4fd7b8bbdc9?crop=entropy&cs=srgb&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxtb25ldHxlbnwwfHx8fDE2OTU2NjA4MDV8MA&ixlib=rb-4.0.3&q=85',
                  fit: BoxFit.contain,
                ),
                allowRotation: false,
                tag: 'imageTag3',
                useHeroAnimation: true,
              ),
            ),
          );
        },
        child: Hero(
          tag: 'imageTag3',
          transitionOnUserGestures: true,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Image.network(
              'https://images.unsplash.com/photo-1602096922439-c4fd7b8bbdc9?crop=entropy&cs=srgb&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxtb25ldHxlbnwwfHx8fDE2OTU2NjA4MDV8MA&ixlib=rb-4.0.3&q=85',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: FlutterFlowExpandedImageView(
                image: Image.network(
                  'https://images.unsplash.com/photo-1607419726991-5fc7e74cda67?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxjeWJlcnB1bmt8ZW58MHx8fHwxNjk1NjUyNjk2fDA&ixlib=rb-4.0.3&q=80&w=400',
                  fit: BoxFit.contain,
                ),
                allowRotation: false,
                tag: 'imageTag4',
                useHeroAnimation: true,
              ),
            ),
          );
        },
        child: Hero(
          tag: 'imageTag4',
          transitionOnUserGestures: true,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Image.network(
              'https://images.unsplash.com/photo-1607419726991-5fc7e74cda67?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxjeWJlcnB1bmt8ZW58MHx8fHwxNjk1NjUyNjk2fDA&ixlib=rb-4.0.3&q=80&w=400',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 500,
          child: CarouselSlider(
            items: carouselItems,
            carouselController: carouselController ??=
                CarouselController(),
            options: CarouselOptions(
              initialPage: 1,
              viewportFraction: 1,
              disableCenter: true,
              enlargeCenterPage: true,
              enlargeFactor: 0.25,
              enableInfiniteScroll: true,
              scrollDirection: Axis.horizontal,
              autoPlay: false,
              onPageChanged: (index, _) {
                setState(() {
                  _currentIndex = index; // Update the current index when the page changes
                });
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: carouselItems.map((item) {
              int index = carouselItems.indexOf(item);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? Colors.blue : Colors.grey,
                ),
              );
            }).toList(),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 40,
                height: 40,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  'https://picsum.photos/seed/443/600',
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                  child: Text(
                    'Hello World',
                    style: FlutterFlowTheme
                        .of(context)
                        .bodyMedium
                        .override(
                      fontFamily: 'Montserrat',
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              Icon(
                Icons.favorite_border,
                color: FlutterFlowTheme
                    .of(context)
                    .secondaryText,
                size: 36,
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1,
          color: FlutterFlowTheme
              .of(context)
              .accent4,
        ),
      ],
    );
  }
}
