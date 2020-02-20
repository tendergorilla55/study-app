import Vue from 'vue'
import WeightRecord from '../weight_records/index.vue'

document.addEventListener('DOMContentLoaded', () => {
  document.body.appendChild(document.createElement('weight_record'));
  const app = new Vue(WeightRecord).$mount('weight_record');
});

