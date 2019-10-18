package edu.acc.jee.hubbub;

import edu.acc.jee.hubbub.domain.User;

public class UserAuthenticator {
    public static boolean authenticate(User user, String validUsername,
            String validPassword) {
        if (user == null || user.getUsername() == null || 
                user.getPasshash()== null) {
            return false;
        }
        
        if (user.getUsername().equals(validUsername) && 
                user.getPasshash().equals(validPassword)) {
            return true;
        }
        
        /*return user.getUsername().equals(validUsername) && 
            user.getPasshash().equals(validPassword);*/
        
        return false;
    }
}
