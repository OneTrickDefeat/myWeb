/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Business.Cart;
import Business.OrderProduct;
import Business.ProductCart;
import Business.User;
import DAO.OrderProductDao;
import DAO.OrdersDao;
import DAO.ProductCartDao;
import DAO.ProductDao;
import com.braintreegateway.BraintreeGateway;
import com.braintreegateway.Result;
import com.braintreegateway.Transaction;
import com.braintreegateway.TransactionRequest;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Tom
 */
public class completeTransaction implements Command {

    String forwardToJsp = null;

    private BraintreeGateway btGateway;

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
//        get braintree gateway object from the session giving access to the braintree methods
        btGateway = (BraintreeGateway) session.getAttribute("gateway");
        //get nonce from client
        String nonceFromTheClient = request.getParameter("nonce");
        //get price from client
        String price = request.getParameter("total");
        //     make a new transaction passing the price and nonce, submit for settlement so money is taken straight away
        
        //Nonces to ue for testing ; replace nonceFromTheClient with one of these values.
        //valid :
        //fake-valid-nonce : A valid nonce that can be used to create a transaction
        //fake-valid-visa-nonce : A nonce representing a valid Visa card request
        //fake-valid-mastercard-nonce : A nonce representing a valid Mastercard request
        //fake-valid-amex-nonce : A nonce representing a valid American Express card request
        
        //invalid :
        //fake-processor-declined-visa-nonce : A nonce representing a request for a Visa card that was declined by the processor
        //fake-processor-declined-mastercard-nonce : A nonce representing a request for a Mastercard that was declined by the processor
        //fake-processor-declined-amex-nonce : A nonce representing a request for a American Express card that was declined by the processor
        //fake-processor-declined-discover-nonce : A nonce representing a request for a Discover card that was declined by the processor
        
        
        TransactionRequest transaction = new TransactionRequest()
                .amount(new BigDecimal(price))
                .paymentMethodNonce(nonceFromTheClient)
                .options()
                .submitForSettlement(true)
                .done();

        //varify the 3dsecure(security question posed by bank ) was done 
        transaction.options().threeDSecure().required(true).done();

        //checking the results of the transaction (returns array of transactions)
        Result<Transaction> result = btGateway.transaction().sale(transaction);
        //putting transaction results into session 
        session.setAttribute("transactionResult", result);
//        pull first transaction out of the array 
        Transaction trans = result.getTarget();
        //if it was a success
        if (result.isSuccess()) {

            //establish all required dao connections
            ProductCartDao pCartDao = new ProductCartDao("furniturestore");
            OrdersDao orderDao = new OrdersDao("furniturestore");
            OrderProductDao orderProductDao = new OrderProductDao("furniturestore");
            Cart loggedInUserCart = (Cart) session.getAttribute("loggedInUserCart");
            
            //extract user cardID
            int cartID = loggedInUserCart.getCartID();

            //get user email address
            User loggedInUser = (User) session.getAttribute("loggedInUser");
            String userEmailAddress = loggedInUser.getUsername();

            //getting list of products in user cart
            ArrayList<ProductCart> cartProducts = (ArrayList<ProductCart>) pCartDao.getItemsByCartId(cartID);

            //check does order exist for this transaction number and email
            boolean doesOrderExist = orderDao.doesOrderExist(userEmailAddress,
                    trans.getId());

            //if record does not exist
            if (!doesOrderExist) {
                //create a new record inside orders table, with email and            
                //transactionId number
                boolean confirmation = orderDao.createNewOrder(trans.getId(), 
                        userEmailAddress);
                if (confirmation) {
                    //store it to orders and orderproduct table
                    for (int i = 0; i < cartProducts.size(); i++) {
                        int productID = cartProducts.get(i).getProductId();
                        int productQuantity = cartProducts.get(i).getQuantity();
                        orderProductDao.addNewRecord(productID, trans.getId(), productQuantity);
                        
                    }
                    pCartDao.removeProductCartByCartId(cartID);
                    List<OrderProduct> currentOrder = orderProductDao.getAllOrdersMacthingTransactionId(trans.getId());
                    session = request.getSession();
                    session.setAttribute("transactionID", trans.getId());
                    session.setAttribute("currentOrder", currentOrder);
                    forwardToJsp = "success.jsp";
                } else {
                    // The OrderProduct couldn't be added to the database
                    // Send the user to the error page and inform them of this
                    String errorMessage = "ProductOrder couldn't be added to the database at this time"
                            + "Please try again.<br/>";
                    session = request.getSession();
                    session.setAttribute("errorMessage", errorMessage);
                    forwardToJsp = "error.jsp";
                }
                //if record does exist for this order inside Orders table
            } else {
                //store it to orders and orderproduct table
                for (int i = 0; i < cartProducts.size(); i++) {
                    int productID = cartProducts.get(i).getProductId();
                    int productQuantity = cartProducts.get(i).getQuantity();
                    orderProductDao.addNewRecord(productID, trans.getId(), productQuantity);
                }
                pCartDao.removeProductCartByCartId(cartID);
                session = request.getSession();
                session.setAttribute("transactionID", trans.getId());
                forwardToJsp = "success.jsp";
            }
        } else {
            String errorMessage = "Transaction unsuccessful "
                            + "Please try again.<br/>";
                    session = request.getSession();
                    session.setAttribute("errorMessage", errorMessage);
            forwardToJsp = "error.jsp";
        }
        return forwardToJsp;
    }

}
