<template>
  
  <form class="new-brewery-form" v-on:submit.prevent="saveBeer">
    <input class="name-input" type="text" placeholder="Brewery Name" v-model="beer.name" />
    <div>
    <input class="brewery-name-input" type="text" placeholder="Hours of Operation" v-model="beer.breweryName" />
    </div>
    <div>
    <input class="image-input" type="text" placeholder="Days of Operation" v-model="beer.imageUrl" />
    </div>
    <div>
    <input class="beer-type-input" type="text" placeholder="Address" v-model="beer.beerType" />
    </div>
    <div>
    <input class="abv-input" type="text" placeholder="History" v-model="beer.abv" />
    </div>
    <div>
    <input class="description" type="textbox" placeholder="Acitve Brewery?" v-model="beer.description" />
    </div>
    <button>Update Brewery</button>
  </form>
</template>

<script>

import beerService from '../services/BeerService';

export default {
    name: "new-brewery-form",
    props: {
        breweryName: Object
    },
    data() {
        return {
            beer: {
                breweryName: this.$route.params.breweryName,
                name: '',
                imageUrl: '',
                type: '',
                abv: '',
                description: ''
            }
        }
    },
    methods: {
        saveBeer() {
            // this.$store.commit('SAVE_BEER', this.beer);
            this.beer.abv='ABV: ' + this.beer.abv + '%';
            beerService.addBeer(this.beer, this.$store.state.token);
            this.beer = {
                breweryName: '',
                name: '',
                imageUrl: '',
                beerType: '',
                abv: '',
                description: ''
            };
            alert('Your beer has been added.')
            this.$router.push({ name: "home"});
        }
    }
}
</script>

<style>
.new-brewery-form {
    margin: 20px;
    text-align: center;
}

.new-brewery-form input {
    margin: 10px;
    font-size: 1rem;
     padding-top: 10px;
  padding-bottom: 10px;
  border-radius: 10px;
  width: 23%;
}

 .new-brewery-form button {
     margin: 10px;
    font-size: 1rem;
     padding-top: 10px;
    padding-bottom: 10px;
  border-radius: 10px;
  width: 15%;
 }

h1 {
    text-align: center;
}
</style>