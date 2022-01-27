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
    <div class="beer-detail-heading"></div>
    <div class="beer-details-outer-div">
      <ul class="flex-container">
        <li class="flex-i1">
          <img
            class="beer-detail-image"
            v-bind:src="this.$route.params.beer.imageUrl"
          />
        </li>
        <li class="flex-i2">
          <h1 class="BeerDetails">
            {{ this.$route.params.beer.name }}
          </h1>
          <p>
            {{ this.$route.params.beer.type }}
          </p>

          <p>
            {{ this.$route.params.beer.abv }}
          </p>
          <p>
            {{ this.$route.params.beer.description }}
          </p>
          <!-- STAR RATING GOES HERE !-->
          
          <p class="avg-rating">Avg Rating: 3.9
          <icon name="star" id="star-rating"/><icon name="star" id="star-rating"/><icon name="star" id="star-rating"/><icon name="star" id="star-rating"/>
          </p>
          <br/>
          <div class="delete-beer-button">
            <button
              class="btn-deleteBeer"
              v-on:click="deleteBeer"
              v-if="$store.state.user.authorities[0].name == 'ROLE_BREWER'"
            >
              Delete Beer
            </button>
          </div>
          <div class="status-message error" v-show="errorMsg !== ''">
            {{ errorMsg }}
          </div>
        </li>
      </ul>
    </div>
  </section>
</template>

<script>
import beerService from "../services/BeerService";
export default {
  name: "beer-details",
  props: {
    beer: Object,
  },
  data: function () {
    return {
      errorMsg: "",
    };
  },
  components: {},
  mounted() {
    this.scrollToTop();
  },
  methods: {
    scrollToTop() {
      window.scrollTo(0, 0);
    },
    deleteBeer() {
      if (confirm("Are you sure you want to delete this beer?")) {
        //  alert(this.$route.params.beer.name);
        beerService
          .deleteBeer(this.$route.params.beer.name, this.$store.state.token)
          .then((response) => {
            if (response.status === 200) {
              alert("Beer successfully deleted");
              this.$router.push(`/breweries`);
            }
          })
          .catch((error) => {
            if (error.response) {
              this.errorMsg =
                "Error deleting beer. Response received was '" +
                error.response.statusText +
                "'.";
            } else if (error.request) {
              this.errorMsg =
                "Error deleting beer. Server could not be reached.";
            } else {
              this.errorMsg =
                "Error deleting beer. Request could not be created.";
            }
          });
      }
    },
  },
};
</script>

<style>
.beer-detail-image {
  max-height: 350px;
  padding-top: 15px;
}

.beer-details-outer-div {
  width: 100%;
  overflow: hidden;
}

.avg-rating {
  font-size: 30px;
}

#star-rating {
  font-size: smaller;
  color: #f0a500;
}

.btn-deleteBeer {
   margin-top: 20px;
  background-color: #f0a500;
  font-size: 20px;
  border-radius: 46px;
  -moz-border-radius: 46px;
  -webkit-border-radius: 46px;
  border: 0px solid #060124;
  font-family: "Poppins";
  justify-content: center;
  color: #fff;
  margin-bottom: 10px;
  width: 210px;
  height: 35px;
  text-align: center;
}

#back {
  font-size: 160%;
  font-weight: bold;
  font-family: "Poppins", Arial;
  padding-left: 15px;
}

.beer-list {
  display: flex;
  justify-content: space-evenly;
  flex-wrap: wrap;
  color: white;
}

.beerlist {
  /* display: flex; */
  justify-content: space-evenly;
  flex-wrap: wrap;
  color: white;
}

#header {
  text-align: center;
  font-size: 160%;
  font-weight: bold;
  font-family: "Poppins", Arial;
}

.beer-detail-heading {
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  background-image: url("../../public/beer3.jpg");
  height: 300px;
}

h1,
h2,
h3,
h4,
p {
  font-family: "Poppins", Arial;
}

.error {
  color: rgba(231, 137, 137, 0.801);
  font-size: 110%;
  padding-top: 10px;
}

.flex-container {
  /* width: 100%; */
  height: 400px;
  padding: 15px;
  background-color: #334756;
  margin: 25px;
  display: flex;
  flex-flow: row;
  border: 2px solid black;
  border-radius: 10px;
  list-style: none;
}

.flex-i1 {
  flex-basis: 33%;

  padding: 5px;
  margin: 10px;
  color: white;
  text-align: center;
  justify-content: center;
  align-self: center;
}

.flex-i2 {
  flex-basis: 62%;
  padding: 5px;
  margin: 10px;
  color: white;
  text-align: center;
  justify-content: center;
  align-self: center;
}
</style>

