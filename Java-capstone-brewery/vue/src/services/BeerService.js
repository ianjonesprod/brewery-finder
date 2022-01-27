import axios from 'axios';

const http = axios.create({baseURL: 'http://localhost:8080'}
);

export default {
    beerList() {
        return http.get('/breweries/${name}/beers');
    },

    getBeerByBrewer(name, token) {
        return http.get(`/breweries/${name}/beer`, { headers: {'Authorization': 'Bearer '+token}} );
    },

    addBeer(beer, token) {
        return http.post(`/breweries/beer`, beer, { headers: {'Authorization': 'Bearer '+token}} );
    },
    deleteBeer(name, token) {
        return http.delete(`/breweries/beer/${name}`, { headers: {'Authorization': 'Bearer '+token}} );
    }
}