import Vue from 'vue/dist/vue.esm'

// components
import appHeader from '../common/header/index.vue';
import inputRecord from './input_record/index.vue';
import lineChart from '../common/line_chart/index.vue';

new Vue({
  el: '#weight_records-index',
  components: {
    appHeader,
    inputRecord,
    lineChart,
  },
});
