import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view/web_view.dart';

Widget buildArticleItem(articles, context) => InkWell(
  onTap: (){

 //   navigateTo(context, WebViewScreen(articles['url']));
  },
  child:   Padding(



        padding: const EdgeInsets.all(20.0),



        child: Row(



          children: [



            Container(



              width: 120.0,



              height: 120.0,



              decoration: BoxDecoration(



                  borderRadius: BorderRadius.circular(10.0),



                  image: DecorationImage(



                      fit: BoxFit.cover,



                      image: NetworkImage('${articles['urlToImage']}'))),



            ),



            SizedBox(



              width: 15.0,



            ),



            Expanded(



              child: Container(



                height: 120.0,



                child: Column(



                  crossAxisAlignment: CrossAxisAlignment.start,



                  children: [



                    Expanded(



                      child: Text(



                        '${articles['title']}',



                        style: Theme.of(context).textTheme.bodyText1,



                        maxLines: 3,



                        overflow: TextOverflow.ellipsis,



                      ),



                    ),



                    Text(



                      '${articles['publishedAt']}',



                      style: TextStyle(color: Colors.grey),



                    )



                  ],



                ),



              ),



            )



          ],



        ),



      ),
);

void navigateTo(context, Widget widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

Widget articleBuilder({required list, required context}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
          itemBuilder: (context, index) =>
              buildArticleItem(list[index], context),
          separatorBuilder: (context, index) => Container(
                height: 1,
                color: Colors.grey,
              ),
          itemCount: 10),
      fallback: (context) => Center(child: CircularProgressIndicator()),
    );
