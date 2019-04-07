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

    private static String publicKey = "jf9jztg275bwdw7j";
    private static String privateKey = "f2d23f32231c01ecccf2b3c0e8a96b69";
    private static String merchantId = "qgm7rc3778qsqvs5";

    private static String token ;
    BraintreeGateway braintreeGateway = connectBraintreeGateway();

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        generateClientToken();
        HttpSession HttpSession = request.getSession(true);
        
        HttpSession.setAttribute("clientToken", token);
        HttpSession.setAttribute("gateway", braintreeGateway);
        
        return null;
        
    }

    public static BraintreeGateway connectBraintreeGateway() {

        BraintreeGateway gateway = new BraintreeGateway(
                Environment.SANDBOX,
                merchantId,
                publicKey,
                privateKey
        );
        
        return gateway;
    }
    
    public static void generateClientToken(){
      token = connectBraintreeGateway().clientToken().generate();
      
      
       
    }

}
