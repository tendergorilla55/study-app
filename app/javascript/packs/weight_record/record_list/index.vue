<template>
  <div>
    <h3>記録</h3>
    <table>
      <tr>
        <th>日付</th>
        <th>体重</th>
        <th>体脂肪率</th>
      </tr>
      <tr v-for="record in records">
        <td>{{ record.measuring_date }}</td>
        <td>{{ record.weight }}</td>
        <td>{{ record.fat_percentage }}</td>
      </tr>
    </table>
  </div>
</template>

<script>
  import axios from 'axios'

  export default {
    data: function() {
      return {
        records: [],
      }
    },
    mounted: function () {
      this.fetchRecords();
    },
    methods: {
      fetchRecords: function() {
        axios.get(`/weight_records.json`).then(res => {
          this.records = res.data;
        }).catch(res => {
          alert('サーバーエラーが発生しました。');
          window.location.href = '/';
        });
      },
    },
  };
</script>

<style scoped>

</style>
