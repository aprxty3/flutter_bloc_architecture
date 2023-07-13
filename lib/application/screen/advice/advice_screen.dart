import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/application/core/service/theme_service.dart';
import 'package:flutter_bloc_architecture/application/screen/advice/bloc/advice_bloc.dart';
import 'package:flutter_bloc_architecture/application/screen/advice/widgets/advice_field.dart';
import 'package:flutter_bloc_architecture/application/screen/advice/widgets/custom_button.dart';
import 'package:flutter_bloc_architecture/application/screen/advice/widgets/erro_message.dart';
import 'package:provider/provider.dart';

class AdviceScreenWrapperProvider extends StatelessWidget {
  const AdviceScreenWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdviceBloc(),
      child: AdviceScreen(),
    );
  }
}

class AdviceScreen extends StatelessWidget {
  const AdviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Advice Screen',
          style: themeData.textTheme.headline1,
        ),
        centerTitle: true,
        actions: [
          Switch(
            value: Provider.of<ThemeService>(context).isDarkModeOn,
            onChanged: (value) =>
                Provider.of<ThemeService>(context, listen: false).toogleTheme(),
          )
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
                        'Your Advice is Waiting',
                        style: themeData.textTheme.headline1,
                        textAlign: TextAlign.center,
                      );
                    } else if (state is AdviceStateLoading) {
                      return CircularProgressIndicator(
                        color: themeData.colorScheme.secondary,
                      );
                    } else if (state is AdviceStateLoaded) {
                      return AdviceField(advice: state.advice);
                    } else if (state is AdviceStateError) {
                      return ErrorMessage(message: state.message);
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 200,
              child: Center(
                child: CustomButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
