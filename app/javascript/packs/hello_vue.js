/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

// import Vue from 'vue'
// import App from '../app.vue'
//
// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     render: h => h(App)
//   }).$mount()
//   document.body.appendChild(app.$el)
//
//   console.log(app)
// })

// app.vueを表示させる
// import Vue from 'vue'
// import App from '../app.vue'
//
// document.addEventListener('DOMContentLoaded', () => {
//   document.body.appendChild(document.createElement('hello'))
//   const app = new Vue(App).$mount('hello')
//
//   console.log(app)
// })

import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'

document.addEventListener('DOMContentLoaded', () => {
  // document.body.appendChild(document.createElement('hello'));
  // const app = new Vue(App).$mount('hello')

  console.log(app)
  // const app = new Vue({
  //   render: h => h(App)
  // }).$mount()
  // document.body.appendChild(app.$el)
  //
  // console.log(app)
});

const app = new Vue({
  el: '#hello',
  data: {
    message: "hogehoge?"
  }
});


// The above code uses Vue without the compiler, which means you cannot
// use Vue to target elements in your existing html templates. You would
// need to always use single file components.
// To be able to target elements in your existing html/erb templates,
// comment out the above code and uncomment the below
// Add <%= javascript_pack_tag 'hello_vue' %> to your layout
// Then add this markup to your html template:
//
// <div id='hello'>
//   {{message}}
//   <app></app>
// </div>

// これまで使ってたところ
// import Vue from 'vue/dist/vue.esm'
// import router from './routes.js'
// import axios from "axios";
// import VueAxiosPlugin from "./plugins/vue-axios";
// // import App from '../app.vue'
//
// Vue.use(VueAxiosPlugin, { axios: axios });
//
// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     el: '#vue_area',
//     router
//     // data: {
//     //   message: "Can you say hello?"
//     // },
//     // components: { App }
//   })
// })

//
//
// If the project is using turbolinks, install 'vue-turbolinks':
//
// yarn add vue-turbolinks
//
// Then uncomment the code block below:
//
// import TurbolinksAdapter from 'vue-turbolinks'
// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// Vue.use(TurbolinksAdapter)
//
// document.addEventListener('turbolinks:load', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: () => {
//       return {
//         message: "Can you say hello?"
//       }
//     },
//     components: { App }
//   })
// })
