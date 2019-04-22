/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import com.braintreegateway.BraintreeGateway;
import com.braintreegateway.Environment;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Tom
 */
public class GenerateClientToken implements Command {

    //credentials for merchant 
    private static String publicKey = "jf9jztg275bwdw7j";
    private static String privateKey = "f2d23f32231c01ecccf2b3c0e8a96b69";
    private static String merchantId = "qgm7rc3778qsqvs5";

    private static String token;
    //call method to generate braintree gateway
    BraintreeGateway braintreeGateway = connectBraintreeGateway();

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        generateClientToken();
        HttpSession HttpSession = request.getSession(true);

        //put the clienttoken and braintree gateway into the session.
        HttpSession.setAttribute("clientToken", token);
        HttpSession.setAttribute("gateway", braintreeGateway);

        return null;

    }

    public static BraintreeGateway connectBraintreeGateway() {
        //adding the mechant id , public key and private key into the braintree gateway 
        BraintreeGateway gateway = new BraintreeGateway(
                Environment.SANDBOX,
                merchantId,
                publicKey,
                privateKey
        );

        return gateway;
    }
    //generate the client token using the braintree gateway object
    public static void generateClientToken() {
        token = connectBraintreeGateway().clientToken().generate();

    }

}
