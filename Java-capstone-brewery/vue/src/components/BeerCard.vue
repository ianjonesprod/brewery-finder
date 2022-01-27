<template>
    <div class="beer-card">
        <div class="beer-name">
        <router-link class="beerDetail" v-bind:to="{ name: 'beerDetails', params: { beer: beer } }"><h2 class="beer-name">{{ beer.name }}</h2></router-link>
        </div>
        <!-- Beer Image !-->
        <router-link class="beerDetail" v-bind:to="{ name: 'beerDetails', params: { beer: beer } }"> <img class="beer-image" v-bind:src="beer.imageUrl" /> </router-link>
       
        <h3 class="beer-type">{{ beer.beerType }}</h3>
        <p class="beer-abv">{{ beer.abv }}</p>
        <p class="beer-description">{{ beer.description }}</p>
        <br/>
        <!-- STAR RATING GOES HERE !-->
        
        <icon name="star" id="star"/><icon name="star" id="star"/><icon name="star" id="star"/><icon name="star" id="star"/>
        <br/>
        <router-link class="beerDetail" id="beerLink" v-bind:to="{ name: 'beerDetails', params: { beer: beer } }"> Beer Detail</router-link> 

        <!-- <router-link v-bind:to="{name: 'NewBeer'}">Add New Beer </router-link> -->


    </div>
</template>

<script>
export default {
    name: "beer-card",
    props: {
        beer: Object
    },
    data: function () {
        return {
        
         }
        }
}

</script>

<style> 
.beer-card {
    border: 2px solid black;
    border-radius: 10px;
    width: 330px;
    height: 620px;
    margin: 20px;
    padding: 15px;
    background-color: #334756;
    text-align: center;
}

.beer-image {
   
    display: inline-block;
    /* align-items: center; */
    max-height: 150px;
    max-width: 200px;
    padding-top: 18px;
    
}

.beer-name {
    display: block;
    font-size: 1.2rem;
    height: 80px;
    font-family: "Poppins", Arial;
    /* text-align: center; */
   
}

.beerDetail {
    font-family: "Poppins", Arial;
    display: inline-block;
    align-content: center;
    text-align: center;
    max-width: 200px;
    padding-right: 5px;
}

#star {
    color: #f0a500;
}

#beerLink {
    color:  #f0a500;
    /* text-align: center; */
}

#beerLink:hover {
    color: gray;
}


</style>