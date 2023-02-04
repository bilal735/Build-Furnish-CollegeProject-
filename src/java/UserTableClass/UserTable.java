package UserTableClass;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author bilal
 */
public class UserTable {
    public String name;
    public String email;
    public String specialization;
    public int work_experience;
    public String password;
    public int uid;
    public UserTable(String name,String email,String specialization,int work_experience,String password,int uid){
        this.name=name;
        this.email=email;
        this.specialization=specialization;
        this.work_experience=work_experience;
        this.password=password;
        this.uid=uid;
    }
    
}
