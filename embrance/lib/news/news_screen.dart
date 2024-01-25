import 'package:cached_network_image/cached_network_image.dart';
import 'package:embrance/news/news_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class NewsView extends GetView<NewsController>{

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=> NewsController());

    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width:width,
                color: Colors.green,
                height: 50,
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("News Feed",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 18)),
                      InkWell(onTap: ()=> controller.loadLatestNews(),child: Icon(Icons.refresh,color: Colors.white,)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 50,
                width: width,
                alignment: Alignment.centerLeft,
                color: Colors.grey.shade200,
                child: Padding(
                  padding: const EdgeInsets.only(left:10.0),
                  child: Text("Latest News",textAlign: TextAlign.start,style: TextStyle(color: Colors.black54,fontSize: 18)),
                ),
              ),
              Container(
                height: 200,
                alignment: Alignment.center,
                child: Obx(
                      ()=> controller.isDataLoading.value ? CircularProgressIndicator():
                  ListView.builder(
                    reverse: false,
                    controller: controller.scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.useProfile.articles.length,
                    shrinkWrap: true,
                    addRepaintBoundaries: true,
                    padding: EdgeInsets.only(top: 10,bottom: 10),
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index){
                      return InkWell(
                        onTap: (){
                          //Get.toNamed(AppRoutes.NEWS_ROUTE+AppRoutes.NEWS_DETAIL_ROUTE,arguments:controller.useProfile.articles[index]);
                          controller.launchURL(controller.useProfile.articles[index].url);
                        },
                        child: Container(
                          width: 250,
                          padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                          child: Card(
                            surfaceTintColor: Colors.white,
                            elevation: 10,
                            shadowColor: Colors.black54,
                            child: ClipRRect(borderRadius: BorderRadius.circular(10.0)
                              ,child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl:controller.useProfile.articles[index].urlToImage==null?"https://demofree.sirv.com/products/123456/123456.jpg?profile=error-example":controller.useProfile.articles[index].urlToImage,
                                placeholder: (context, url) => Icon(Icons.downloading),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                height: 50,
                width: width,
                alignment: Alignment.centerLeft,
                color: Colors.grey.shade200,
                child: Padding(
                  padding: const EdgeInsets.only(left:10.0,),
                  child: Text("Interesting Articles",textAlign: TextAlign.start,style: TextStyle(color: Colors.black54,fontSize: 18)),
                ),
              ),
              SizedBox(height: 10,),
              Expanded(child: Container(
                alignment: Alignment.center,
                child: Obx(
                      ()=> controller.isDataLoading.value ? CircularProgressIndicator():ListView.builder(
                    reverse: false,
                    controller: controller.scrollControllerTwo,
                    scrollDirection: Axis.vertical,
                    itemCount: controller.latestArticles.articles.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 10,bottom: 10),
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index){
                      return InkWell(
                        onTap: (){
                          //Get.toNamed(AppRoutes.NEWS_ROUTE+AppRoutes.NEWS_DETAIL_ROUTE,arguments:controller.latestArticles.articles[index]);
                          controller.launchURL(controller.latestArticles.articles[index].url);
                        },
                        child: Container(
                          height: 130,
                          width: 100,
                          padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                flex:1,
                                child: Card(
                                  surfaceTintColor: Colors.white,
                                  elevation: 10,
                                  shadowColor: Colors.grey,
                                  child: ClipRRect(borderRadius: BorderRadius.circular(5.0)
                                      ,child: CachedNetworkImage(
                                        alignment: Alignment.center,
                                        height: 130,
                                        fit: BoxFit.cover,
                                        imageUrl:controller.latestArticles.articles[index].urlToImage==null ? "https://demofree.sirv.com/products/123456/123456.jpg?profile=error-example":controller.latestArticles.articles[index].urlToImage,
                                        placeholder: (context, url) => const Icon(Icons.downloading),
                                        errorWidget: (context, url, error) => Icon(Icons.error),
                                      )
                                  ),
                                ),
                              ),
                              Expanded(flex:2,child: Padding(
                                padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                child: Text(controller.latestArticles.articles[index].title,maxLines: 3,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.blue),),
                              ))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),)
            ],
          ),),
      ),
    );
    // return GetBuilder<NewsController>(init: Get.put<NewsController>(NewsController()),builder: (controller){
    //
    // });

    //Get.lazyPut(() => NewsController())


  }

}