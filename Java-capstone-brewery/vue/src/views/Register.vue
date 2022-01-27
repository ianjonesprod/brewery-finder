<template>
  <div id="register" class="text-center">
    <form class="form-register" @submit.prevent="register">
      <h1 class="h3 mb-3 font-weight-normal">Create Account</h1>
      <div class="alert alert-danger" role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div>
      <div>
      <label for="username" class="sr-only"></label>
      <input
        type="text"
        id="username"
        class="register-input form-control-register"
        placeholder="  Username"
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
        class="register-input form-control-register"
        placeholder="  Password"
        v-model="user.password"
        required
      />
      </div>
      <div class="password">
      <input
        type="password"
        id="confirmPassword"
        class="register-input form-control-register"
        placeholder="  Confirm Password"
        v-model="user.confirmPassword"
        required
      />
      </div>
      <!-- <div>
        <h3>Select user type:</h3>
         <select id="userTyoe" v-model="user.role">
           
            <option value="user">Beer Lover</option>
            <option value="brewer">Brewer</option>
         </select>
      </div> -->
      <router-link :to="{ name: 'login' }" id="haveAccount">Have an account?</router-link>
      <button class=" btn-lg btn-primary btn-block register-btn" type="submit">
        Register
      </button>    
         
    </form>
  </div>
</template>

<script>
import authService from '../services/AuthService';

export default {
  name: 'register',
  data() {
    return {
      user: {
        username: 'NewUser',
        password: 'NewUser',
        confirmPassword: 'NewUser',
        role: 'brewer',
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: '/login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
};
</script>

<style>
#register {
  font-family:  "Poppins-Bold", Helvetica, Arial, sans-serif;
    text-align: center;
    color: white;
    max-width: 800px;
    margin: 60px auto 0 auto;
    display: flex;
    justify-content: space-evenly;
    border: 0px solid #f1f1f1;
    padding-bottom: 55px;
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
.register-input {
  padding-top: 5px;
  padding-bottom: 5px;
  border-radius: 5px;
  width: 65%;
}

.register {
  color: black;
  font-family: "Poppins";
}

.form-control-register {
  padding-top: 12px;
  border-radius: 10px;
  -moz-border-radius: 10px;
  -webkit-border-radius: 10px; 
}

.register-btn {
  margin-left: 30px;
  margin-top: 30px;
  margin-bottom: 0px;
  background-color:#F0A500;
  width: 200px;
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

