import java.security.NoSuchAlgorithmException;

public class test {
    public static void main(String[] args) throws NoSuchAlgorithmException {
        System.out.println("Sum: " + Calculator.sum(5,9));
        System.out.println("Sub: " + Calculator.sub(5,9));
        System.out.println("Mul: " + Calculator.mul(5,9));
        try{
            System.out.println("Div: " + Calculator.divide(5,0));
        }catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        System.out.println("Div: " + Calculator.divide(10,3));
    }
}
