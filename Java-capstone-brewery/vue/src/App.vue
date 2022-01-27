<template>
  <div id="app" >
    <div id="nav" style="background-color=white">
      <div id="menu">
           <router-link v-if="$store.state.token != ''" v-bind:to="{ name: 'home' }">
          <icon color="black" size="50px" name="home-fill"/>
      </router-link>&nbsp;&nbsp;
      
      </div>
      <div id="logo">High Spirits</div>
      <div id="menu-right">
        <!-- <router-link v-bind:to="{ name: 'breweryList' }" v-if="$store.state.token != ''">Breweries</router-link> &nbsp; | &nbsp;  -->
        <router-link id="logout" v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
      </div>
    </div>
    <router-view />
  
  </div>
</template>



<style>
#nav {
  padding: 20px;
  background-color: #f0a500;
  margin: 0px;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
}

#app {
  margin: -8px; 
  font-family: 'Poppins', Helvetica, Arial;
}

#logo {
  font-family: "Poppins", Arial;
  font-weight: bold;
  font-size: 70px;
  color: black;
  padding-bottom: 5px;
  flex: 1;
  display: flex;
  align-items: center;
  justify-content: space-around;
}

a:link {
  color: white;
  background-color: transparent;
  text-decoration: none;
}

 a:visited {
  color: white;
  font-weight: bold;
  background-color: transparent;
} 

a:hover {
  color: gray;
  background-color: transparent;
  text-decoration: underline;
}

h1, h2, h3, h4,
p {
  color: white;
  font-family: "Poppins", Arial;
}


#logout {
  color: black;
  font-family: "Poppins", Arial;
  font-size: 120%;
  font-weight: bold;

}
</style>