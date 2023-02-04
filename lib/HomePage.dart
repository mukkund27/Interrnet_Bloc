import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_bloc/internet_bloc/internet_bloc.dart';
import 'package:internet_bloc/internet_bloc/internet_event.dart';
import 'package:internet_bloc/internet_bloc/internet_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //BlocBuilder use only ui change
      //BlocListener use only background listen
      //BlocConsumer use both of

      body: BlocConsumer<InternetBloc, InternetState>(
        listener: (context, state) {
          if (state is InternetGainedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text("Connected"),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is InternetLostState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text("Disconnected"),
              backgroundColor: Colors.red,
            ));
          }
        },
        builder: (BuildContext context, state) {
          if (state is InternetGainedState) {
            return const Center(child: Text("Connected"));
          } else if (state is InternetLostState) {
            return const Center(
              child: Text("Disconnected"),
            );
          } else {
            return const Center(
              child: Text("Loading"),
            );
          }
        },
      ),
    );
  }
}
