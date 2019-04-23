/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import com.braintreegateway.BraintreeGateway;
import com.braintreegateway.Result;
import com.braintreegateway.Transaction;
import com.braintreegateway.TransactionRequest;
import java.math.BigDecimal;
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
            //put transaction information into the session , in this case the id 
            session.setAttribute("transactionID", trans.getId());
            forwardToJsp = "success.jsp";
         //if it fails   
        } else {
            forwardToJsp = "error.jsp";
           
        }
        return forwardToJsp;
    }

}
