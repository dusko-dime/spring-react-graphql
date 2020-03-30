package graphql.demo.resolvers;

import com.coxautodev.graphql.tools.GraphQLMutationResolver;
import org.springframework.stereotype.Component;

@Component
public class BMutation implements GraphQLMutationResolver {

    public String createTest(String year) {
        return year;
    }
}