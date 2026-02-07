void main(List<String> args) {
  /* if, elseif, else Statement */
  int age = 20;

  if(age >= 18) {   
    print("You are an adult.");
  }
  else if(age >= 13) {
    print("You are a teenager.");
  }
  else {            
   print("You are a child.");
  }


  /* switch Statement */
  int day = 3;
  String dayName;

  switch(day) {
    case 1: dayName = "Monday";    break;        
    case 2: dayName = "Tuesday";   break;
    case 3: dayName = "Wednesday"; break;
    case 4: dayName = "Thursday";  break;
    case 5: dayName = "Friday";    break;
    case 6: dayName = "Saturday";  break;
    case 7: dayName = "Sunday";    break;
    default: dayName = "Invalid day";
  }

  print("Day $day is $dayName.");
}