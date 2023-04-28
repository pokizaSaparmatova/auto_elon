import 'package:dars12/pages/region/region_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/form_bloc.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  Widget get page {
    return BlocProvider(
      create: (context) => FormBloc(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FormBloc>();
    return BlocBuilder<FormBloc, FormjonState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text("FormPage")),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  readOnly: true,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return RegionPage(
                          callback: (region) {
                            bloc.add(FormChangedEvent(region: region));
                          },
                        ).page;
                      },
                    ));
                  },
                  decoration: InputDecoration(
                    hintText:
                        state.region.id == 0 ? "Regions" : state.region.title,
                    hintStyle: TextStyle(
                      color: state.region.id == 0 ? Colors.grey : Colors.black,
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: state.district.id == 0
                        ? "Districts"
                        : state.district.title,
                    hintStyle: TextStyle(
                      color:
                          state.district.id == 0 ? Colors.grey : Colors.black,
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
