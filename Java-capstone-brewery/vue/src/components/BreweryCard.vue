<template>
  <div class="card"  >
    <router-link class="brewery-name" v-bind:to="{ name: 'breweryDetails', params: { brewery: brewery } }">{{ brewery.name }}</router-link>
    <router-link class="brewery-image" v-bind:to="{ name: 'breweryDetails', params: { brewery: brewery } }"><img v-bind:src="pictures[randomNumber(11)]" /></router-link>
    <!-- <img v-bind:src="'https://images.saymedia-content.com/.image/c_limit%2Ccs_srgb%2Cq_auto:eco%2Cw_700/MTc0OTg5MDY5MjQ2NjA0NzQw/200-best-brewery-name-ideasgenius-funny-and-hip.webp' " /> -->
   <div class="address-info">
    <h3 class="brewery-city">{{ brewery.city }}, {{ brewery.state}} </h3>
    <p class="brewery-info">{{ brewery.street}}</p>
    </div> 
    <br>
    <br>
    <div class="brewery-links">
    <a class="brewery-website" target="_blank" v-if="brewery.website_url" v-bind:href="brewery.website_url" >Visit Our Website</a>
    <br>
    <router-link class="breweryDetail" id="link" v-bind:to="{ name: 'breweryDetails', params: { brewery: brewery } }"> Brewery Detail</router-link> 
  </div>
  </div>
</template>

<script>
export default {
    name: 'brewery-card',
    data: function () {
      return { 
      pictures: ["beerbottles.jpg", "brewery-from-upper.jpeg", "brewery-with-crate-of-beer.webp", "brewery-with-lights.webp", "brewery-with-restaurant.webp", "breweryequipment.jpg", "foamingbeer.jpg", "hops-field.jpg", "hops.webp", "silver-beer-container.webp", "taps.jpg"]
      
      }},
    props: {
        brewery: Object
    },
    methods: {
        formatPhoneNumber(phoneNumberString) {
                var cleaned = ('' + phoneNumberString).replace(/\D/g, '');
                var match = cleaned.match(/^(\d{3})(\d{3})(\d{4})$/);
                if (match) {
                    return '(' + match[1] + ') ' + match[2] + '-' + match[3];
                }
                return null;
        },

        randomNumber(max){
              return Math.floor(Math.random() * max);
        }
              
    }
}
</script>

<style>
.card {
    border: 2px solid black;
    border-radius: 10px;
    width: 250px;
    height: 510px;
    margin: 25px;
    padding: 30px;
    background-color: #334756;
}

img {
    max-height: 200px;
    max-width: 250px;
}

.card.read {
    background-color: lightgray;
}

.brewery-name {
    display: block;
    font-size: 1.5rem;
    height: 80px;
    font-family: "Poppins", Arial;
   
}
.address-info {
    line-height: .40;
}

.brewery-links {
    position:relative;
}

#link:hover {
    color: gray; 
}




</style>