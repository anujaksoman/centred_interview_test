import 'package:centered_interview_test/bloc/search_bloc.dart';
import 'package:centered_interview_test/model/image_model.dart';
import 'package:centered_interview_test/search_details/image_details.dart';
import 'package:centered_interview_test/search_details/image_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SearchListComponent extends StatefulWidget {
  const SearchListComponent({Key? key}) : super(key: key);

  @override
  _SearchListComponentState createState() => _SearchListComponentState();
}

class _SearchListComponentState extends State<SearchListComponent> {
  final TextEditingController searchController = new TextEditingController();
  late SearchImageBloc searchImageBloc;
  String apiKeyValue = "27331115-2db04e9d2d940491a665c95d6";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex:2,
            child: Container(
              padding: EdgeInsets.only(top: 60, left: 10, right: 10),
              child: TextFormField(
                cursorColor: Color(0xFFEAAA00),
                style: TextStyle(color: Colors.black, fontSize: 14),
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  labelText: "Search*",
                  labelStyle: TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Color(0xFFE1DFDD), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Color(0xFFE1DFDD), width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.blue)),
                  contentPadding:
                      EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
                ),
                controller: searchController,
                onFieldSubmitted: (value) {
                  searchImageBloc = BlocProvider.of<SearchImageBloc>(context);
                  searchImageBloc
                      .add(fetchSearchList(apiKeyValue, searchController.text));
                },
              ),
            ),
          ),
          Expanded(
            flex:10,
            child: Container(
              child: BlocBuilder<SearchImageBloc, SearchState>(
                  builder: (context, state) {
                 if (state is SearchLoadingState) {
                  return buildLoading1();
                } else if (state is SearchLoadedState) {
                  return gridImageDetails(imageList: state.searchData);
                } else if (state is SearchErrorState) {
                  print("error state =${state.message}");
                  return Container();
                } else {
                  return Container();
                }
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget gridImageDetails({required SearchModel imageList}) {
    return imageList.hits!.length>0?GridView.builder(
      itemCount: imageList.hits?.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.69),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new ImageDetails(
                      image: imageList.hits![index].userImageURL)));
            },
            child: ImageRow(
              imageData: imageList.hits![index],
            ));
      },
    ):
    Container(
        alignment: Alignment.topCenter,
        child:Text("No Image Found",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),)
    );
  }

  buildLoading1() {
    return Container(
        child: SpinKitCircle(
      color: Colors.blue,
      size: 20,
    ));
  }
}
