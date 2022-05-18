import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "ServletDictionary", urlPatterns = "/translate")
public class ServletDictionary extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String word = request.getParameter("word");

        Map<String,String> dictionary = new HashMap<>();
        dictionary.put("book","sách");
        dictionary.put("pen","bút");
        dictionary.put("ruler","thước");
        dictionary.put("hello","xin chào");
        dictionary.put("bye","tạm biệt");

        String result = dictionary.get(word);
        PrintWriter writer = response.getWriter();
        writer.println("<html>");

        if(result != null) {
            writer.println("<p> " + word + ": " + result + "</p>");
        }else {
            writer.println("<p> Not found </p>");
        }
        writer.println("</html>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
