Map<String, String Function(Object)>? constValidationMessages = {
  'required': (error) => "Required",
  'minLength': (error) => "Password must exceed 6 characters",
  'phoneValidation': (error) => "Please Enter a valid Phone Number",
  'mustMatch': (error) => "Password Must Match",
  'email': (error) => "Invalid email address",
  'number': (error) => "Please Enter Numbers",
  'weak': (error) => "Weak",
  'average': (error) => "average",
  'Strong': (error) => "Strong",
};
