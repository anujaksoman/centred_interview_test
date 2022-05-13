

import 'package:centered_interview_test/bloc/search_bloc.dart';
import 'package:centered_interview_test/search_details/search_list_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context) => SearchImageBloc(context: context),
          child: SearchListComponent()
      ),
    );
  }
}
