package graphql.demo.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Set;

@Entity
public class Registration {
    private Integer id;
    private Timestamp from;
    private Timestamp to;
    private Integer registrationYearId;
    private Set<VehicleRegistration> registrations;
    private RegistrationYear registrationYear;

    @OneToMany(mappedBy = "registration", fetch = FetchType.EAGER)
    public Set<VehicleRegistration> getRegistrations() {
        return registrations;
    }

    public void setRegistrations(Set<VehicleRegistration> registrations) {
        this.registrations = registrations;
    }

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="registration_year_id", insertable=false, updatable=false)
    public RegistrationYear getRegistrationYear() {
        return registrationYear;
    }

    public void setRegistrationYear(RegistrationYear registrationYear) {
        this.registrationYear = registrationYear;
    }


    @Basic
    @Column(name = "registration_year_id", nullable = false)
    public Integer getRegistrationYearId() {
        return registrationYearId;
    }

    public void setRegistrationYearId(Integer registrationYearId) {
        this.registrationYearId = registrationYearId;
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
    @Column(name = "from", nullable = false)
    public Timestamp getFrom() {
        return from;
    }

    public void setFrom(Timestamp from) {
        this.from = from;
    }

    @Basic
    @Column(name = "to", nullable = false)
    public Timestamp getTo() {
        return to;
    }

    public void setTo(Timestamp to) {
        this.to = to;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Registration that = (Registration) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (from != null ? !from.equals(that.from) : that.from != null) return false;
        if (to != null ? !to.equals(that.to) : that.to != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (from != null ? from.hashCode() : 0);
        result = 31 * result + (to != null ? to.hashCode() : 0);
        return result;
    }
}
