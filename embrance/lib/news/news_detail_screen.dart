import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'news_controller.dart';



class NewsDetailView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;

    return GetBuilder<NewsController>(init: Get.put<NewsController>(NewsController()),builder: (controller){
      controller.checkArguments();
      return Obx(
        ()=>controller.isDataLoadingTwo.value ? CircularProgressIndicator():Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(backgroundColor: Colors.green,title: Text("Article Details",style: TextStyle(color: Colors.white),),leading: IconButton(
              icon: const Icon(Icons.arrow_back,color: Colors.white),
              onPressed: () => Get.back(),
            ),),
            body: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl:controller.articles.urlToImage,
                      placeholder: (context, url) => Icon(Icons.downloading),
                      errorWidget: (context, url, error) => new Icon(Icons.error),
                    ),
                    Container(
                      height: 50,
                      width: width,
                      alignment: Alignment.centerLeft,
                      color: Colors.grey.shade200,
                      child: Padding(
                        padding: const EdgeInsets.only(left:10.0),
                        child: Text("Title",textAlign: TextAlign.start,style: TextStyle(color: Colors.black54,fontSize: 18)),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0,right: 10,),
                      child: Row(
                        children: [
                          Expanded(child: Text(controller.articles.title,style: TextStyle(color: Colors.black87,overflow: TextOverflow.ellipsis,fontWeight: FontWeight.bold),maxLines: 3,)),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 50,
                      width: width,
                      alignment: Alignment.centerLeft,
                      color: Colors.grey.shade200,
                      child: Padding(
                        padding: const EdgeInsets.only(left:10.0),
                        child: Text("Link",textAlign: TextAlign.start,style: TextStyle(color: Colors.grey,fontSize: 18,)),
                      ),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: ()=>controller.launchURL(controller.articles.url),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10,),
                        child: Row(
                          children: [
                            Expanded(child: Text(controller.articles.url,style: TextStyle(color: Colors.blue,overflow: TextOverflow.ellipsis,fontWeight: FontWeight.bold),maxLines: 3,)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 50,
                      width: width,
                      alignment: Alignment.centerLeft,
                      color: Colors.grey.shade200,
                      child: Padding(
                        padding: const EdgeInsets.only(left:10.0),
                        child: Text("Description",textAlign: TextAlign.start,style: TextStyle(color: Colors.black54,fontSize: 18)),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0,right: 10),
                      child: Row(
                        children: [
                          Expanded(child: Text(controller.articles.description,style: TextStyle(color: Colors.black,overflow: TextOverflow.ellipsis,fontWeight: FontWeight.bold),maxLines: 100,)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
        ),
      );
    });
    }
}
