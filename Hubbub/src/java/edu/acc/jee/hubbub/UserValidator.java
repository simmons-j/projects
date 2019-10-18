package edu.acc.jee.hubbub;

import edu.acc.jee.hubbub.domain.User;
import java.util.HashSet;
import java.util.Set;

public class UserValidator {
    public static final String USERNAME_PATTERN = "^\\w{6,20}$";
    public static final String PASSWORD_PATTERN = "^[^<>'\"]{8,50}$"; 
    
    public static Set<String> validate(User user) {
        Set<String> errors = new HashSet<>();
        if (user.getUsername() == null)
            errors.add("Username cannot be null");
        else if (!user.getUsername().matches(USERNAME_PATTERN))
            errors.add("Username must have 6-20 characters");
        if (user.getPasshash()== null)
            errors.add("Password cannot be null");
        else if (!user.getPasshash().matches(PASSWORD_PATTERN))
            errors.add("Password must have 8-50 characters");
        return errors;
    }
}
