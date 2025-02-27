import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_screen';
  
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  List<int> imagesIds = [1,2,3,4,5,6,7,8,9];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;



  @override
  void initState() {
    super.initState();
    
    scrollController.addListener(() {
      if((scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent) {
        // Load next page

        loadNextPage();
      }
    });

  }


  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  void addFiveImages() {
    final lastId = imagesIds.last;
    for (var i = 1; i <= 5; i++) {
      imagesIds.add(lastId + i);
    }
  }


  Future loadNextPage() async {
    if (isLoading) return;

    isLoading = true;

    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading = false;

    if(!isMounted) return;
    setState(() {});
    moveScrollToBottom();
  }

  Future onRefresh() async {
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));
    if( !isMounted ) return;
    isLoading = false;

    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();
    setState(() {});
  }

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 150 <= scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage('https://picsum.photos/id/${ imagesIds[index] }/500/300'),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(),
        child: isLoading 
        ? SpinPerfect(
            infinite: true,
            child: const Icon(Icons.refresh_rounded),
          )
        : FadeIn(child: const Icon(Icons.arrow_back)),
      ),
    );
  }
}