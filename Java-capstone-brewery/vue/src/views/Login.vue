<template>
  <div id="login" class="text-center">
    <form class="form-signin" @submit.prevent="login">
      <h1 class="h3 mb-3 font-weight-normal">Please Sign In</h1>
      <div
        class="alert alert-danger"
        role="alert"
        v-if="invalidCredentials"
      >Invalid username and password!</div>
      <div
        class="alert alert-success"
        role="alert"
        v-if="this.$route.query.registration"
      >Thank you for registering, please sign in.</div>
      <div>
      <label for="username" class="sr-only"></label>
      <input
        type="text"
        id="username"
        class="form-control login-input"
        placeholder="   Username"
        v-model="user.username"
        required
        autofocus
      />
      </div>
      <div class="password">
      <label for="password" class="sr-only"></label>
      <input
        type="password"
        id="password"
        class="form-control login-input"
        placeholder="   Password"
        v-model="user.password"
        required
      />
      </div>
      <div class="register">
      <router-link  :to="{ name: 'register' }">Need an account?</router-link>
      <button class="login-btn" type="submit">Sign in</button>
      </div>
    </form>
  </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "NewUser",
        password: "NewUser"
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/breweries");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>

<style>


@import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');


#login {
  font-family:  "Poppins-Bold", Helvetica, Arial, sans-serif;
    text-align: center;
  color: white;
  max-width: 800px;
  margin: 60px auto 0 auto;
  display: flex;
  justify-content: space-evenly;
  border: 0px solid #f1f1f1;
  padding-bottom: 85px;
  padding-inline: 25px;
  background-color: #334756;
}

body {
  background-color: #082032;
}

.h3{
  font-family:  "Poppins-Bold", Helvetica, Arial, sans-serif;
  font-size: 38px;
   text-align: center;
  color: white;
  max-width: 800px;
  margin: 60px auto 20px auto;
  padding-block: 40px;
  flex-basis: 230px;  

}

.alert {
  display: block;
  
}
.login-input {
  padding-top: 10px;
  padding-bottom: 10px;
  border-radius: 10px;
  width: 65%;

}

.register {
  color: black;
  font-family: "Poppins";
}

.password {
  padding-top: 20px;
  border-radius: 46px;
  -moz-border-radius: 46px;
  -webkit-border-radius: 46px;
}

.login-btn {
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


.button-disabled {
  margin-left: 30px;
  margin-top: 20px;
  margin-bottom: 20px;
  background-color:#631c51;
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
