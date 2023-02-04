/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package UserTableClass;

/**
 *
 * @author bilal
 */
public class appointment_table {
  
    public String service;
    public String service_provider_email;
    public String service_provider_name;
    public String schedule_from;
    public String schedule_till;
    public String your_email;
    public String your_address;
    public appointment_table(String service,String service_provider_email,String service_provider_name,String schedule_from,String schedule_till,String your_email,String your_address){
        this.service=service;
        this.service_provider_email=service_provider_email;
        this.service_provider_name=service_provider_name;
        this.schedule_from=schedule_from;
        this.schedule_till=schedule_till;
        this.your_email=your_email;
        this.your_address=your_address;
    }
    
}


