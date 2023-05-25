import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcsensor/app/tcsensor/presenter/cubits/fabricantes_get_cubit/get_fabricantes_cubit.dart';

class FabricantesPage extends StatelessWidget {
  const FabricantesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          BlocBuilder<GetFabricantesCubit, FabricantesGetState>(
            builder: (context, state) {
              if (context.watch<GetFabricantesCubit>().state.status ==
                  FabricantesStatus.error) {
                return Center(
                    child: Text(
                        'Erro : ${context.watch<GetFabricantesCubit>().state.error}'));
              }

              if (state.fabricantes.isEmpty ||
                  state.status == FabricantesStatus.initial) {
                return const Center(child: Text('Não a nenhum pokemon'));
              }

              if (state.status == FabricantesStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              }

              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                          ),
                          scrollDirection: Axis.vertical,
                          itemCount: state.fabricantes.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Text(state.fabricantes[index].nome);
                          },
                        ),
                      ),
                      Expanded(child: FloatingActionButton(onPressed: () {
                        context
                            .read<GetFabricantesCubit>()
                            .getFabricantesSqlLite();
                      })),
                    ],
                  ),
                ),
              );
            },
          ),
        ]),
      ),
    );
  }
}
