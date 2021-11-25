package ecourts_java;

public class Customer extends User{
    private String date_birth;
    private String surname;


    public Customer(String name, String surname, String email, String phone, 
    String street, String town, String street_number, String zip_code, String password, 
    String register_date, String date_birth) {
        super(name, surname, email, phone, street, town, street_number, zip_code, password, register_date);
        this.date_birth = date_birth;
    }


    public String getDate_birth() {
        return this.date_birth;
    }

    public void setDate_birth(String date_birth) {
        this.date_birth = date_birth;
    }

    public boolean checkName(){
        if (super.getName().length()>=2){
            return true;
        }else{
            return false;
        }
    }

    public boolean checkSurame(){
        if (super.getSurname().length()>=2){
            return true;
        }else{
            return false;
        }
    }

    public boolean checkPhone(){
        if (super.getPhone().length()==10){
            return true;
        }else{
            return false;
        }
    }

    public boolean checkZip(){
        if (super.getZip_code().length()==5){
            return true;
        }else{
            return false;
        }
    }

    public boolean checkEmail(){
        String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
		java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
		java.util.regex.Matcher m = p.matcher(super.getEmail());
        if (m.matches()){
            return true;
        }else{
            return false;
        }
    }

}