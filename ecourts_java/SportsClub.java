package ecourts_java;

public class SportsClub {
    
    private int club_id;
    private String name;
    private String owners_name;
    private String street;
    private String town;
    private int zip_code;
    private String email;
    private String phone;
    private String mobile;
    private String about;

    public int getClub_id() {
        return club_id;
    }

    public void setClub_id(int club_id) {
        this.club_id = club_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getOwners_name() {
        return owners_name;
    }

    public void setOwners_name(String owners_name) {
        this.owners_name = owners_name;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getTown() {
        return town;
    }

    public void setTown(String town) {
        this.town = town;
    }

    public int getZip_code() {
        return zip_code;
    }

    public void setZip_code(int zip_code) {
        this.zip_code = zip_code;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public SportsClub(int club_id, String name, String owners_name, String street, String town, int zip_code,
            String email, String phone, String mobile, String about) {
        this.club_id = club_id;
        this.name = name;
        this.owners_name = owners_name;
        this.street = street;
        this.town = town;
        this.zip_code = zip_code;
        this.email = email;
        this.phone = phone;
        this.mobile = mobile;
        this.about = about;
    }

    public SportsClub(String name, String street, String town) {
        this.name = name;
        this.street = street;
        this.town = town;
    }
    




}