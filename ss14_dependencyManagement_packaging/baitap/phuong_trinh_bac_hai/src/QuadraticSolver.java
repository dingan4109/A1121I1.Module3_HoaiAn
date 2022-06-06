public class QuadraticSolver {
    public static void main(String[] args) {
        //code here
    }
    public static void solveQuadratic(double a, double b, double c) {
        //discriminant
        double d = Math.pow(b,2) -4*a*c;

        if(d<0) {
            System.out.println("No roots exist");
        }else if(d==0) {
            double root = -(b/2*a);
            System.out.println("x1 = x2 = " +root);
        }else {
            double root1 = (-b + Math.sqrt(d))/(2*a);
            double root2 = (-b - Math.sqrt(d))/(2*a);

            System.out.println("x1 = " + root1 + "\n x2 = " + root2);
        }
    }
}
