import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var list = NewsCubit.get(context).business;

        return ConditionalBuilder(
            condition: list.length > 0,
            builder: (context) => ListView.separated(
              physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildArticleItem(list[index],context),
                separatorBuilder: (context, index) => Container(
                      color: Colors.grey,
                      height: 1,
                    ),
                itemCount: 10),
            fallback: (context) => Center(child: CircularProgressIndicator()));
      },
    );
  }
}
