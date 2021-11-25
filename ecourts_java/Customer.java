package ecourts_java;

public class Customer extends User{
    private String date_birth;
    private String username;


    public Customer(String name, String surname,String username, String email, String phone, 
    String street, String town, String street_number, String zip_code, String password, 
    String register_date, String date_birth) {
        super(name, surname, email, phone, street, town, street_number, zip_code, password, register_date);
        this.date_birth = date_birth;
        this.username=username;
    }


    public String getDate_birth() {
        return this.date_birth;
    }

    public void setDate_birth(String date_birth) {
        this.date_birth = date_birth;
    }


    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
   

    
    
    

}