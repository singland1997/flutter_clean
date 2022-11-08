import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean/application/core/services/theme_service.dart';
import 'package:flutter_clean/application/screens/home/bloc/advice_bloc.dart';
import 'package:flutter_clean/application/screens/home/widgets/advice_field.dart';
import 'package:flutter_clean/application/screens/home/widgets/custom_button.dart';
import 'package:flutter_clean/application/screens/home/widgets/error_message.dart';
import 'package:flutter_clean/injection.dart';
import 'package:provider/provider.dart';

class HomeScreenWrapperProvider extends StatelessWidget {
  const HomeScreenWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AdviceBloc>(),
      child: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clean'),
        centerTitle: true,
        actions: [
          Provider.of<ThemeService>(context).isDark
              ? const Icon(Icons.dark_mode)
              : const Icon(Icons.light_mode),
          Switch(
            value: Provider.of<ThemeService>(context).isDark,
            onChanged: (_) {
              Provider.of<ThemeService>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: BlocBuilder<AdviceBloc, AdviceState>(
                  builder: (context, state) {
                    if (state is AdviceInitial) {
                      return Text(
                        'Your Advice is waiting for you!',
                        style: Theme.of(context).textTheme.headline5,
                      );
                    }
                    if (state is AdviceLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is AdviceLoaded) {
                      return AdviceField(
                        advice: state.advice,
                      );
                    }
                    if (state is AdviceError) {
                      return ErrorMessage(message: state.message);
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ),
            const CustomButton(),
          ],
        ),
      ),
    );
  }
}
