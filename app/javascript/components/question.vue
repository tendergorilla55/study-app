<template>
  <div>
    <div class="container">
      <form>
        <div class="form-group">
          <label for="form_title">質問名</label>
          <input type="text" v-model="question.content" class="form-control" id="content">
          <button type="button" class="btn btn-primary" v-on:click="postQuestion">作成する</button>
        </div>
      </form>
    </div>
    <ul>
      <li v-for="question in questions">
        <p>{{ question.content }} {{ question.created_at }}</p>
      </li>
    </ul>
  </div>
</template>

<script>
  import axios from 'axios'

  export default {
    data: function () {
      return {
        questions: [],
        question: {
          content: null,
        },
      }
    },
    created: function() {
      // this.questions = questions
    },
    mounted: function() {
      this.fetchQuestions();
    },
    methods: {
      // fetchQuestions: function() {
      //   axios.get('/questions').then(res => {
      //     for(var i = 0; i < res.data.questions.length; i++) {
      //       this.questions.push(res.data.questions[i]);
      //     }
      //   }, (error) => {
      //     console.log(error);
      //   });
      // },
      fetchQuestions: function() {
        axios.get('/questions.json').then(res => {
          this.questions = res.data
        }).catch(res => {
          alert('サーバーエラーが発生しました。')
          window.location.href = '/';
        });
      },
      postQuestion: function() {
        axios.post('/questions', {
          question: this.question,
        }).then(res => {
          this.question.id = res.data.id;
          this.question.content = "";
          this.fetchQuestions();
        });
      },
    }
  }
</script>

<style scoped>

</style>
