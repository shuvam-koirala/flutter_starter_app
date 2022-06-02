import 'package:starter_project/export_packages.dart';
import 'package:starter_project/routes/app_routes.dart';
import 'package:starter_project/routes/navigation_type.dart';
import '../../../../services/status/form_submission_status.dart';
import 'bloc/signup_bloc.dart';

class SignupScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

   SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(
          alignment: Alignment.bottomCenter,
          children:  [
            _signUpForm(),
            _showLoginButton(context),
          ],
        ),);
  }

  Widget _signUpForm() {
    return BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
          final formStatus = state.formStatus;
          if (formStatus is SubmissionFailed) {
            _showSnackBar(context, formStatus.exception.toString());
          }
        },
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _usernameField(),
                _emailField(),
                _passwordField(),
                _signUpButton(),
              ],
            ),
          ),
        ));
  }

  Widget _usernameField() {
    return BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
      return TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.person),
          hintText: 'Username',
        ),
        validator: (value) =>
            state.isValidUsername ? null : 'Username is too short',
        onChanged: (value) => context.read<SignupBloc>().add(
              SignupUsernameChanged(username: value),
            ),
      );
    });
  }

  Widget _emailField() {
    return BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
      return TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.person),
          hintText: 'Email',
        ),
        validator: (value) => state.isValidUsername ? null : 'Invalid email',
        onChanged: (value) => context.read<SignupBloc>().add(
              SignupEmailChanged(email: value),
            ),
      );
    });
  }

  Widget _passwordField() {
    return BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
      return TextFormField(
        obscureText: true,
        decoration: const InputDecoration(
          icon: Icon(Icons.security),
          hintText: 'Password',
        ),
        validator: (value) =>
            state.isValidPassword ? null : 'Password is too short',
        onChanged: (value) => context.read<SignupBloc>().add(
              SignupPasswordChanged(password: value),
            ),
      );
    });
  }

  Widget _signUpButton() {
    return BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? const CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<SignupBloc>().add(SignupPressed());
                   NavigationType.push(context: context, route: AppRoutes.confirmScreen);
                }
              },
              child: const Text('Sign Up'),
            );
    });
  }

  Widget _showLoginButton(BuildContext context) {
    return SafeArea(
      child: TextButton(
        child: const Text('Already have an account? Sign in.'),
        onPressed: () => NavigationType.popAndPush(context: context, route: AppRoutes.loginScreen),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}