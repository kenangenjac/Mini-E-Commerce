/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Beans.Cart;
import Beans.Item;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.jms.JMSContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kenan
 */
@WebServlet(name = "addToCart", urlPatterns = {"/addToCart"})
public class addToCart extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            
            ArrayList<Cart> cartList = new ArrayList<>();
            int itemId = Integer.parseInt(request.getParameter("id"));
            String itemName = request.getParameter("name");
            String itemDescription = request.getParameter("desc");
            double itemPrice = Double.parseDouble(request.getParameter("price"));
            
            Cart cart = new Cart();
            cart.setItemId(itemId);
            cart.setItemName(itemName);
            cart.setItemDescription(itemDescription);
            cart.setItemPrice(itemPrice);
            //cart.setQuantity(0);                
                
            
            HttpSession session = request.getSession();
            
            ArrayList<Cart> cartListInSession = (ArrayList<Cart>) session.getAttribute("cartList");
            if(cartListInSession == null){
                cartList.add(cart);
                session.setAttribute("cartList", cartList);
                response.sendRedirect("home.jsp");
            }else{
                cartList = cartListInSession;
                cartList.add(cart);
                response.sendRedirect("home.jsp");
                /*boolean doesExist = false;
                for (int i = 0; i < cartListInSession.size(); i++) {
                    if(cartListInSession.get(i).getItemId() == itemId){
                       doesExist = true;
                       out.println(
                               "<h3 style='color:crimson; text-align: center'>"
                                    + "Item Already in Cart. "
                                    + "<a href='cart.jsp'>"
                                        + "GO to Cart Page"
                                    + "</a>"
                             + "</h3>");
                    }
                }
                if(!doesExist){
                    cartList.add(cart);
                    response.sendRedirect("home.jsp");
                }*/
            }
          
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
