package controller;

import dao.CustomerDAO;
import dao.CustomerDAOImpl;
import model.Customer;
import service.CustomerService;
import service.CustomerServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "AccountServlet",urlPatterns = "/customerServlet")
public class CustomerServlet extends HttpServlet {
    CustomerService customerService = new CustomerServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action==null) {
            action="";
        }

        switch (action) {
            case "create":
                insertUser(request,response);
                break;
        }
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int customer_type_id = Integer.parseInt(request.getParameter("type_id"));
        String customer_name = request.getParameter("name");
        String customer_birthday = request.getParameter("birthday");
       SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
       Date bod = null;
        try {
            bod = formatter.parse(customer_birthday);
//            java.sql.Date sqlBOD = new java.sql.Date(bod.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        int customer_gender = Integer.parseInt(request.getParameter("gender"));
        String customer_id_card = request.getParameter("idCard");
        String customer_phone = request.getParameter("phone");
        String customer_email = request.getParameter("email");
        String customer_address = request.getParameter("address");

        Customer customer = new Customer(customer_type_id,customer_name,bod,customer_gender,customer_id_card,
                customer_phone,customer_email,customer_address);
        try {
            boolean check = customerService.insertCustomer(customer);
            if(check) {
                request.setAttribute("mess","Successfully created new customer");
            }else {
                request.setAttribute("mess","Fail to create new customer");
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("customer/customerList.jsp");
            dispatcher.forward(request,response);
        } catch (SQLException | ServletException throwables) {
            throwables.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action==null) {
            action="";
        }

        switch (action) {
            case "create":
                createForm(request,response);
                break;
            default:
                viewCustomerList(request,response);
                break;
        }

    }

    private void createForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/createForm.jsp");
        dispatcher.forward(request,response);
    }

    private void viewCustomerList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = null;
        try {
            customerList = customerService.selectAllCustomer();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        request.setAttribute("customerList",customerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/customerList.jsp");
        dispatcher.forward(request,response);
    }


    private void getHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
        dispatcher.forward(request,response);
    }
}
