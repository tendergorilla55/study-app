import Vue from 'vue/dist/vue.esm';
import Router from 'vue-router';
import Index from '../app.vue';
import Question from '../components/question.vue'
import Expense from '../components/expense.vue'

Vue.use(Router);

const router = new Router({
  mode: 'history',
  routes: [
    { path: '/', component: Index, name: 'root_path' },
    { path: '/expenses', component: Expense, name: 'expenses_path'},
    { path: '/questions', component: Question, name: 'questions_path'},
  ]
});

export default router;
