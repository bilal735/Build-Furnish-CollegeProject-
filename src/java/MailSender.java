import java.util.*;
import jakarta.mail.*;
import jakarta.mail.internet.*;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author bilal
 */
public class MailSender {
    public void sendMail(String email,String code,String type){
            String from="cmlroot147@gmail.com";
            final String username="cmlroot147";
            final String password="rvsljzjbktalwmiu";
            String host="smtp.gmail.com";
            Properties props=new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable","true");
            props.put("mail.smtp.host",host);
            props.put("mail.smtp.port","587");
            props.put("mail.smtp.ssl.trust","smtp.gmail.com");
            Session session=Session.getInstance(props,new jakarta.mail.Authenticator(){
                protected PasswordAuthentication getPasswordAuthentication(){
                    return new PasswordAuthentication(username,password);
                }
            });
            try{
                Message msg=new MimeMessage(session);
                msg.setFrom(new InternetAddress(from));
                msg.setRecipients(Message.RecipientType.TO,InternetAddress.parse(email));
                msg.setSubject("Test Mail");
                
                msg.setText("http://localhost:8080/Experiment2/VarifyServlet2?code="+code+"&type="+type);
                Transport.send(msg);
                
            }catch(Exception ex){
                ex.printStackTrace();
            }
            
            
    }
    
}