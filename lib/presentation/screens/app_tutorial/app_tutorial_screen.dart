import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo('Busca la comida', 'Culpa consequat cillum ullamco ad anim ipsum ea.', 'assets/images/1.png'),
  SlideInfo('Entrega rapida', 'Tempor nostrud sint consequat id aliqua id ad pariatur nulla.', 'assets/images/2.png'),
  SlideInfo('Disfruta la comida', 'Esse fugiat velit in nostrud ipsum aliquip non dolor ut deserunt quis ullamco ea minim.', 'assets/images/3.png'),
];


class TutorialScreen extends StatefulWidget {
  static const String name = 'tutorial_screen';
  
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;


  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;

      if (!endReached && page >= slides.length - 1.5) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides.map(
              (slideData) => _Slide(title: slideData.title, caption: slideData.caption, imageUrl: slideData.imageUrl)
            ).toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Salir'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ),
          endReached ? Positioned(
            bottom: 30,
            right: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(milliseconds: 500),
              child: FilledButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Comenzar'),
              ),
            )
          ) : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String title;
  final String caption;
  final String imageUrl;
  
  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle,),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle)
          ],
        ),
      ),
    );
  }
}