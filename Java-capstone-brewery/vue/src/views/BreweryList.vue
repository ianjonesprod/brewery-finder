<template>
  <section>
    <div class="backButton">
      <router-link
        id="back"
        v-bind:to="{ name: 'home' }"
        v-if="$store.state.token != ''"
        >Back</router-link
      >
    </div>
    <div class="searchSection">
      <div class="searchform">
        <p
          class="Welcome"
          v-if="$store.state.user.authorities[0].name == 'ROLE_USER'"
        >
          Welcome Beer Lover
        </p>
        <p class="Welcome" v-else>Welcome Brewer</p>
        <h2>Search For Breweries</h2>

        <form id="search">
          <input
            type="text"
            v-model="city"
            id="searchValue"
            placeholder="    Enter city"
            name="search"
          />
          <select id="state" v-model="state">
            <option disabled value="">Please select a state</option>
            <option value="Alabama">AL</option>
            <option value="Alaska">AK</option>
            <option value="Arizona">AZ</option>
            <option value="Arkansas">AR</option>
            <option value="California">CA</option>
            <option value="Colorado">CO</option>
            <option value="Connecticut">CT</option>
            <option value="Delaware">DE</option>
            <option value="District of Columbia">DC</option>
            <option value="Florida">FL</option>
            <option value="Georgia">GA</option>
            <option value="Hawaii">HI</option>
            <option value="Idaho">ID</option>
            <option value="Illinois">IL</option>
            <option value="Indiana">IN</option>
            <option value="Iowa">IA</option>
            <option value="Kansas">KS</option>
            <option value="Kentucky">KY</option>
            <option value="Louisiana">LA</option>
            <option value="Maine">ME</option>
            <option value="Maryland">MD</option>
            <option value="Massachusetts">MA</option>
            <option value="Michigan">MI</option>
            <option value="Minnesota">MN</option>
            <option value="Mississippi">MS</option>
            <option value="Missouri">MO</option>
            <option value="Montana">MT</option>
            <option value="Nebraska">NE</option>
            <option value="Nevada">NV</option>
            <option value="New Hampshire">NH</option>
            <option value="New Jersey">NJ</option>
            <option value="New Mexico">NM</option>
            <option value="New York">NY</option>
            <option value="North Carolina">NC</option>
            <option value="North Dakota">ND</option>
            <option value="Ohio">OH</option>
            <option value="Oklahoma">OK</option>
            <option value="Oregon">OR</option>
            <option value="Pennsylvania">PA</option>
            <option value="Rhode Island">RI</option>
            <option value="South Carolina">SC</option>
            <option value="South Dakota">SD</option>
            <option value="Tennessee">TN</option>
            <option value="Texas">TX</option>
            <option value="Utah">UT</option>
            <option value="Vermont">VT</option>
            <option value="Virginia">VA</option>
            <option value="Washington">WA</option>
            <option value="West Virginia">WV</option>
            <option value="Wisconsin">WI</option>
            <option value="Wyoming">WY</option>
          </select>
          <button
            class="search-btn"
            type="button"
            v-on:click="searchBrewery"
            id="submit"
          >
            Search
          </button>
        </form>
      </div>
    </div>
    <div class="searchResults">
      <p v-if="this.breweries.length > 0">
        Results for breweries in {{ this.city }} , {{ this.state }}. &nbsp;
        Click on a brewery to learn more.
      </p>
    </div>
    <div class="brewery-list">
      <brewery-card
        v-for="brewery in breweries"
        v-bind:brewery="brewery"
        v-bind:key="brewery.name"
      />
    </div>
  </section>
</template>

<script>
import BreweryCard from "@/components/BreweryCard.vue";
import breweryService from "../services/BreweryService";

