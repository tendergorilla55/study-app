<template>
  <div>
    <h2>質問箱</h2>
    <a href="/">TOPに戻る</a>
    <p></p>
    <div class="container">
      <form>
        <div class="form-group">
          <div>
            <label>質問タイトル</label>
            <input type="text" v-model="question.title">
          </div>
          <div>
            <label>質問内容</label>
            <textarea type="text" v-model="question.content" id="content"></textarea>
          </div>
          <button type="button" class="btn btn-primary" v-on:click="postQuestion">質問する</button>
        </div>
      </form>
    </div>
    <ul>
      <li v-for="question in questions">
        <div >
          <p>
            {{ question.title }} {{ question.created_at | timeFormat }} {{ question.user.name }}
          </p>
          <p>
            {{ question.content }}
          </p>
          <router-link :to="{ name: 'question_path', params: { id: question.id }}">詳細</router-link>
        </div>
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
          title: null,
          content: null,
        },
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
      this.fetchQuestions();
    },
    methods: {
      fetchQuestions: function() {
        axios.get(`/questions.json`).then(res => {
          this.questions = res.data;
        }).catch(res => {
          alert('サーバーエラーが発生しました。');
          window.location.href = '/';
        });
      },
      postQuestion: function() {
        axios.post('/questions', {
          question: this.question,
        }).then(res => {
          this.question.id = res.data.id;
          this.question.title = "";
          this.question.content = "";
          this.fetchQuestions();
          if (res.data.status == "ng") {
            alert('質問を入力してください')
          }
        });
      },
    }
  }
</script>

<style scoped>

</style>
