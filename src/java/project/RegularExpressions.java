/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package project;

import java.util.regex.Pattern;

/**
 *
 * @author Behzad
 */
    public class RegularExpressions {
    public  boolean regExpMatches ( String patternToMatch ) { 
/*             String matchResult = "The string \"" + patternToMatch + "\" DOES NOT matches."; 
             if ( Pattern.matches("damage|minor damages|heavy damage", patternToMatch ) ) { 
                 matchResult = "The string \"" + patternToMatch + "\" MATCHES"; 
             } 
             return matchResult; */
             boolean matchResult = false; 
             if ( Pattern.matches("damage|minor damages|heavy damage", patternToMatch ) ) { 
                 matchResult = true; 
             } 
             return matchResult; 
    } 
}
