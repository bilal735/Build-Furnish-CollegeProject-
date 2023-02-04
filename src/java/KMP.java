/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author bilal
 */
public class KMP {
    public void fillips(String str,int lps[]){
        int n=str.length();
        int len=0;
        int i=1;
        lps[0]=0;
        while(i<n){
            if(str.charAt(i)==str.charAt(len)){
                len++;
                lps[i]=len;
                i++;
                             
            }else{
                if(len==0){
                    lps[i]=0;
                    i++;
                }else{
                 
                    len=lps[len-1];
                    
                }
                
            }
        }
        
    }
    public String kmp(String str,String pat){
        int m=pat.length();
        int n=str.length();
        int lps[]=new int[m];
        fillips(pat,lps);
        int i=0;
        int j=0;
        while(i<n && j<m){
            if(str.charAt(i)==pat.charAt(j)){
                i++;
                j++;
                if(j==m){
                    
                    j=lps[j-1];
                    return str;
                }
            }else if(i<n && str.charAt(i)!=pat.charAt(j)){
                if(j==0){
                    i++;
                }else{
                    j=lps[j-1];
                }
                
            }
        }
        return null;
    }
}
