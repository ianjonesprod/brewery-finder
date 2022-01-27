<template>
  <div class="home">
    <h1></h1>
    <brewery-list/>
    
  </div>
</template>

<script>
import BreweryList from "./BreweryList";

export default {
  name: "home",
  components: {
    BreweryList
   
  }
};
</script>
