<template>
  <div>
    <form>
      <div>
        <label>体重</label>
        <input type="number" step="0,1" v-model="record.weight">
      </div>
      <div>
        <label>体脂肪率</label>
        <input type="number" step="0.1" v-model="record.fat_percentage">
      </div>
      <input type="hidden" v-model="record.measuring_date">
      <button type="button" v-on:click="postRecord">記録する</button>
    </form>
    <record-list ref="list"></record-list>
  </div>
</template>

<script>
  import axios from 'axios'
  import recordList from '../record_list/index.vue';

  axios.defaults.headers.common = {
    'X-Requested-With': 'XMLHttpRequest',
    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
  };

  export default {
    components: {
      recordList,
    },
    data: function () {
      return {
        record: {
          weight: null,
          fat_percentage: null,
          measuring_date: Date(),
        }
      }
    },
    methods: {
      postRecord: function() {
        axios.post('/weight_records', {
          record: this.record,
        }).then(res => {
          this.record.id = res.data.id;
          this.record.weight = "";
          this.record.fat_percentage = "";
          this.$refs.list.fetchRecords();
          if (res.data.status == "ng") {
            alert('体重を入力してください')
          }
        }).catch(error => {
          console.log(error.response.data);
        });
      }
    }
  };
</script>

<style scoped>

</style>
