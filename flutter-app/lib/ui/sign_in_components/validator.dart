///if we want to add more validation steps we can add that in this abstract class
///and later on create concrete implementations
abstract class StringValidator{
  bool isValid(String value);
}


///this class checks whether the string is empty or not
class NonEmptyStringValidator implements StringValidator{
  @override
  bool isValid(String value) {
    if(value.isNotEmpty){
      return true;
    }else{
      return false;
    }
  }
}

class FeildValidator{
  final StringValidator preNameValidator = NonEmptyStringValidator();
  final StringValidator nameValidator = NonEmptyStringValidator();
  final StringValidator zipValidator = NonEmptyStringValidator();
  final String emptypreNameErrorText = 'Prename can\'t be empty';
  final String emptynameErrorText = 'Name can\'t be empty';
  final String emptyzipErrorText = 'Zip code can\'t be empty';
}

