import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "GradleSimpleDictionary",urlPatterns = "/translate")
public class GradleSimpleDictionary extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String,String> dictionary = new HashMap<>();
        dictionary.put("book","sách");
        dictionary.put("pen","bút");
        dictionary.put("ruler","thước");
        dictionary.put("hello","xin chào");
        dictionary.put("bye","tạm biệt");

        String txtSearch = request.getParameter("txtSearch");
        String result = dictionary.get(txtSearch);

        if(result != null) {
            request.setAttribute("result",result);
            request.setAttribute("txtSearch",txtSearch);
            RequestDispatcher dispatcher = request.getRequestDispatcher("found.jsp");
            dispatcher.forward(request,response);
        }else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("notFound.jsp");
            dispatcher.forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
