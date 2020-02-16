import Vue from 'vue/dist/vue.esm';
import Router from 'vue-router';
import QuestionIndex from '../questions/index.vue';
import QuestionShow from '../questions/show.vue';
import Expense from '../components/expense.vue';
import WeightRecordIndex from '../weight_records/index.vue';

Vue.use(Router);

const router = new Router({
  mode: 'history',
  routes: [
    { path: '/expenses', component: Expense, name: 'expenses_path'},
    { path: '/questions', component: QuestionIndex, name: 'questions_path'},
    { path: '/questions/:id(\\d+)', component: QuestionShow, name: 'question_path' },
    { path: '/weight_records', component: WeightRecordIndex, name: 'weight_records_path' }
  ]
});

export default router;
