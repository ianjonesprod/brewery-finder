<template>
  <form class="new-beer-form" v-on:submit.prevent="saveBeer">
    <input
      class="name-input"
      type="text"
      placeholder="Beer Name"
      v-model="beer.name"
    />
    <div>
      <input
        class="brewery-name-input"
        type="text"
        placeholder="Brewery Name"
        v-model="beer.breweryName"
      />
    </div>

    <div>
      <input
        class="beer-type-input"
        type="text"
        placeholder="Type of Beer"
        v-model="beer.beerType"
      />
    </div>
    <div>
      <input
        class="abv-input"
        type="text"
        placeholder="ABV"
        v-model="beer.abv"
      />
    </div>
    <div>
      <input
        class="description"
        type="textbox"
        placeholder="Description"
        v-model="beer.description"
      />
    </div>
      <div>
        <input type="file" ref="file" style="display: none" class="image-upload">
        <button @click="$refs.file.click()" class="image-upload">Upload Image</button>
      <!-- <button
        class="image-upload"
        type="file"
        placeholder="Image">Upload Image</button> -->
    </div>
    <button class="save-btn">Save</button>
  </form>
</template>

<script>
import beerService from "../services/BeerService";

export default {
  
  name: "new-beer-form",
  props: {
    breweryName: Object,
  },
  data() {
    return {
      beer: {
        breweryName: this.$route.params.breweryName,
        name: "Gurgly Gordon IPA",
        imageUrl: "",
        beerType: "IPA",
        abv: "7.3",
        description: "Named after Melinda's Dog",
      },
    };
  },
  methods: {
    saveBeer() {
      // this.$store.commit('SAVE_BEER', this.beer);
      this.beer.abv = "ABV: " + this.beer.abv + "%";
      beerService.addBeer(this.beer, this.$store.state.token);
      this.beer = {
        breweryName: "",
        name: "",
        imageUrl: "",
        beerType: "",
        abv: "",
        description: "",
      };
      alert("Your beer has been added.");
      this.$router.push({ name: "home" });
    },
  },
};

</script>

<style>
.new-beer-form {
  margin: 20px;
  text-align: center;
}

.new-beer-form input {
  margin: 10px;
  font-size: 1rem;
  padding-top: 10px;
  padding-bottom: 10px;
  border-radius: 10px;
  width: 23%;
}


.image-upload {
  margin-top: 20px;
  background-color: #f0a500;
  font-size: 20px;
  border-radius: 46px;
  -moz-border-radius: 46px;
  -webkit-border-radius: 46px;
  border: 0px solid #060124;
  font-family: "Poppins";
  justify-content: center;
  color: black;
  margin-bottom: 10px;
  width: 210px;
  height: 35px;
  text-align: center;
  
 
}

.save-btn {
    margin-top: 20px;
  background-color: #f0a500;
  font-size: 20px;
  border-radius: 46px;
  -moz-border-radius: 46px;
  -webkit-border-radius: 46px;
  border: 0px solid #060124;
  font-family: "Poppins";
  justify-content: center;
  color: black;
  margin-bottom: 10px;
  width: 210px;
  height: 35px;
  text-align: center;
  
 
}

h1 {
  text-align: center;
}
</style>