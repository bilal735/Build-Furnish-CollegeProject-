
import java.util.UUID;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author bilal
 */
public class GenUUID {
    public String getCode(){
        UUID code=UUID.randomUUID();
        return code.toString();
    }
}
