package graphql.demo.model;

import javax.persistence.*;

@Entity
@Table(name = "travel")
public class Travel {
    private Integer id;
    private String fromDestination;
    private String toDestination;
    private Integer vehicleId;
    private Vehicle vehicle;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "vehicle_id", nullable = false, insertable = false, updatable = false)
    public Vehicle getVehicle() {
        return vehicle;
    }

    public void setVehicle(Vehicle vehicle) {
        this.vehicle = vehicle;
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
    @Column(name = "from_destination", nullable = false, length = 50)
    public String getFromDestination() {
        return fromDestination;
    }

    public void setFromDestination(String fromDestination) {
        this.fromDestination = fromDestination;
    }

    @Basic
    @Column(name = "to_destination", nullable = false, length = 50)
    public String getToDestination() {
        return toDestination;
    }

    public void setToDestination(String toDestination) {
        this.toDestination = toDestination;
    }

    @Column(name = "vehicle_id", nullable = false)
    public Integer getVehicleId() {
        return vehicleId;
    }

    public void setVehicleId(Integer vehicleId) {
        this.vehicleId = vehicleId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Travel travel = (Travel) o;

        if (id != null ? !id.equals(travel.id) : travel.id != null) return false;
        if (fromDestination != null ? !fromDestination.equals(travel.fromDestination) : travel.fromDestination != null)
            return false;
        if (toDestination != null ? !toDestination.equals(travel.toDestination) : travel.toDestination != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (fromDestination != null ? fromDestination.hashCode() : 0);
        result = 31 * result + (toDestination != null ? toDestination.hashCode() : 0);
        return result;
    }
}
