import ApolloClient from 'apollo-boost';
import { gql } from "apollo-boost";

export const apollo = new ApolloClient({
    uri: 'http://localhost:8080/graphql'
});

export const query = async (queryString) => {
    return apollo
        .query({
            query: gql`
        ${queryString}
    `
        })
        .then(result => {
            return result.data;
        });
}