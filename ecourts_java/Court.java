package ecourts_java;

public class Court {
    private int court_id;
    private String name;
    private String sport;
    private String surface;
    private SportsClub club;

    public int getCourt_id() {
        return court_id;
    }

    public void setCourt_id(int court_id) {
        this.court_id = court_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSport() {
        return sport;
    }

    public void setSport(String sport) {
        this.sport = sport;
    }

    public String getSurface() {
        return surface;
    }

    public void setSurface(String surface) {
        this.surface = surface;
    }

    public SportsClub getClub() {
        return club;
    }

    public void setClub(SportsClub club) {
        this.club = club;
    }

    public Court(String name, String sport, String surface, SportsClub club) {
        this.name = name;
        this.sport = sport;
        this.surface = surface;
        this.club = club;
    }


    
}