package graphql.demo.resolvers;

import com.coxautodev.graphql.tools.GraphQLQueryResolver;
import graphql.demo.model.Vehicle;
import graphql.demo.service.VehicleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class BQuery implements GraphQLQueryResolver {

    @Autowired
    private VehicleService vehicleService;

    public List<Vehicle> getVehiclesFromSecondSchemaFile(final int count) {
        return this.vehicleService.getAllVehicles(count);
    }

}
