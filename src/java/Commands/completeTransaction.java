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
        btGateway = (BraintreeGateway) session.getAttribute("gateway");
        String nonceFromTheClient = request.getParameter("nonce");
        String price = request.getParameter("total");

        TransactionRequest transaction = new TransactionRequest()
                .amount(new BigDecimal(price))
                .paymentMethodNonce(nonceFromTheClient)
                .options()
                .submitForSettlement(true)
                .done();
        transaction.options().threeDSecure().required(true).done();

        Result<Transaction> result = btGateway.transaction().sale(transaction);
        session.setAttribute("transactionResult", result);
        Transaction trans = result.getTarget();
        if (result.isSuccess()) {
            session.setAttribute("result", "success");
            session.setAttribute("transactionID", trans.getId());
            forwardToJsp = "success.jsp";
            
        } else {
            session.setAttribute("result", "failed");
            forwardToJsp = "error.jsp";
           
        }
        return forwardToJsp;
    }

}
