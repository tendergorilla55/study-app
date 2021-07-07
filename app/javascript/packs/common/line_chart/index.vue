<template>
  <div style="width:400px">
    <LineChart/>
  </div>
</template>

<script>
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
    components: {
      LineChart
    }
  };
</script>

<style scoped>

</style>
