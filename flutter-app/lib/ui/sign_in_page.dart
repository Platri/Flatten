import 'package:flatten/remote/flatten_api.dart';
import 'package:flatten/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'sign_in_components/constants.dart';
import 'sign_in_components/custom_raised_button.dart';
import 'sign_in_components/information_texts.dart';
import 'sign_in_components/validator.dart';

class SignInPage extends StatefulWidget with FeildValidator {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String get _preName => _preNameController.text;

  String get _name => _nameController.text;

  String get _zip => _zipController.text;

  final TextEditingController _preNameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();

  final FocusNode _preNameNode = FocusNode();
  final FocusNode _nameNode = FocusNode();
  final FocusNode _zipNode = FocusNode();

  bool _submitted = false;

  void _submit() {
    ///this method signs in the user only if all the feilds are valid
    ///we dont have to add the sign in logic here, we have to do that in the Auth()
    ///class in the 'services' directory
    setState(() {
      _submitted = true;
    });
    if (widget.zipValidator.isValid(_zip) &&
        widget.nameValidator.isValid(_name) &&
        widget.preNameValidator.isValid(_preName)) {
      final Auth auth = Provider.of<Auth>(context, listen: false);
      auth.signIn('some uid', _preName, _name, _zip);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Auth auth = Provider.of<Auth>(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFF88c7bc),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Spacer(
              flex: 3,
            ),
            informationText(
                'Scan your QR-Code which you have received by post', 250),
            Spacer(
              flex: 1,
            ),
            CustomRaisedButton(
              color: Color(0xff408aff),
              child: Text(
                'Scan QR-Code',
                style: TextStyle(fontSize: 20),
              ),
              borderRadius: 50,
              onPressed: () {
                FlattenApi().getQrCode();
              },
            ),
            Spacer(
              flex: 2,
            ),
            informationText(
                'You haven\'t received any post yer, or lost it?\nNo problem. Generate your new code here:',
                320),
            Spacer(
              flex: 1,
            ),
            SizedBox(width: 300, height: 80, child: _buildPreNameTextFeild()),
            Spacer(
              flex: 1,
            ),
            SizedBox(width: 300, height: 80, child: _buildnameTextFeild()),
            Spacer(
              flex: 1,
            ),
            SizedBox(width: 300, height: 80, child: _buildZipTextFeild()),
            Spacer(
              flex: 1,
            ),
            CustomRaisedButton(
              color: Color(0xff408aff),
              child: Text(
                'Generate',
                style: TextStyle(fontSize: 20),
              ),
              borderRadius: 50,
              onPressed: () {
                _submit();
              },
            ),
            Spacer(
              flex: 2,
            ),
            SizedBox(
              width: 300,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: informationText(
                        'What about people who do not have a smartphone', 200),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.help,
                      size: 50,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    ));
  }

  TextField _buildZipTextFeild() {
    bool showError = !widget.zipValidator.isValid(_zip);
    return TextField(
      controller: _zipController,
      focusNode: _zipNode,
      decoration: kSingInInputFeildsDecoration().copyWith(
          hintText: 'ZIP',
          errorText: _submitted && showError ? widget.emptyzipErrorText : null),
      keyboardType: TextInputType.number,
      onChanged: (zip) {},
    );
  }

  TextField _buildPreNameTextFeild() {
    bool showError = !widget.preNameValidator.isValid(_preName);
    return TextField(
      controller: _preNameController,
      focusNode: _preNameNode,
      decoration: kSingInInputFeildsDecoration().copyWith(
          hintText: 'Prename',
          errorText:
              _submitted && showError ? widget.emptypreNameErrorText : null),
      keyboardType: TextInputType.text,
      onChanged: (preName) {},
    );
  }

  TextField _buildnameTextFeild() {
    bool showError = !widget.nameValidator.isValid(_name);
    return TextField(
      controller: _nameController,
      focusNode: _nameNode,
      decoration: kSingInInputFeildsDecoration().copyWith(
          hintText: 'Name',
          errorText:
              _submitted && showError ? widget.emptynameErrorText : null),
      keyboardType: TextInputType.text,
      onChanged: (name) {},
    );
  }
}
