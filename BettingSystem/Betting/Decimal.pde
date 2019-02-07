
public class Decimal implements Odd 
{


  
  float value;
  
  public Decimal(float value) 
  {
    
    this.value=value;
  }

  
  public float calculate (float amount) {
    
        return amount*value+amount;
    
  }

  
}
