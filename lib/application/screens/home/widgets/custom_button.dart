import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean/application/screens/home/bloc/advice_bloc.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 50,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 20,
        ),
        onPressed: () {
          BlocProvider.of<AdviceBloc>(context).add(AdviceRequestedEvent());
        },
        child: const Text('Get Advice'),
      ),
    );
  }
}
