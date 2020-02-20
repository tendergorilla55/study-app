import Vue from 'vue/dist/vue.esm'
import WeightRecord from '../weight_records/index.vue'

document.addEventListener('DOMContentLoaded', () => {
  document.body.appendChild(document.createElement('weight_record'));
  new Vue(WeightRecord).$mount('weight_record');
});
