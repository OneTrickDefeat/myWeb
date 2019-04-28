/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Business.OrderProduct;
import DAO.OrderProductDao;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Tom
 */
public class SearchTransactionCommand implements Command {

    public SearchTransactionCommand() {
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = null;

        String transId = request.getParameter("transId");

        if (transId != null) {
            OrderProductDao opDao = new OrderProductDao("furniturestore");

            List<OrderProduct> op = new ArrayList<>();

            op = opDao.getAllOrdersMacthingTransactionId(transId);
            if (op != null) {
                //if we find a result , store it in session for displaying
                HttpSession session = request.getSession();
                session.setAttribute("foundOrders", op);
                forwardToJsp = "displaySearchedOrders.jsp";
            } else {
                //no records of an order with that trans id
                //send the user to error page and inform of this
                String errorMessage = "No order was found matching details provided."
                        + " Please try again.";
                HttpSession session = request.getSession();
                session.setAttribute("errorMessage", errorMessage);
                forwardToJsp = "error.jsp";
            }
        } else {
            // The trasnaction id was missing
            // Send the user to the error page and inform them of this
            String errorMessage = "Your transaction id was missing. Please try again.";
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", errorMessage);
            forwardToJsp = "error.jsp";
        }
        return forwardToJsp;
    }

}
