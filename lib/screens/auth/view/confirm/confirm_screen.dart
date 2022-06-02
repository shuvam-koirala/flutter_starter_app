import 'package:starter_project/routes/navigation_type.dart';

import '../../../../export_packages.dart';
import 'bloc/confirm_bloc.dart';

class ConfirmScreen extends StatelessWidget {
  ConfirmScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _confirmForm(context),
          _resendOtpButton(context),
        ],
      ),
    );
  }
  Widget _confirmForm(BuildContext context){
    return Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               _otpField(),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   _confirmButton(context),
                   _navigateBackButton(context)
                 ],
               ),
              ],
            ),
          ),
        );
  }

  Widget _otpField(){
    return BlocBuilder<ConfirmBloc, ConfirmState>(builder: (context, state) {
      return TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.token),
          hintText: 'Otp',
        ),
        validator: (value) =>
            state.isvalidOtp? null : 'Otp is invalid',
        onChanged: (value) => context.read<ConfirmBloc>().add(
             OtpChanged(otp: value)
            ),
      );
    });
  }
  Widget _confirmButton(BuildContext context){
    return ElevatedButton(onPressed: (){
      context.read<ConfirmBloc>().add(ConfirmPressed());
    }, child: const Text("Confirm"));
  }
  Widget _resendOtpButton(BuildContext context){
    return ElevatedButton(onPressed: (){
      context.read<ConfirmBloc>().add(ResendOtp());
    }, child: const Text("Resend Otp"));
  }
  Widget _navigateBackButton(BuildContext context){
    return ElevatedButton(onPressed: (){
      NavigationType.pop(context);
    }, child: const Text("Go Back"));
  }
}
