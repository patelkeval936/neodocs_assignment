
class Validators{

  static String? testValueValidator(String? value, double lowerBound,
      double upperBound){

    if(value == null){
      return 'Value can not be empty';
    }

    double? testValue;
    try{
      testValue = double.parse(value);
    }catch(e){
      return 'Please provide valid input';
    }

    if(testValue < lowerBound){
      return "Value can not be less than lower Bound";
    }else if(testValue > upperBound){
      return "Value can not be more than upper Bound";
    }else{
      return null;
    }

  }
}