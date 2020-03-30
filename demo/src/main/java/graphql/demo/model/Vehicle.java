package graphql.demo.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Set;

@Entity
@Table(name = "vehicle")
public class Vehicle {
    private Integer id;
    private String type;
    private String modelCode;
    private String brandName;
    private Timestamp launchDate;
    private Integer personId;
    private Person person;
    private Set<Travel> travels;
    private Set<City> cities;
    private Set<VehicleRegistration> registrations;

    @OneToMany(mappedBy = "vehicle", fetch = FetchType.EAGER)
    public Set<VehicleRegistration> getRegistrations() {
        return registrations;
    }

    public void setRegistrations(Set<VehicleRegistration> registrations) {
        this.registrations = registrations;
    }

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name = "vehicle_city",
            joinColumns = @JoinColumn(name = "vehicle_id"),
            inverseJoinColumns = @JoinColumn(name = "city_id"))
    public Set<City> getCities() {
        return cities;
    }

    public void setCities(Set<City> cities) {
        this.cities = cities;
    }

    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "person_id", insertable = false, updatable = false)
    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }

    @OneToMany(mappedBy = "vehicle", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    public Set<Travel> getTravels() {
        return travels;
    }

    public void setTravels(Set<Travel> travels) {
        this.travels = travels;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Basic
    @Column(name = "type", nullable = true, length = 50)
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Basic
    @Column(name = "model_code", nullable = true, length = 50)
    public String getModelCode() {
        return modelCode;
    }

    public void setModelCode(String modelCode) {
        this.modelCode = modelCode;
    }

    @Basic
    @Column(name = "brand_name", nullable = true, length = 50)
    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    @Basic
    @Column(name = "launch_date", nullable = true)
    public Timestamp getLaunchDate() {
        return launchDate;
    }

    public void setLaunchDate(Timestamp launchDate) {
        this.launchDate = launchDate;
    }

    @Basic
    @Column(name = "person_id", nullable = false)
    public Integer getPersonId() {
        return personId;
    }

    public void setPersonId(Integer personId) {
        this.personId = id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Vehicle vehicle = (Vehicle) o;

        if (id != null ? !id.equals(vehicle.id) : vehicle.id != null) return false;
        if (type != null ? !type.equals(vehicle.type) : vehicle.type != null) return false;
        if (modelCode != null ? !modelCode.equals(vehicle.modelCode) : vehicle.modelCode != null) return false;
        if (brandName != null ? !brandName.equals(vehicle.brandName) : vehicle.brandName != null) return false;
        if (launchDate != null ? !launchDate.equals(vehicle.launchDate) : vehicle.launchDate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (type != null ? type.hashCode() : 0);
        result = 31 * result + (modelCode != null ? modelCode.hashCode() : 0);
        result = 31 * result + (brandName != null ? brandName.hashCode() : 0);
        result = 31 * result + (launchDate != null ? launchDate.hashCode() : 0);
        return result;
    }
}
