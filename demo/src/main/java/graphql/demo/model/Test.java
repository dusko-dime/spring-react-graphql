package graphql.demo.model;

public class Test {
    private Integer id;
    private String year;

    public Test() {
    }

    public Test(Integer id, String year) {
        this.id = id;
        this.year = year;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }
}
