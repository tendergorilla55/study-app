<template>
  <div>
    <h2>体重計測アプリ</h2>
    <a href="/">TOPに戻る</a>
    <div class="container">
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
    </div>
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
    <LineChart/>
<!--    <line-chart></line-chart>-->
  </div>
</template>

<script>
  import axios from 'axios'
  import { Line } from 'vue-chartjs'

  var LineChart = {
    extends: Line,
    mounted () {
      this.renderChart({
        //ラベル
        labels:["１月","２月","３月","４月"],
        //データ詳細
        datasets: [{
          //データタイトル
          label:'勉強時間',
          //データ
          data: [20,30,40,50],
          fill: false,
          borderColor: '#0000ff', //線の色
          pointBackgroundColor: '#0000ff', //点の色
        }]
      });
    }
  };

  export default {
    data: function () {
      return {
        records: [],
        record: {
          weight: null,
          fat_percentage: null,
          measuring_date: Date(),
        }
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
      postRecord: function() {
        axios.post('/weight_records', {
          record: this.record,
        }).then(res => {
          this.record.id = res.data.id;
          this.record.weight = "";
          this.record.fat_percentage = "";
          this.fetchRecords();
          if (res.data.status == "ng") {
            alert('質問を入力してください')
          }
        });
      }
    },
    components: {
      LineChart
    }
  }
</script>

<style scoped>

</style>
