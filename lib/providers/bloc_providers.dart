import '../export_packages.dart';
import '../screens/auth/repository/auth_repository.dart';
import '../screens/auth/view/login/bloc/login_bloc.dart';
import '../screens/auth/view/signup/bloc/signup_bloc.dart';


class BlocProviders extends StatelessWidget {
  const BlocProviders({
    Key? key,
    required Widget child,
  })  : _child = child,
        super(key: key);
  final Widget _child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => LoginBloc(AuthRepository()),
      ),
      BlocProvider(
        create: (context) => SignupBloc(AuthRepository()),
      )
    ], child: _child);
  }
}
