<template>
  <section>
    <div class="list-header">
      <h2>Beer List</h2>
      <div class="add-beer-link">
        <router-link
          id="add-beer"
          v-bind:to="{
            name: 'NewBeer',
            params: { breweryName: this.$route.params.brewery.name },
          }"
          v-if="$store.state.user.authorities[0].name == 'ROLE_BREWER'"
          >Add Beer</router-link
        >
    
      </div>
    </div>
    <div class="beer-list">
      <beer-card
        v-for="beer in beers"
        v-bind:beer="beer"
        v-bind:key="beer.name"
      />
    </div>
    <div class="beer-list-not-found">

      <p v-if="beers.length == 0">No beer found.</p>
    </div>
  </section>
</template>

<script>
import BeerCard from "../components/BeerCard.vue";
import beerService from "../services/BeerService";
export default {
  name: "beer-list",
  mounted() {
    this.searchBeer(this.$route.params.brewery.name);
  },
  methods: {
    searchBeer(breweryName) {
      beerService
        .getBeerByBrewer(breweryName, this.$store.state.token)
        .then((response) => {
          if (response.status == 200) {
            this.beers = response.data;
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
      beers: [],
    };
  },

  components: {
    BeerCard,
  },
};
</script>

<style>
.add-beer-link {
  /* margin-right: 55px; */
  display: block;
}

.beer-list-not-found {
  width: 100%;
  text-align: center;
}

#add-beer {
  font-size: 1rem;
  font-weight: bold;
  /* display: block; */
  align-self: center;
  text-align: center;
  /* border: 2px solid black; */
  border-radius: 20px;
  width: 210px;
  height: 22px;
  margin: 10px;
  padding: 8px;
  background-color: #f0a500;
}
.beer-list {
  /* display: flex; */
  justify-content: space-evenly;
  flex-wrap: wrap;
  color: white;
}
#header {
  text-align: center;
}

#search {
  text-align: center;
}

.list-header {
  text-align: center;
  display: block;
  align-items: center;
  font-size: 1.5rem;
}
</style>
