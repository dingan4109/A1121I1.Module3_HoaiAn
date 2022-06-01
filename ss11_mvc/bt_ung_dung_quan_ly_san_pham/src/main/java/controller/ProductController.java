package controller;

import model.Product;
import service.ProductService;
import service.ProductServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductController",urlPatterns = "/controller")
public class ProductController extends HttpServlet {
    public final ProductService productService = new ProductServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action==null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProduct(request,response);
                break;
            case "edit":
                editProduct(request,response);
                break;
            case "delete":
                deleteProduct(request,response);
                break;

        }

    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        productService.delete(name);

        response.sendRedirect("/controller");
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //oldName
        String name = request.getParameter("name");

        int id = Integer.parseInt(request.getParameter("id"));
        String newName = request.getParameter("newName");
        float price = Float.parseFloat(request.getParameter("price"));
        String description = request.getParameter("description");
        String brand = request.getParameter("brand");

        Product product = new Product(id,newName,price,description,brand);
        productService.update(name,product);

        response.sendRedirect("/controller");
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        float price = Float.parseFloat(request.getParameter("price"));
        String description = request.getParameter("description");
        String brand = request.getParameter("brand");

        Product product = new Product(id,name,price,description,brand);
        productService.add(product);
        response.sendRedirect("/controller");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action==null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request,response);
                break;
            case "edit":
                showEditForm(request,response);
                break;
            case "delete":
                showDeleteForm(request,response);
                break;
            case "view":
                viewProduct(request,response);
                break;
            case "search":
                searchProduct(request,response);
                break;
            default:
                showProductList(request,response);
                break;
        }
    }

    private void viewProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        Product product = productService.findByName(name);
        RequestDispatcher dispatcher;
        if(product==null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        }else {
            request.setAttribute("product",product);
            dispatcher = request.getRequestDispatcher("product/view.jsp");
        }
        dispatcher.forward(request,response);
    }

    //CÁCH HIỂN THỊ KẾT QUẢ TRÊN CÙNG MỘT TRANG
//    private void searchProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException,
//            IOException {
//        String name = request.getParameter("name");
//        Product product = productService.findByName(name);
//        List<Product> productList = productService.findAll();
//        request.setAttribute("productList",productList);
//
//        RequestDispatcher dispatcher;
//        if(product==null) {
//            dispatcher = request.getRequestDispatcher("error-404.jsp");
//        }else {
//            request.setAttribute("product",product);
//            request.setAttribute("productList",productList);
//            dispatcher = request.getRequestDispatcher("product/list.jsp");
//        }
//        dispatcher.forward(request,response);
//    }

//    CÁCH HIỆN THẲNG VÀO PRODUCTLIST
    private void searchProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        String name = request.getParameter("name");
        Product product = productService.findByName(name);

        RequestDispatcher dispatcher;
        if(product==null) {
            Integer check = 1;
            request.setAttribute("check",check);
            request.setAttribute("name",name);
        }else {
            List<Product> productList = new ArrayList<>();
            productList.add(product);

            request.setAttribute("productList",productList);
        }
        dispatcher = request.getRequestDispatcher("product/list.jsp");
        dispatcher.forward(request,response);
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        Product product = productService.findByName(name);
        RequestDispatcher dispatcher;
        if(product==null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        }else {
            request.setAttribute("product",product);
            dispatcher = request.getRequestDispatcher("product/delete.jsp");
        }
        dispatcher.forward(request,response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        Product product = productService.findByName(name);
        RequestDispatcher dispatcher;
        if(product==null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        }else {
            dispatcher = request.getRequestDispatcher("product/edit.jsp");
        }
        dispatcher.forward(request,response);

    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        dispatcher.forward(request,response);
    }

    private void showProductList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.findAll();
        request.setAttribute("productList",productList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        dispatcher.forward(request,response);
    }
}
