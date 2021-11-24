package ecourts_java;

class User{
    private static int user_id=0;
    private String name;
    private String surname;
    private String email;
    private String phone;
    private String street;
    private String town;
    private String street_number;
    private String zip_code;
    private String password;
    private String register_date;


    public User(String name, String surname, String email, String phone, String street, String town, String street_number, String zip_code, String password, String register_date) {
        
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.phone = phone;
        this.street = street;
        this.town = town;
        this.street_number = street_number;
        this.zip_code = zip_code;
        this.password = password;
        this.register_date = register_date;
        user_id=user_id +1;
    }
    
    

    public  int getUser_id() {
        return user_id;
    }

 

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return this.surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return this.phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getStreet() {
        return this.street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getTown() {
        return this.town;
    }

    public void setTown(String town) {
        this.town = town;
    }

    public String getStreet_number() {
        return this.street_number;
    }

    public void setStreet_number(String street_number) {
        this.street_number = street_number;
    }

    public String getZip_code() {
        return this.zip_code;
    }

    public void setZip_code(String zip_code) {
        this.zip_code = zip_code;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRegister_date() {
        return this.register_date;
    }

    public void setRegister_date(String register_date) {
        this.register_date = register_date;
    }





}
