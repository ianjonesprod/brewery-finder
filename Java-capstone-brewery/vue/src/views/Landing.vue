<template>
<section>
  <div  class="bg">
    <!-- <h1>Welcome</h1> -->
    <div class="ageButton">
      <h1>AGE VERIFICATION</h1>
       <p >You must be of drinking age to enter this site. Click below if you are 21 or older. </p>
    <button class="landing-btn" v-on:click="navigate">I am 21</button>

    </div>
   
  </div>
   </section>
</template>

<script>
 
export default {
  name: "landing",
data () {
  return {
    
}

},
methods: {
  navigate() {
    this.$router.push("/login");
  }
}
}

</script>

<style scoped>
body, html {
  height: 100%;
  margin: 0;
 

}

h1 {
  padding: 0px;
}


.bg {
  background-image: url("../../public/brewery.jpg");
  height: 100vh;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  text-align: center;
} 

.ageButton {
  display: inline-block;
  /* position: absolute; */
  top: 50%;
  margin-top: 165px;
  transform: traslateY(-50%);
  background-color: rgba(15, 14, 14, 0.6);
  padding: 10px;
  
}
.beer-list {
    display:flex;
    justify-content: space-evenly;
    flex-wrap: wrap;
      color: white;
}
#header{
    text-align: center;
}

#search {
  text-align: center;
}

.landing-btn {
   margin-left: 30px;
  margin-top: 20px;
  margin-bottom: 20px;
  background-color:#F0A500;
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

</style>
