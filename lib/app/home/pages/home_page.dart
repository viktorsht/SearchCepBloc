import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:search_cep/app/home/bloc/search_cep_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  SearchCepBloc searchCepBloc = Provider.of<SearchCepBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesquisador de CEP'),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('CEP'),
              ),
            ),
            const SizedBox(height: 16,),
            ElevatedButton(
              onPressed: (){
                final String text = textController.text;
                //print(text);
                searchCepBloc.add(AddSearchCepEvent(cep: text));
              },
              child: const Text('Pesquisar'),
            ),
            const SizedBox(height: 16,),
            BlocBuilder<SearchCepBloc, SearchCepState>(
              builder: (context, state){
                if(state is SearchCepErrorState){
                  return Text(state.message, style: const TextStyle(color: Colors.red),);
                }
                if(state is SearchCepLoadingState){
                  return const Expanded(child: Center(child: CircularProgressIndicator()));
                }
                state = state as SearchCepSucessState;
                if(state.data.isEmpty){
                  return Container();
                }
                return Text('Cidade: ${state.data['city']}/${state.data['state']}');
              }
            ),
          ],
        ),
      ),
    );
  }
}