/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Beans.Cart;
import Beans.Item;
import Beans.Order;
import Utils.DB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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
@WebServlet(name = "OrderStatus", urlPatterns = {"/OrderStatus"})
public class OrderStatus extends HttpServlet {

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
            
            HttpSession session = request.getSession();
            
            int userId = Integer.parseInt(request.getParameter("userId"));
            
            
            Object orderListObject = session.getAttribute("orderList");
            ArrayList<Order> orderList = new ArrayList<Order>();
            
            if(orderListObject == null){
                orderList = new ArrayList<Order>();
            }
            else{
                orderList = (ArrayList<Order>)orderListObject;
                orderList.clear();
            }
            //orderList.clear();   //zbog buttona unutar userPanel.jsp se svakim pozivom ova lista puni svim clanovima baze
            
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            
            String query = "SELECT * FROM orders;";
            
            try {
                con = DB.getInstance().getConnection();
                stmt = con.createStatement();
                rs = stmt.executeQuery(query);
                
                while(rs.next()){
                    Order order = new Order();
                    order.setOrderId(rs.getInt("orderId"));
                    order.setItems(rs.getString("items"));
                    order.setTotalPrice(rs.getDouble("total_price"));
                    order.setOrderDate(rs.getDate("order_date").toLocalDate());
                    order.setOrderStatus(rs.getInt("order_status"));
                    order.setUserId(rs.getInt("userId"));
                    //stmt.close();
                    if(userId == order.getUserId()){
                        orderList.add(order);
                    }
                }
            } catch (SQLException e) {
                out.print(e.getMessage());
            }
            session.setAttribute("orderList", orderList);
            RequestDispatcher rd = request.getRequestDispatcher("orderStatus.jsp");
            rd.forward(request, response);
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
