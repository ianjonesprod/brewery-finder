import Vue from 'vue'
import Router from 'vue-router'
import Home from '../views/Home.vue'
import Login from '../views/Login.vue'
import Logout from '../views/Logout.vue'
import Register from '../views/Register.vue'
import store from '../store/index'
import BeerList from '../views/BeerList.vue'
import Landing from '../views/Landing.vue'
import BreweryDetails from '../views/BreweryDetails.vue'
import BreweryCard from '../components/BreweryCard.vue'
import UpdateBrewery from '../views/UpdateBrewery.vue'
import BeerDetails from '../views/BeerDetails.vue'
import NewBeer from '@/views/NewBeer'

Vue.use(Router)

/**
 * The Vue Router is used to "direct" the browser to render a specific view component
 * inside of App.vue depending on the URL.
 *
 * It also is used to detect whether or not a route requires the user to have first authenticated.
 * If the user has not yet authenticated (and needs to) they are redirected to /login
 * If they have (or don't need to) they're allowed to go about their way.
 */

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'landing',
      component: Landing,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: '/breweries',
      name: 'home',
      component: Home,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '/brewerydetails',
      name: 'breweryDetails',
      component: BreweryDetails,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '/addBeer',
      name: 'NewBeer',
      component: NewBeer
    },
    {
      path: "/login",
      name: "login",
      component: Login,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/logout",
      name: "logout",
      component: Logout,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/register",
      name: "register",
      component: Register,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/breweries/beer",
      name: "beerList",
      component: BeerList,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/breweries/beer/beerdetails",
      name: "beerDetails",
      component: BeerDetails,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/breweries",
      name: "breweries",
      component: BreweryCard,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/updateBrewery",
      name: "update brewery",
      component: UpdateBrewery,
      meta: {
        requiresAuth: false
      }
    },
    // {
    //   path: "breweries/review/${beerName}",
    //   name: "review",
    //   component: Review,
    //   meta: {
    //     requiresAuth: false
    //   }
    // }
  ]
})

router.beforeEach((to, from, next) => {
  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && store.state.token === '') {
    next("/login");
  } else {
    // Else let them go to their next destination
    next();
  }
});

export default router;
