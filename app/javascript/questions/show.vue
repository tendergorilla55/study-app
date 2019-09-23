<template>
  <div data-turbolinks="false">
    <p>
      {{ question.title }} {{ question.created_at | timeFormat }} {{ question.user["name"] }}
    </p>
    <p>
      {{ question.content }}
    </p>
  </div>
</template>

<script>
  import axios from 'axios'

  export default {
    data: function () {
      return {
        id: this.$route.params.id,
        question: {
          title: null,
          content: null,
          created_at: null,
          user: null,
        }
      }
    },
    filters: {
      timeFormat: function(time) {
        var date = time.split(/[-T:.]/);
        var fullDate = date[0] + "/" + date[1] + "/" + date[2];
        var fullTime = date[3] + ":" + date[4];
        return fullDate + " " + fullTime
      }
    },
    mounted: function() {
      this.fetchQustion(this.id);
    },
    methods: {
      fetchQustion: function(id) {
        axios.get(`/questions/${id}.json`).then( res => {
          this.question = res.data
        }).catch(res => {
          alert('データ取得できませんでした。');
          window.location.href = '/questions';
        });
      }
    }
  }
</script>

<style scoped>

</style>
