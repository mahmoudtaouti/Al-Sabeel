import 'package:al_sabeel/ui/core/theming/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
with SingleTickerProviderStateMixin{


  AnimationController? controller;
  Animation? sizeAnimation;
  Animation? colorAnimation;


  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(seconds: 3),vsync: this);

    sizeAnimation = SizeTween(begin: Size(82,82),end: Size(128,128)).animate(controller!);
    colorAnimation = ColorTween(begin: K_blue_200,end:Colors.white).animate(controller!);
    
    controller!.forward();
    controller!.addListener(() { setState(() {});});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller!.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorAnimation!.value,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 2.0,),
            Container(
              child: Image.asset(
                "assets/logo/logo.png",
                height:(sizeAnimation!.value as Size).height,
                width: (sizeAnimation!.value as Size).width,
              ),
            ),
            const Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("concept by taouticc",style: TextStyle(color: K_pink_200,fontWeight: FontWeight.bold,fontSize: 12),),
            ),
          ],
        ),
      ),
    );
  }
}
