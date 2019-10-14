import Vue from 'vue/dist/vue.esm';
import Router from 'vue-router';
import QuestionIndex from '../questions/index.vue';
import QuestionShow from '../questions/show.vue';
import TodoListIndex from '../todo_lists/index.vue';
import Expense from '../components/expense.vue';

Vue.use(Router);

const router = new Router({
  mode: 'history',
  routes: [
    { path: '/expenses', component: Expense, name: 'expenses_path'},
    { path: '/questions', component: QuestionIndex, name: 'questions_path'},
    { path: '/questions/:id(\\d+)', component: QuestionShow, name: 'question_path' },
    { path: '/todo_lists', component: TodoListIndex, name: 'todo_lists_path' },
  ]
});

export default router;
