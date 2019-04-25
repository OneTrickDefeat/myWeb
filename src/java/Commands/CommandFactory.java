/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

/**
 *
 * @author Tom
 */
public class CommandFactory {

    private CommandFactory() {

    }

    public static Command createCommand(String action) {
        Command c = null;
        // If there was an action provided, choose which method should run and where the user should go next
        if (action != null) {
            switch (action) {
                case "login":
                    // Handle where the user wants to login
                    c = new LoginCommand();
                    break;
                case "register":
                    // Handle where the user wants to login
                    c = new RegisterCommand();
                    break;
                // Deal with where the client wants to change language    
                case "changeLanguage":
                    c = new ChangeLanguageCommand();
                    break;
                // Deal with where the client wants to change account details   
                case "updateUser":
                    c = new updateUserCommand();
                    break;
                case "searchProduct":
                    c = new SearchProductCommand();
                    break;
                case "logout":
                    // Do all logic for logging out user
                    c = new LogoutCommand();
                    break;
                case "addCategory":
                    // Do all logic for logging out user
                    c = new AddCategoryCommand();
                    break;
                case "deleteCategory":
                    // Do all logic for logging out user
                    c = new DeleteCategoryCommand();
                    break;
                case "addProduct":
                    // Do all logic for logging out user
                    c = new AddProductCommand();
                    break;
                case "updatePassword":
                    c = new updatePasswordCommand();
                    break;
                case "addToCart":
                    c = new AddToCartCommand();
                    break;
                case "addNewsletter":
                    c = new NewsletterCommand();
                    break;
                case "updateCartQuantity":
                    c = new UpdateCartQuantity();
                    break;
                case "removeFromCart":
                    c = new RemoveProductFromCart();
                    break;
                case "addAddress":
                    c = new AddDeliveryAddress();
                    break;
                case "generateClientToken":
                    c = new GenerateClientToken();
                    break;
                case "completeTransaction":
                    c = new completeTransaction();
                    break;
                case "changeCategory":
                    c = new ChangeCategoryCommand();
                    break;
                default:
                    // Do all logic for incorrect action processing 
                    c = new NoActionSuppliedCommand();
                    break;
            }
        } else {
            c = new NoActionSuppliedCommand();
        }

        return c;
    }
}
