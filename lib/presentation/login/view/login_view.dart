import 'package:first_application/data/repository/repository_impl.dart';
import 'package:first_application/domain/repository/repository.dart';
import 'package:first_application/domain/usecase/login_usecase.dart';
import 'package:first_application/presentation/login/viewModel/login_view_model.dart';
import 'package:first_application/presentation/resources/assets_manager.dart';
import 'package:first_application/presentation/resources/color_manager.dart';
import 'package:first_application/presentation/resources/routes_manager.dart';
import 'package:first_application/presentation/resources/string_manager.dart';
import 'package:first_application/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:first_application/app/di.dart';
class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _viewModel = instance<LoginViewModel>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _bind() {
    _viewModel.start();
    _userNameController
        .addListener(() => _viewModel.setUserName(_userNameController.text));
    _passwordController.addListener(
            () => _viewModel.setUserPassword(_passwordController.text));
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Widget _getContentWidget() {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Container(
        padding: const EdgeInsets.only(top: AppPadding.p100),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(ImageAssets.splashLogo),
                const SizedBox(
                  height: AppSize.s28,
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: AppPadding.p28),
                  child: StreamBuilder<bool>(
                    builder: (context, snapshot) => TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _userNameController,
                      decoration: InputDecoration(
                        hintText: AppStrings.userName,
                        labelText: AppStrings.userName,
                        errorText: (snapshot.data ?? true)
                            ? null
                            : AppStrings.userNameError,
                      ),
                    ),
                    stream: _viewModel.outIsUserNameValid,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s28,
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: AppPadding.p28),
                  child: StreamBuilder<bool>(
                    builder: (context, snapshot) => TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      decoration: InputDecoration(
                          hintText: AppStrings.password,
                          labelText: AppStrings.password,
                          errorText: (snapshot.data ?? true)
                              ? null
                              : AppStrings.passwordError),
                    ),
                    stream: _viewModel.outIsPasswordValid,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s28,
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: AppPadding.p28),
                  child: StreamBuilder<bool>(
                    builder: (context, snapshot) => SizedBox(
                      width: double.infinity,
                      height: AppSize.s40,
                      child: ElevatedButton(
                          onPressed: (snapshot.data ?? false)
                              ? () {
                            _viewModel.login();
                          }
                              : null,
                          child: const Text(AppStrings.login)),
                    ),
                    stream: _viewModel.outAreAllInputsValid,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p16,
                      right: AppPadding.p16,
                      top: AppPadding.p8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context,Routes.forgotPasswordRoute);
                          },
                          child: Text(
                            AppStrings.forgotPassword,
                            textAlign: TextAlign.end,
                            style: Theme.of(context).textTheme.titleMedium,
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context,Routes.registerRoute);
                          },
                          child: Text(
                            AppStrings.registerText,
                            textAlign: TextAlign.end,
                            style: Theme.of(context).textTheme.titleMedium,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
