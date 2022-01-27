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
    <div class="detail-heading"></div>
    <div class="brewery-details-div">
      <div class="brewery-detail-card">
        <div>
          <h1 class="BreweryDetails">
            {{ this.$route.params.brewery.name }}
          </h1>

          <div class="brewery-hours">Hours of Operation:</div>
          <p class="hours"><b>Sunday:</b> &nbsp; 11am to 9pm</p>
          <p class="hours"><b>Monday - Thursday:</b> &nbsp; 11am to 12am</p>
          <p class="hours"><b>Friday & Saturday:</b> &nbsp; 11am to 2am</p>
          <br />
          <p class="brewery-address">
            {{ getFormattedStreet(this.$route.params.brewery.street) }}
            {{ this.$route.params.brewery.city }},
            {{ this.$route.params.brewery.state }}
          </p>
          <p class="brewery-phone">
            {{ formatPhoneNumber(this.$route.params.brewery.phone) }}
          </p>
          <p>
            <a
              target="_blank"
              class="brewery-email"
              v-if="this.$route.params.brewery.website_url"
              v-bind:href="this.$route.params.brewery.website_url"
              >Visit Our Website</a
            >
          </p>
        </div>
        <div>
          <button
            v-if="this.showButton"
            class="btn-claim-brewery"
            v-on:click="claimBrewery"
          >
            {{ this.buttonText }}
          </button>
          <p class="claim-pending-message" v-else>
            Waiting for approval of claimed brewery
          </p>
        </div>
      </div>
    </div>
    <div class="beer-list-outer-div">
      <div class="beer-list-section">
        <beer-list class="beerlist"></beer-list>
      </div>
    </div>
  </section>
</template>


<script>
import BeerList from "./BeerList.vue";

export default {
  name: "brewery-details",
  props: {
    brewery: Object,
    enableAdd: {
      type: Boolean,
      default: false,
    },
  },
  mounted() {
    this.scrollToTop();
  },
  methods: {
    getFormattedStreet(street) {
      if (street) {
        return street + ",";
      }
      return street;
    },
    claimBrewery() {
      this.buttonText = "Claim Pending";
      this.showButton = false;
      alert("Your request has been submitted for admin approval.");
      //add classs to the buttton button-disabled
    },
    scrollToTop() {
      window.scrollTo(0, 0);
    },
    formatPhoneNumber(phoneNumberString) {
      var cleaned = ("" + phoneNumberString).replace(/\D/g, "");
      var match = cleaned.match(/^(\d{3})(\d{3})(\d{4})$/);
      if (match) {
        return "(" + match[1] + ") " + match[2] + "-" + match[3];
      }
      return null;
    },

    randomNumber(max) {
      return Math.floor(Math.random() * max);
    },
  },
  data: function () {
    return {
      buttonText: "Claim This Brewery",
      buttonEnabled: true,
      showButton: true,
    };
  },
  components: {
    BeerList,
  },
};
</script>

<style>
.brewery-details-div {
  height: 400px;
  padding: 15px;
  background-color: #334756;
  margin: 25px;
  display: flex;
  flex-flow: row;
  justify-content: center;
  text-align: center;
  border: 2px solid black;
  border-radius: 10px;
  list-style: none;
}

.beer-list-outer-div {
  height: 400px;
  margin: 15px;
  display: flex;
  flex-flow: row;
  list-style: none;
}
.BreweryDetails {
  font-size: 2rem;
  height: 20px;
  text-align: center;
  font-family: "Poppins", Arial;
  font-weight: bold;
}

.brewery-hours {
  /* font-style: italic; */
  color: rgb(160, 139, 80);
  font-size: 20px;
  font-weight: bold;
  text-decoration: underline;
  font-family: "Poppins", Arial;
}

.hours {
  /* font-style: italic; */
  color: rgb(160, 139, 80);
  line-height: 0.25;
}

.brewery-address {
  text-align: center;
  font-size: 1rem;
  font-family: "Poppins";
  margin-top: 0px;
  padding-top: 0px;
}

.brewery-phone {
  text-align: center;
  font-size: 1rem;
  font-family: "Poppins";
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
}

.beerlist {
  /* display: flex; */
  justify-content: space-evenly;
  flex-wrap: wrap;
  color: white;
}

.beer-list-section {
  width: 100%;
}

.claim-pending-message {
  color: yellow;
  font-size: 110%;
}

#header {
  text-align: center;
  font-size: 160%;
  font-weight: bold;
  font-family: "Poppins";
}

.detail-heading {
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  background-image: url("../../public/barrels.jpg");
  height: 200px;
}

.btn-claim-brewery {
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
</style>

