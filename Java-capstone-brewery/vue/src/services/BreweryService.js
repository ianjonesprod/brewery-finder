import axios from 'axios';

const http = axios.create({
  baseURL: "http://localhost:8080"
});

export default {
    breweryList(city, state) {
        return http.get(`/breweries/${city}/${state}`);
        
      }
  

}


