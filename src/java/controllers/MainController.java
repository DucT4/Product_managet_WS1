/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "MainController", urlPatterns = {"/main"})
public class MainController extends HttpServlet {

    private static final String WELCOME = "login.jsp";
    private static final String LOGIN = "loginServlet";
    private static final String LOGOUT = "logoutServlet";
    private static final String CATEGORY = "categoryServlet";
    private static final String UPDATE_CATEGORY = "updateCategoryServlet";
    private static final String DELETE_CATEGORY = "deleteServlet";
    private static final String PRODUCTS_PORTFOLIO = "productsServlet";
    private static final String PRODUCT_DETAIL = "productDetailServlet";
    private static final String CREATE_ACCOUNT = "createAccountController";
    private static final String ACCOUNT = "accountServlet";
    private static final String DELETE_ACCOUNT = "deleteAccountServlet";
    private static final String UPDATE_ACCOUNT = "updateAccountServlet";
    private static final String UPDATE_PRODUCT = "updateProductServlet";
    private static final String PRODUCT_MANAGER = "productManagerServlet";
    private static final String DELETE_PRODUCT = "deleteProductServlet";
    private static final String SEARCH_BY_NAME = "searchByNameServlet";
    private static final String CLASSIFY_CUSTOMER = "classifyCustomerController";
    private static final String FILTER_BY_PRICE_RANGE_TYPE = "priceFilterController";
    private static final String FILTER_BY_DISCOUNT = "discountFilterController";
    private static final String SORT_BY_PRICE = "sortByPriceController";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action");
            String url = WELCOME;
            if (action == null) {
                url = WELCOME;
            } else {

                switch (action) {
                    case "home":
                        url = WELCOME;
                        break;
                    case "login":

                        url = LOGIN;
                        break;
                    case "categories":
                        url = CATEGORY;
                        break;
                    case "updateCategory":
                        url = UPDATE_CATEGORY;
                        break;
                    case "delete":
                        url = DELETE_CATEGORY;
                        break;
                    case "portfolio":
                        url = PRODUCTS_PORTFOLIO;
                        break;
                    case "product-detail":
                        url = PRODUCT_DETAIL;
                        break;
                    case "account":
                        url = ACCOUNT;
                        break;
                    case "add-account":
                        url = CREATE_ACCOUNT;
                        break;
                    case "deleteAccount":
                        url = DELETE_ACCOUNT;
                        break;
                    case "accountUpdate":
                        System.out.println("AAAA");
                        url = UPDATE_ACCOUNT;
                        break;
                    case "productManager":
                        url = PRODUCT_MANAGER;
                        break;
                    case "deleteProduct":
                        url = DELETE_PRODUCT;
                        break;
                    case "logout":

                        url = LOGOUT;
                        break;
                    case "updateProduct":
                        url = UPDATE_PRODUCT;
                        break;
                    case "searchByName":
                        url = SEARCH_BY_NAME;
                        break;
                    case "classifyCustomer":
                        url = CLASSIFY_CUSTOMER;
                        break;
                    case "filterByPriceRangeType":
                        url = FILTER_BY_PRICE_RANGE_TYPE;
                        break;
                    case "filterByDiscount":
                        url = FILTER_BY_DISCOUNT;
                        break;
                    case "sortByPrice":
                        url = SORT_BY_PRICE;
                        break;
                    default:
                        url = WELCOME;
                        break;

                }
            }
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
