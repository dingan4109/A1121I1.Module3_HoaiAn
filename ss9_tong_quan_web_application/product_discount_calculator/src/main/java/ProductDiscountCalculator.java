import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProductDiscountCalculator",urlPatterns = "/calculate")
public class ProductDiscountCalculator extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float price = Float.parseFloat(request.getParameter("price"));
        float percent = Float.parseFloat(request.getParameter("percent"));
        float discountAmount = price*percent*0.01f;
        float finalPrice = price - discountAmount;

        request.setAttribute("discountAmount",discountAmount);
        request.setAttribute("finalPrice",finalPrice);
        request.setAttribute("price",price);
        request.setAttribute("percent",percent);
        RequestDispatcher dispatcher = request.getRequestDispatcher("finalPrice.jsp");
        dispatcher.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
