package controller;

import model.Contract;
import model.Customer;
import model.Employee;
import model.Service;
import service.*;

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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "ContractServlet",urlPatterns = "/contractServlet")
public class ContractServlet extends HttpServlet {
    public ContractService contractService = new ContractServiceImpl();
    public EmployeeService employeeService = new EmployeeServiceImpl();
    public CustomerService customerService = new CustomerServiceImpl();
    public ServiceService serviceService = new ServiceServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action==null) {
            action="";
        }

        switch (action) {
            case "createContract":
                createContract(request,response);
                break;
        }

    }

    private void createContract(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date start = null;
        Date end = null;
        try {
            start = format.parse(startDate);
            end = format.parse(endDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        double deposit = Double.parseDouble(request.getParameter("deposit"));
        double totalMoney = Double.parseDouble(request.getParameter("total"));
        int employee_id = Integer.parseInt(request.getParameter("employee"));
        int customer_id = Integer.parseInt(request.getParameter("customer"));
        int service_id = Integer.parseInt(request.getParameter("service"));

        Contract contract = new Contract(start,end,deposit,totalMoney,employee_id,customer_id,service_id);
        boolean check = false;
        try {
            check = contractService.insertContract(contract);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if(check) {
            response.sendRedirect("contractServlet");
        }else {
            request.setAttribute("mess","Fail to create contract");
            RequestDispatcher dispatcher = request.getRequestDispatcher("contract/createContractForm.jsp");
            dispatcher.forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action==null) {
            action="";
        }

        switch (action) {
            case "createContract":
                createContractForm(request,response);
                break;
            default:
                viewContractList(request,response);
                break;
        }
    }

    private void createContractForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Employee> employeeList = null;
        List<Customer> customerList = null;
        List<Service> serviceList = null;
        try {
         employeeList =employeeService.selectAllEmployee(-1);
         customerList = customerService.selectAllCustomer(-1);
         serviceList = serviceService.selectAllService();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("employeeList",employeeList);
        request.setAttribute("customerList",customerList);
        request.setAttribute("serviceList",serviceList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("contract/createContractForm.jsp");
        dispatcher.forward(request,response);
    }

    private void viewContractList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String currentPage = request.getParameter("currentPage");
        List<Contract> contractList = null;
        List<Employee> employeeList = null;
        List<Customer> customerList = null;
        List<Service> serviceList = null;
        try {
            contractList = contractService.selectAllContract(1);
            employeeList =employeeService.selectAllEmployee(-1);
            customerList = customerService.selectAllCustomer(-1);
            serviceList = serviceService.selectAllService();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        int noOfContracts = 0;
        try {
            noOfContracts = contractService.countContract();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        int noOfPages = noOfContracts / 5;
        if (noOfContracts % 5 > 0) {
            noOfPages++;
        }

        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("customerList",customerList);
        request.setAttribute("serviceList",serviceList);
        request.setAttribute("contractList",contractList);
        request.setAttribute("currentPage", currentPage);
        RequestDispatcher dispatcher = request.getRequestDispatcher("contract/contractList.jsp");
        dispatcher.forward(request, response);
    }
}
