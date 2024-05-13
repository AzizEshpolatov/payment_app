import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/blocs/auth/auth_event.dart';
import 'package:payment_app/blocs/cards/cards_bloc.dart';
import 'package:payment_app/blocs/cards/cards_event.dart';
import 'package:payment_app/blocs/user_profile/user_profile_bloc.dart';
import 'package:payment_app/data/repositories/cards_repo/cards_repo.dart';
import 'package:payment_app/data/repositories/user_profile_repo/user_profile_repo.dart';
import '../blocs/auth/auth_bloc.dart';
import '../blocs/transaction/transaction_bloc.dart';
import '../data/repositories/auth_repo/auth_repo.dart';
import '../screens/routes.dart';

class App extends StatelessWidget {
  App({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => AuthRepository()),
        RepositoryProvider(create: (_) => UserProfileRepository()),
        RepositoryProvider(create: (_) => CardRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
            )..add(CheckAuthenticationEvent()),
          ),
          BlocProvider(
            create: (context) =>
                UserProfileBloc(context.read<UserProfileRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                CardsBloc(cardRepository: context.read<CardRepository>())
                  ..add(GetCardsDatabaseEvent()),
          ),
          BlocProvider(
            create: (context) => TransactionBloc(
              cardsRepository: context.read<CardRepository>(),
            ),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RouteNames.splashScreen,
          navigatorKey: navigatorKey,
          onGenerateRoute: AppRoutes.generateRoute,
          theme: ThemeData(useMaterial3: false),
        ),
      ),
    );
  }
}
