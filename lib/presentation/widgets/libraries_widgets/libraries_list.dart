
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/libraries_bloc/libraries_bloc.dart';
import 'package:flutter_internship_2024_app/presentation/widgets/card_widget.dart';

class LibrariesList extends StatefulWidget{
  const LibrariesList({super.key});

  @override
  State<LibrariesList> createState() {
  return _LibrariesListState();
  }

}

class _LibrariesListState extends State<LibrariesList>{


  @override
  void initState() {
  
    super.initState();
    context.read<LibrariesBloc>().add(LibrairesFetched());
  }

  @override
  Widget build(BuildContext context) {
   return BlocBuilder<LibrariesBloc,LibrariesState>(builder: (context,state){
    if(state is  LibrariesLoading){
        return  const Center(
          child: CircularProgressIndicator(),
        );
    }  

    if(state is LibrariesSuccess){
      final data= state.libraries;
      return Center(
        child: ListView.builder(
          itemCount: state.libraries.length,
          itemBuilder: (context,index){
            return CardWidget(color: Colors.yellow, onTap: () {  },
            child:
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [ Text(data[index].name!),
                  const SizedBox(height: 3,),
                  Row(children: [
                    Text(data[index].latestReleaseNumber != null ? data[index].latestReleaseNumber.toString() : ''),
                    //Text(data[index].keywords != null ? data[index].keywords.join(',')  : ''),
                    Text(data[index].keywords?.sublist(0,2).join(',') ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,),
                   ],)
                  ]
                  ),
              )  
            );
          }),
      );
    }
    if(state is LibrariesFailure){
      return Center(
        child: Text(state.error),
      );
    }
    return const SizedBox();
   });
  }
  
}