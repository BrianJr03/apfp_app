import 'package:apfp/validator/validator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../successful_registration/successful_registration_widget.dart';
import '../welcome/welcome_widget.dart';
import 'package:flutter/material.dart';
import 'package:apfp/firebase/fire_auth.dart';

class CreateAccountWidget extends StatefulWidget {
  CreateAccountWidget({Key? key}) : super(key: key);

  @override
  _CreateAccountWidgetState createState() => _CreateAccountWidgetState();
}

class _CreateAccountWidgetState extends State<CreateAccountWidget> {
  TextEditingController? _firstNameController;
  TextEditingController? _lastNameController;
  TextEditingController? _emailController;
  TextEditingController? _passwordController;
  late bool _passwordVisibility;
  TextEditingController? _confirmPasswordController;
  late bool _confirmPasswordVisibility;
  bool _loadingButton = false;
  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final verify = Validator();
  late var _docID;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordVisibility = false;
    _confirmPasswordController = TextEditingController();
    _confirmPasswordVisibility = false;
  }

  @override
  void dispose() {
    super.dispose();
    _firstNameController!.dispose();
    _lastNameController!.dispose();
    _emailController!.dispose();
    _passwordController!.dispose();
    _confirmPasswordController!.dispose();
  }

  String _getEmail() {
    return _emailController!.text.trim().toLowerCase();
  }

  String _getFullName() {
    return "${_firstNameController!.text.trim()}" +
        " ${_lastNameController!.text.trim()}";
  }

  String _getPassword() {
    return _passwordController!.text.trim();
  }

  Row _backButtonRow() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: 50,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.tertiaryColor,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
            child: InkWell(
              key: Key("Create.backButton"),
              onTap: () async {
                await Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.leftToRight,
                    duration: Duration(milliseconds: 125),
                    reverseDuration: Duration(milliseconds: 125),
                    child: WelcomeWidget(),
                  ),
                );
              },
              child: Text(
                '< Back',
                style: FlutterFlowTheme.subtitle2,
              ),
            ),
          ),
        )
      ],
    );
  }

  Padding _headerText() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text.rich(
                TextSpan(
                    text: 'Welcome to the Adult Physical Fitness App.' +
                        ' Please enter the details below to create your account.',
                    style: FlutterFlowTheme.subtitle1,
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'You must be a member of the APFP to sign up.',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: FlutterFlowTheme.secondaryColor),
                      )
                    ]),
                textAlign: TextAlign.center,
              ))
        ],
      ),
    );
  }

  Row _firstNameLabel() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Text(
            'First Name',
            style: FlutterFlowTheme.title3,
          ),
        )
      ],
    );
  }

  Padding _firstNameTextField() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(),
        alignment: AlignmentDirectional(0, 0),
        child: TextFormField(
          key: (Key("Create.firstNameTextField")),
          cursorColor: FlutterFlowTheme.secondaryColor,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please provide a value";
            }
            var firstUpperCase = value.substring(0, 1).toUpperCase();
            if (!verify.isValidName(value)) {
              return "Please provide a valid first name";
            } else if (value.substring(0, 1) != firstUpperCase) {
              return "Please capitalize your name";
            }
            return null;
          },
          keyboardType: TextInputType.name,
          controller: _firstNameController,
          obscureText: false,
          decoration: InputDecoration(
            hintText: 'John',
            hintStyle: FlutterFlowTheme.bodyText1,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 2,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 2,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
            ),
          ),
          style: FlutterFlowTheme.bodyText1,
        ),
      ),
    );
  }

  Row _lastNameLabel() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Text(
            'Last Name',
            style: FlutterFlowTheme.title3,
          ),
        )
      ],
    );
  }

  Container _lastNameTextField() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(),
      child: TextFormField(
        key: Key("Create.lastNameTextField"),
        cursorColor: FlutterFlowTheme.secondaryColor,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please provide a value";
          }
          var firstUpperCase = value.substring(0, 1).toUpperCase();
          if (!verify.isValidName(value)) {
            return "Please provide a valid first name";
          } else if (value.substring(0, 1) != firstUpperCase) {
            return "Please capitalize your name";
          }
          return null;
        },
        keyboardType: TextInputType.name,
        controller: _lastNameController,
        obscureText: false,
        decoration: InputDecoration(
          hintText: 'Doe',
          hintStyle: FlutterFlowTheme.bodyText1,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
        ),
        style: FlutterFlowTheme.bodyText1,
      ),
    );
  }

  Row _nameRow() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_firstNameLabel(), _firstNameTextField()],
          ),
        ),
        Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_lastNameLabel(), _lastNameTextField()])
      ],
    );
  }

  Padding _emailLabel() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text(
                'Email Address',
                style: FlutterFlowTheme.title3,
                key: Key("Create.emailAddressLabel"),
              ),
            ),
          )
        ],
      ),
    );
  }

  Row _emailTextBox() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 25, 0),
            child: TextFormField(
              key: Key("Create.emailTextField"),
              cursorColor: FlutterFlowTheme.secondaryColor,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please provide a value";
                }
                if (!verify.isValidEmail(value)) {
                  return "Please provide a valid email address";
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              obscureText: false,
              decoration: InputDecoration(
                hintText: 'example@bsu.edu',
                hintStyle: FlutterFlowTheme.bodyText1,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
              ),
              style: FlutterFlowTheme.bodyText1,
              textAlign: TextAlign.start,
            ),
          ),
        )
      ],
    );
  }

  Padding _passwordLabel() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text(
                'Password',
                style: FlutterFlowTheme.title3,
              ),
            ),
          )
        ],
      ),
    );
  }

  Row _passwordTextField() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 25, 0),
            child: TextFormField(
              key: Key("Create.passwordTextField"),
              cursorColor: FlutterFlowTheme.secondaryColor,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please provide a value";
                }
                if (!verify.isValidPassword(value)) {
                  return "Please provide a valid password";
                }
                return null;
              },
              controller: _passwordController,
              obscureText: !_passwordVisibility,
              decoration: InputDecoration(
                  hintText: "!Password12",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  suffixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(end: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          InkWell(
                            onTap: () => showPwRequirements(),
                            child: Icon(Icons.info,
                                color: FlutterFlowTheme.secondaryColor),
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            key: Key("Create.pWVisibilty"),
                            onTap: () => setState(() {
                              _passwordVisibility = !_passwordVisibility;
                            }),
                            child: Icon(
                              _passwordVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Color(0xFF757575),
                              size: 22,
                            ),
                          ),
                        ],
                      ))),
              style: FlutterFlowTheme.bodyText1,
              textAlign: TextAlign.start,
            ),
          ),
        )
      ],
    );
  }

  Padding _confirmPasswordLabel() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text('Confirm Password',
                  key: Key('Create.confirmPasswordLabel'),
                  style: FlutterFlowTheme.title3),
            ),
          )
        ],
      ),
    );
  }

  Row _confirmPasswordTextField() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 25, 0),
            child: TextFormField(
              key: Key("Create.confirmPasswordTextField"),
              cursorColor: FlutterFlowTheme.secondaryColor,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please provide a value";
                }
                if (value != _getPassword()) {
                  return "Passwords must match";
                }
                return null;
              },
              controller: _confirmPasswordController,
              obscureText: !_confirmPasswordVisibility,
              decoration: InputDecoration(
                hintText: "!Password12",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                suffixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(end: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        InkWell(
                          onTap: () => showPwRequirements(),
                          child: Icon(Icons.info,
                              color: FlutterFlowTheme.secondaryColor),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          key: Key("Create.confirmPWVisibilty"),
                          onTap: () => setState(() {
                            _confirmPasswordVisibility =
                                !_confirmPasswordVisibility;
                          }),
                          child: Icon(
                            _confirmPasswordVisibility
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Color(0xFF757575),
                            size: 22,
                          ),
                        ),
                      ],
                    )),
              ),
              style: FlutterFlowTheme.bodyText1,
              textAlign: TextAlign.start,
            ),
          ),
        )
      ],
    );
  }

  Row passwordIconRow(Function visibilityOnTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        InkWell(
          onTap: () => setState(
            () => showPwRequirements(),
          ),
          child: Icon(Icons.info),
        ),
        SizedBox(width: 10),
        InkWell(
          onTap: () => visibilityOnTap,
          child: Icon(
            _passwordVisibility
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: Color(0xFF757575),
            size: 22,
          ),
        ),
      ],
    );
  }

  void showPwRequirements() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        key: Key("Create.pWRequirements"),
        title: const Text('Password Requirements'),
        content: Text('Password must contain at least\n\n' +
            '- Eight characters\n' +
            '- One letter\n' +
            '- One number\n' +
            '- One special character'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK',
                style: TextStyle(color: FlutterFlowTheme.secondaryColor)),
          ),
        ],
      ),
    );
  }

  void _verifyAPFPCredentials() {
    if (_formKey.currentState!.validate()) {
      FireAuth.getRegisteredUser(_getEmail())
          .then((QuerySnapshot querySnapshot) {
        if (querySnapshot.size != 0) {
          // Only works if there is unqiueness amongst 
          // all email fields in firestore db
           _docID = querySnapshot.docs.first.id;
          _createAccount();
        } else {
          FireAuth.showToast(
              "You must be a member of the APFP to use this app.");
        }
      });
    }
  }

  void _createAccount() async {
    User? user = await FireAuth.registerUsingEmailPassword(
        name: _getFullName(), email: _getEmail(), password: _getPassword());
    user?.updateDisplayName(_getFullName());
    user?.sendEmailVerification();
    if (user != null) {
      FireAuth.refreshUser(user);
      FireAuth.storeUID(_docID, user.uid);
      if (user.emailVerified) {
        FireAuth.showToast("Account has been verified. Please sign in.");
      } else {
        _onSuccess();
      }
    }
  }

  void _onSuccess() async {
    setState(() => _loadingButton = true);
    try {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SuccessfulRegistrationWidget(),
        ),
      );
    } finally {
      setState(() => _loadingButton = false);
    }
  }

  Padding _createAccountButton() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FFButtonWidget(
            key: Key("Create.createAcctButton"),
            onPressed: () async {
              _verifyAPFPCredentials();
            },
            text: 'Create Account',
            options: FFButtonOptions(
              width: 200,
              height: 50,
              color: Color(0xFFBA0C2F),
              textStyle: FlutterFlowTheme.title2,
              elevation: 2,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: 12,
            ),
            loading: _loadingButton,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: 25),
                  _backButtonRow(),
                  _headerText(),
                  _nameRow(),
                  _emailLabel(),
                  _emailTextBox(),
                  _passwordLabel(),
                  _passwordTextField(),
                  _confirmPasswordLabel(),
                  _confirmPasswordTextField(),
                  _createAccountButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
