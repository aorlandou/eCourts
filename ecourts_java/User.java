package ecourts_java;

class User{
    int user_id;
    String name;
    String surname;
    String email;
    String phone;
    String street;
    String town;
    int street_number;
    int zip_code;
    String password;
    String register_date;


    public User(int user_id, String name, String surname, String email, String phone, String street, String town, int street_number, int zip_code, String password, String register_date) {
        this.user_id = user_id;
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
    }
    
    

    public int getUser_id() {
        return this.user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
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

    public int getStreet_number() {
        return this.street_number;
    }

    public void setStreet_number(int street_number) {
        this.street_number = street_number;
    }

    public int getZip_code() {
        return this.zip_code;
    }

    public void setZip_code(int zip_code) {
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