export default {
  name: "brewery-list",
  mounted() {
    this.searchBrewery();
  },
  methods: {
    searchBrewery() {
      this.$store.commit("SET_CITY", this.city);
      this.$store.commit("SET_STATE", this.state);
      breweryService
        .breweryList(this.city, this.state)
        .then((response) => {
          if (response.status == 200) {
            this.breweries = response.data;
          }
        })
        .catch((error) => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    },
  },

  data: function () {
    return {
      breweries: [],
      city: this.$store.state.city,
      state: this.$store.state.state,
      usStates: [
        { name: "ALABAMA", abbreviation: "AL" },
        { name: "ALASKA", abbreviation: "AK" },
        { name: "AMERICAN SAMOA", abbreviation: "AS" },
        { name: "ARIZONA", abbreviation: "AZ" },
        { name: "ARKANSAS", abbreviation: "AR" },
        { name: "CALIFORNIA", abbreviation: "CA" },
        { name: "COLORADO", abbreviation: "CO" },
        { name: "CONNECTICUT", abbreviation: "CT" },
        { name: "DELAWARE", abbreviation: "DE" },
        { name: "DISTRICT OF COLUMBIA", abbreviation: "DC" },
        { name: "FLORIDA", abbreviation: "FL" },
        { name: "GEORGIA", abbreviation: "GA" },
        { name: "HAWAII", abbreviation: "HI" },
        { name: "IDAHO", abbreviation: "ID" },
        { name: "ILLINOIS", abbreviation: "IL" },
        { name: "INDIANA", abbreviation: "IN" },
        { name: "IOWA", abbreviation: "IA" },
        { name: "KANSAS", abbreviation: "KS" },
        { name: "KENTUCKY", abbreviation: "KY" },
        { name: "LOUISIANA", abbreviation: "LA" },
        { name: "MAINE", abbreviation: "ME" },
        { name: "MARYLAND", abbreviation: "MD" },
        { name: "MASSACHUSETTS", abbreviation: "MA" },
        { name: "MICHIGAN", abbreviation: "MI" },
        { name: "MINNESOTA", abbreviation: "MN" },
        { name: "MISSISSIPPI", abbreviation: "MS" },
        { name: "MISSOURI", abbreviation: "MO" },
        { name: "MONTANA", abbreviation: "MT" },
        { name: "NEBRASKA", abbreviation: "NE" },
        { name: "NEVADA", abbreviation: "NV" },
        { name: "NEW HAMPSHIRE", abbreviation: "NH" },
        { name: "NEW JERSEY", abbreviation: "NJ" },
        { name: "NEW MEXICO", abbreviation: "NM" },
        { name: "NEW YORK", abbreviation: "NY" },
        { name: "NORTH CAROLINA", abbreviation: "NC" },
        { name: "NORTH DAKOTA", abbreviation: "ND" },
        { name: "NORTHERN MARIANA ISLANDS", abbreviation: "MP" },
        { name: "OHIO", abbreviation: "OH" },
        { name: "OKLAHOMA", abbreviation: "OK" },
        { name: "OREGON", abbreviation: "OR" },
        { name: "PALAU", abbreviation: "PW" },
        { name: "PENNSYLVANIA", abbreviation: "PA" },
        { name: "PUERTO RICO", abbreviation: "PR" },
        { name: "RHODE ISLAND", abbreviation: "RI" },
        { name: "SOUTH CAROLINA", abbreviation: "SC" },
        { name: "SOUTH DAKOTA", abbreviation: "SD" },
        { name: "TENNESSEE", abbreviation: "TN" },
        { name: "TEXAS", abbreviation: "TX" },
        { name: "UTAH", abbreviation: "UT" },
        { name: "VERMONT", abbreviation: "VT" },
        { name: "VIRGIN ISLANDS", abbreviation: "VI" },
        { name: "VIRGINIA", abbreviation: "VA" },
        { name: "WASHINGTON", abbreviation: "WA" },
        { name: "WEST VIRGINIA", abbreviation: "WV" },
        { name: "WISCONSIN", abbreviation: "WI" },
        { name: "WYOMING", abbreviation: "WY" },
      ],
    };
  },

  components: {
    BreweryCard,
  },
};
</script>

<style>
.search-btn {
  margin-left: 30px;
  margin-top: 20px;
  margin-bottom: 20px;
  background-color: #f0a500;
  width: 150px;
  height: 40px;
  color: black;
  font-size: 20px;
  border-radius: 46px;
  -moz-border-radius: 46px;
  -webkit-border-radius: 46px;
  border: 0px solid #060124;
  font-family: "Poppins";
  justify-content: center;
}
.searchSection {
  display: inline-block;
  text-align: center;
  top: 25vh;
  margin: 0;
  transform: traslateY(-50%);
  background-color: rgba(15, 14, 14, 0.6);
  padding: 20px;
  height: 45vh;
  width: 100%;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  background-image: url("../../public/Brewery-banner.jpg");
}

.searchform {
  transform: traslateY(-50%);
  background-color: rgba(15, 14, 14, 0.6);
  width: 40%;
  text-align: center;
  display: inline-block;
  margin-top: 15px;
}

.searchResults {
  text-align: left;
  font-family: "Poppins";
  font-size: 18px;
  padding-left: 10px;
}

.Welcome {
  text-align: center;
  font-size: 230%;
  font-family: "Poppins";
  font-weight: bold;
  margin: 5px;
}

#back {
  font-size: 160%;
  font-weight: bold;
  font-family: "Poppins";
  padding-left: 15px;
}
.brewery-list {
  display: flex;
  justify-content: space-evenly;
  flex-wrap: wrap;
  color: white;
  text-align: center;
}
#header {
  text-align: center;
}

#search {
  text-align: center;
  font-family: "Poppins";
}

#searchValue {
  margin: 15px;
  padding-top: 7px;
  padding-bottom: 7px;
  border-radius: 10px;
  width: 25%;
}

#state {
  margin: 15px;
  padding-top: 7px;
  padding-bottom: 7px;
  border-radius: 10px;
  width: 25%;
}

h3 {
  text-align: center;
  color: white;
}

h2 {
  color: white;
  text-align: center;
  font-family: "Poppins";
}

h4 {
  text-align: center;
  color: white;
  font-family: "Poppins";
}

h5 {
  color: white;
  padding-left: 15px;
  font-family: "Poppins";
}

#submit {
  width: 22%;
}
</style>